import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CuperPage extends StatelessWidget {
  const CuperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      backgroundColor: Colors.black,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Color.fromARGB(255, 31, 31, 31),
        middle: Text(
          "CupertinoApp",
          style: TextStyle(color: Colors.white),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text("This is CupertinoApp",
                style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}
