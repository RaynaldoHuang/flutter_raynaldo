import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:prioritas1/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Contact> contacts = [];
  bool isEditing = false;
  int _editingIndex = -1;
  DateTime _dateTime = DateTime.now();
  Color selectedColor = Colors.black;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController nomorController = TextEditingController();

  void _addContact() {
    final String name = nameController.text;
    final String nomor = nomorController.text;

    if (name.isNotEmpty && nomor.isNotEmpty) {
      final newContact = Contact(
        name: name,
        nomor: nomor,
        dateTime: _dateTime,
        color: currentColor,
        fileName: '',
      );

      setState(() {
        if (isEditing) {
          contacts[_editingIndex] = newContact;
          isEditing = false;
          _editingIndex = -1;
        } else {
          contacts.add(newContact);
        }
        nameController.clear();
        nomorController.clear();
        _dateTime = DateTime.now();
        currentColor = Colors.black;
      });

      print(newContact.toString());
    }
  }

  Color pickerColor = const Color(0xff443a49);
  Color currentColor = Colors.black;

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  Future showPicker() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick a color!'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: currentColor,
            onColorChanged: changeColor,
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Got it'),
            onPressed: () {
              setState(() => currentColor = pickerColor);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // File yang dipilih
      PlatformFile file = result.files.first;
      String selectedFileName = file.name;
      if (isEditing) {
        // Jika sedang mengedit, set nama file untuk kontak yang sedang diedit
        setState(() {
          contacts[_editingIndex].fileName = selectedFileName;
        });
      }
      print('Path: ${file.path}');
      print('Nama File: ${file.name}');
      print('Ukuran File: ${file.size}');
    } else {
      // Tidak ada file yang dipilih
      print('Tidak ada file yang dipilih');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Contacts"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    const Icon(Icons.phone_android),
                    const SizedBox(height: 10),
                    const Text("Create New Contact"),
                    const SizedBox(height: 20),
                    const Text(
                      "A dialog is a type of modal window that appears in front of app content to provide critical information, or prompt for a decision to be made. ",
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          filled: true,
                          hintText: "Insert your name",
                          labelText: "Name",
                          fillColor: Color(0xffe7e0ec)),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: nomorController,
                      decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          filled: true,
                          hintText: "+62...",
                          labelText: "Nomor",
                          fillColor: Color(0xffe7e0ec)),
                    ),
                    ListTile(
                      title: const Text("Date"),
                      subtitle:
                          Text(DateFormat('dd-MM-yyyy').format(_dateTime)),
                      trailing: InkWell(
                          onTap: () async {
                            DateTime? pickedData = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100));
                            if (pickedData != null) {
                              setState(() {
                                _dateTime = pickedData;
                              });
                            } else {
                              // ignore: avoid_print
                              print("Not selected");
                            }
                          },
                          child: const Text("Select",
                              style: TextStyle(color: Colors.blue))),
                    ),
                    Container(height: 100, color: currentColor),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: currentColor,
                        ),
                        onPressed: () => showPicker(),
                        child: const Text("Pick Color")),
                    const SizedBox(height: 10),
                    const Align(
                        alignment: Alignment.topLeft, child: Text("Pick File")),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: _pickFile,
                        child: const Text("Pick & open file")),
                    const SizedBox(height: 10),
                    Align(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff6750a4),
                            ),
                            onPressed: _addContact,
                            child: const Text("Submit"))),
                    const SizedBox(height: 30),
                    const Text(
                      "List Contacts",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ListView.builder(
                shrinkWrap: true,
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xffe7e0ec),
                        child: Text(
                          "A",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      title: Text(contact.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(contact.nomor),
                          Text(
                              "Date = ${DateFormat('dd-MM-yyyy').format(contact.dateTime)}"),
                          Row(
                            children: [
                              const Text("Color ="),
                              const SizedBox(width: 5),
                              Container(
                                height: 12,
                                width: 12,
                                color: contact.color,
                              ),
                            ],
                          ),
                          Text("File name = ${contact.fileName}"),
                          SizedBox(height: 20)
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isEditing = true;
                                _editingIndex = index;
                                nameController.text = contact.name;
                                nomorController.text = contact.nomor;
                              });
                            },
                            icon: const Icon(Icons.edit),
                            color: Colors.black,
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                contacts.removeAt(index);
                              });
                            },
                            icon: const Icon(Icons.delete),
                            color: Colors.black,
                          )
                        ],
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
