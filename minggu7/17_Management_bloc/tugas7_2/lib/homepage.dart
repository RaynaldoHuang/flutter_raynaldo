import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas7_2/bloc/bloc/todo_bloc.dart';
import 'package:tugas7_2/model/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text("List Contact"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: IconButton(
                onPressed: () {
                  final state = UserListBloc(context).state;
                  final id = state.users.length + 1;
                  showBottomSheet(context: context, id: id);
                },
                icon: const Icon(Icons.add),
              ),
            )
          ],
        ),
        body: BlocBuilder<UserListBloc, UserListState>(
          builder: (context, state) {
            if (state is UserListUpdated && state.users.isNotEmpty) {
              final users = state.users;
              return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    return buildUserTile(context, user);
                  });
            } else {
              return const SizedBox(
                width: double.infinity,
                child: Center(child: Text("No users found")),
              );
            }
          },
        ),
      );

  Widget buildUserTile(BuildContext context, User user) {
    return ListTile(
      title: Text("${user.firstname}${user.lastname}"),
      subtitle: Text(user.phonenumber),
      trailing: Row(
        children: [
          IconButton(
              onPressed: () {
                UserListBloc(context).add(DeleteUser(user: user));
              },
              icon: const Icon(
                Icons.delete,
                size: 30,
                color: Colors.red,
              )),
          IconButton(
              onPressed: () {
                firstname.text = user.firstname;
                lastname.text = user.lastname;
                showBottomSheet(context: context, id: user.id, isEdit: true);
              },
              icon: const Icon(
                Icons.delete,
                size: 30,
                color: Colors.red,
              ))
        ],
      ),
    );
  }

  void showBottomSheet({
    required BuildContext context,
    bool isEdit = false,
    required int id,
  }) =>
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  buildTextField(controller: firstname, hint: "Firstname"),
                  buildTextField(controller: lastname, hint: "lastname"),
                  buildTextField(controller: phonenumber, hint: "phone number"),
                  ElevatedButton(
                      onPressed: () {
                        final user = User(
                          firstname: firstname.text,
                          lastname: lastname.text,
                          phonenumber: phonenumber.text,
                          id: id,
                        );
                        if (isEdit) {
                          UserListBloc(context).add(UpdateUser(user: user));
                        } else {
                          UserListBloc(context).add(AddUser(user: user));
                        }
                        Navigator.pop(context);
                      },
                      child: Text(isEdit ? 'update' : 'Add User'))
                ]),
              ),
            );
          });

  static Widget buildTextField({
    required TextEditingController controller,
    required String hint,
  }) =>
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hint,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
        ),
      );
}
