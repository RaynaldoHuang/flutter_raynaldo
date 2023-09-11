import 'package:flutter/material.dart';
import 'package:project/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 61, 61, 61),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu));
        }),
        title: const Text(
          "Material App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: const MyDrawer(),
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 43, 43, 43),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.green,
              ),
              label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
