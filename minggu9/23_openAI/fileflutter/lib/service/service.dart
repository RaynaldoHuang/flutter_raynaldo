import 'package:fileflutter/constants/open_ai.dart';
import 'package:fileflutter/screen/generate.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HandphoneService with ChangeNotifier {
  final Dio _dio = Dio();
  TextEditingController harga = TextEditingController();
  TextEditingController kamera = TextEditingController();
  TextEditingController penyimpanan = TextEditingController();

  Future<void> makeApiRequest(BuildContext context) async {
    _dio.options = BaseOptions(
      baseUrl: 'https://api.openai.com/v1/',
      headers: {
        'Authorization': 'Bearer $apiKey',
      },
    );
    try {
      final response = await _dio.post(
        'completions',
        data: {
          "model": "text-davinci-003",
          "prompt":
              "Berikan saya rekomendasi hp dengan rentang harga $harga, kamera $kamera MP, dan penyimpanan $penyimpanan GB",
          "temperature": 0.4,
          "max_tokens": 900,
          "top_p": 1,
          "frequency_penalty": 0,
          "presence_penalty": 0,
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        print(responseData);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HasilGenerate(responseData: responseData),
          ),
        );
      } else {
        print('Gagal memuat API: ${response.statusCode}');
      }
    } catch (error) {
      print('Pesan Error: $error');
    }
  }
}
