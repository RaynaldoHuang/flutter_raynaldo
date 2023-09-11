import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 61, 61, 61),
      child: ListView(
        children: const [
          ListTile(
            title: Text('Home', style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            title: Text('Setting', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
