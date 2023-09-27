import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_minggu_6/contactscreen.dart';
import 'package:project_minggu_6/galeriscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const GaleriScreen(),
    );
  }
}
