import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SVGProvider with ChangeNotifier {
  final Dio dio = Dio();
  TextEditingController nameController = TextEditingController();
  String? image;

  Future<void> svgImage() async {
    try {
      final response = await dio.get(
          'https://api.dicebear.com/7.x/initials/svg?seed=${nameController.text}');
      image = response.data;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
