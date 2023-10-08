import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter7_1/contact.dart';
import 'package:flutter7_1/model.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  late ContactProvider _contactProvider;
  bool _areFieldsFilled = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _contactProvider = Provider.of<ContactProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            border: const Border(bottom: BorderSide(color: Colors.transparent)),
            padding: const EdgeInsetsDirectional.all(0),
            leading: CupertinoNavigationBarBackButton(
              previousPageTitle: "Lists",
              onPressed: () {},
            ),
            largeTitle: const Text('Contact'),
            trailing: CupertinoButton(
                onPressed: () {
                  _showEditBottomSheet(context);
                },
                child: const Icon(CupertinoIcons.add)),
          ),
          SliverFillRemaining(
              child: CupertinoListSection(
            backgroundColor: Colors.white,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: CupertinoSearchTextField(
                  controller: _searchController,
                  onChanged: (query) {},
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _contactProvider.contacts.length,
                itemBuilder: (context, index) {
                  final contact = _contactProvider.contacts[index];
                  return CupertinoListTile(
                    key: ValueKey(contact),
                    title: Text('${contact.firstName} ${contact.lastName}'),
                    subtitle: Text(contact.phoneNumber),
                    trailing: Row(
                      children: [
                        CupertinoButton(
                            onPressed: () {
                              _contactProvider.deleteContact(index);
                            },
                            child: const Icon(CupertinoIcons.delete)),
                        CupertinoButton(
                            onPressed: () {
                              _showEditBottomSheet(context, contact: contact);
                            },
                            child: const Icon(CupertinoIcons.pencil))
                      ],
                    ),
                  );
                },
              ),
            ],
          )),
        ],
      ),
    );
  }

  void _showEditBottomSheet(BuildContext context, {Contact? contact}) {
    final TextEditingController firstNameController =
        TextEditingController(text: contact?.firstName);
    final TextEditingController lastNameController =
        TextEditingController(text: contact?.lastName);
    final TextEditingController phoneController =
        TextEditingController(text: contact?.phoneNumber);
    void updateFieldsFilled() {
      setState(() {
        _areFieldsFilled = firstNameController.text.isNotEmpty &&
            lastNameController.text.isNotEmpty &&
            phoneController.text.isNotEmpty;
      });
    }

    showCupertinoModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              color: const Color.fromARGB(255, 247, 247, 247),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CupertinoButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancel",
                              style: TextStyle(color: Colors.blue)),
                        ),
                        const Text("New Contact",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        CupertinoButton(
                          onPressed: _areFieldsFilled
                              ? () {
                                  if (contact == null) {
                                    _contactProvider.addContact(Contact(
                                      firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      phoneNumber: phoneController.text,
                                    ));
                                  } else {
                                    contact.firstName =
                                        firstNameController.text;
                                    contact.lastName = lastNameController.text;
                                    contact.phoneNumber = phoneController.text;
                                    _contactProvider.updateContact(contact);
                                  }
                                  Navigator.of(context).pop();
                                }
                              : null,
                          child: Text("Done",
                              style: TextStyle(
                                color: _areFieldsFilled
                                    ? Colors.blue
                                    : Colors.grey,
                              )),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      height: 50,
                      child: CupertinoTextField(
                        controller: firstNameController,
                        placeholder: "First Name",
                        onChanged: (text) {
                          updateFieldsFilled();
                        },
                      )),
                  SizedBox(
                      height: 50,
                      child: CupertinoTextField(
                        controller: lastNameController,
                        placeholder: "Last Name",
                        onChanged: (text) {
                          updateFieldsFilled();
                        },
                      )),
                  SizedBox(
                      height: 50,
                      child: CupertinoTextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        placeholder: "Add Phone",
                        onChanged: (text) {
                          updateFieldsFilled();
                        },
                      )),
                ],
              ),
            );
          });
        });
  }
}
