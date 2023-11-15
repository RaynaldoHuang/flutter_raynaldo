import 'package:flutter/material.dart';

class HasilGenerate extends StatelessWidget {
  final Map<String, dynamic> responseData;

  const HasilGenerate({Key? key, required this.responseData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<dynamic> pilihan = responseData['pilihan'] ?? [];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hasil Generate",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: pilihan.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(pilihan[index]['text'],
                        textAlign: TextAlign.justify),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
