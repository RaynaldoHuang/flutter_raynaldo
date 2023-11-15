import 'package:fileflutter/service/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final hasil = Provider.of<HandphoneService>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          "Phone Recommendations",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4,
                margin: const EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: hasil.harga,
                        keyboardType: TextInputType.phone,
                        maxLength: 20,
                        decoration: const InputDecoration(
                          labelText: 'Budget',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          helperText: "Berapa Budget kamu?",
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: hasil.kamera,
                        keyboardType: TextInputType.phone,
                        maxLength: 20,
                        decoration: const InputDecoration(
                          labelText: 'Camera (MP)',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          helperText:
                              "Berapa mega pixel kamera yang kamu inginkan?",
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: hasil.penyimpanan,
                        keyboardType: TextInputType.phone,
                        maxLength: 20,
                        decoration: const InputDecoration(
                          labelText: 'Internal Storage',
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          helperText:
                              "Berapa internal storage yang kamu inginkan?",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  hasil.makeApiRequest(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  elevation: 4,
                ),
                child: const Text(
                  "GET RECOMMENDATIONS",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
