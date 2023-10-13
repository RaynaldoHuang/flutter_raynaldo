import 'package:flutter/material.dart';
import 'package:flutter_project/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _fullName = '';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  // final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userLoggedIn = prefs.getString('userLoggedIn');

    if (userLoggedIn == 'true') {
      setState(() {
        _fullName = prefs.getString('name') ?? '';
      });
    } else {
      Navigator.pushReplacement(
        context as BuildContext,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  _clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      _fullName = '';
      _nameController.clear();
      _phoneNumberController.clear();
    });
  }

  // _showEditContactDialog(BuildContext context, Contact contact) {
  //   TextEditingController nameController =
  //       TextEditingController(text: contact.name);
  //   TextEditingController phoneNumberController =
  //       TextEditingController(text: contact.phoneNumber);

  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Edit Contact'),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             TextField(
  //               controller: nameController,
  //               decoration: const InputDecoration(labelText: 'Name'),
  //             ),
  //             TextField(
  //               controller: phoneNumberController,
  //               decoration: const InputDecoration(labelText: 'Phone Number'),
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('Cancel'),
  //           ),
  //           TextButton(
  //             onPressed: () async {
  //               contact.name = nameController.text;
  //               contact.phoneNumber = phoneNumberController.text;
  //               await _databaseHelper.updateContact(contact);
  //               setState(() {
  //                 // Update UI if necessary
  //               });
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('Save'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 1,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hi, $_fullName",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
              InkWell(
                onTap: () async {
                  await _clearUserData();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text("Log Out",
                    style: TextStyle(color: Colors.black, fontSize: 16)),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                // for (var contact in contacts!)
                ListTile(
                  title: Text("contact.name"),
                  subtitle: Text("adasd"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          // _databaseHelper.deleteContact(contact.id!);
                          setState(() {
                            // contacts.remove(contact);
                          });
                        },
                        child: Icon(Icons.delete),
                      ),
                      const SizedBox(width: 16),
                      InkWell(
                        onTap: () {
                          // _showEditContactDialog(context, contact);
                        },
                        child: Icon(Icons.edit),
                      ),
                    ],
                  ),
                  iconColor: Colors.black,
                )
              ],
            ),
          ),
        ));
  }
}
        

// class Contact {
//   int? id;
//   String name;
//   String phoneNumber;

//   Contact({this.id, required this.name, required this.phoneNumber});

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'phoneNumber': phoneNumber,
//     };
//   }
// }

// class DatabaseHelper {
//   static Database? _database;
//   static const String tableName = 'contacts';

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await initDatabase();
//     return _database!;
//   }

//   Future<Database> initDatabase() async {
//     return openDatabase(
//       join(await getDatabasesPath(), 'contacts_database.db'),
//       onCreate: (db, version) {
//         return db.execute(
//           'CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, phoneNumber TEXT)',
//         );
//       },
//       version: 1,
//     );
//   }

//   Future<int> insertContact(Contact contact) async {
//     Database db = await database;
//     return await db.insert(tableName, contact.toMap());
//   }

//   Future<List<Contact>> getContacts() async {
//     Database db = await database;
//     List<Map<String, dynamic>> maps = await db.query(tableName);
//     return List.generate(maps.length, (i) {
//       return Contact(
//         id: maps[i]['id'],
//         name: maps[i]['name'],
//         phoneNumber: maps[i]['phoneNumber'],
//       );
//     });
//   }

//   Future<int> updateContact(Contact contact) async {
//     Database db = await database;
//     return await db.update(
//       tableName,
//       contact.toMap(),
//       where: 'id = ?',
//       whereArgs: [contact.id],
//     );
//   }

//   Future<int> deleteContact(int id) async {
//     Database db = await database;
//     return await db.delete(
//       tableName,
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }
// }
