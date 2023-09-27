import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  final String imagePath;

  Page2({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
