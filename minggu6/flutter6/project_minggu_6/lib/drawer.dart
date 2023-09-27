import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_minggu_6/contactscreen.dart';
import 'package:project_minggu_6/galeriscreen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(0))),
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Raynaldo"),
            accountEmail: Text("raynaldo@gmail.com"),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: AssetImage("images/haven.png"), fit: BoxFit.cover)),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image(image: AssetImage("images/kucingku.jpg")),
              ),
            ),
          ),
          ListTile(
            title: const Text('Galeri', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Kontak', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.of(context).pop();
              Get.to(const Contact());
            },
          ),
        ],
      ),
    );
  }
}
