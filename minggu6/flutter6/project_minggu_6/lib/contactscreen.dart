import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: true,
        title: const Text("Google Foto"),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              child: ClipOval(
                child: Image(image: AssetImage("images/kucingku.jpg")),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                "L",
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text("Leanne Graham"),
            subtitle: Text("1-770-736-8031 x56442"),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                "E",
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text("Ervin Howell"),
            subtitle: Text("010-692-6593 x09125"),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                "C",
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text("Clementine Bauch"),
            subtitle: Text("1-463-123-4447"),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                "P",
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text("Patricia Lebsack"),
            subtitle: Text("493-170-9623 x156"),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                "C",
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text("Chelsey Dietrich"),
            subtitle: Text("(247)954-1289"),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                "M",
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text("Mrs. Dennis Schulist"),
            subtitle: Text("1-477-935-8478 x6430"),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                "K",
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text("Kurtis Weissnat"),
            subtitle: Text("210.067.6132"),
          ),
        ],
      ),
    );
  }
}
