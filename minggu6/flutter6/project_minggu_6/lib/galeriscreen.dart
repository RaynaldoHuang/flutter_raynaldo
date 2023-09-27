import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_minggu_6/drawer.dart';
import 'package:project_minggu_6/pagebaru.dart';

class GaleriScreen extends StatefulWidget {
  const GaleriScreen({super.key});

  @override
  State<GaleriScreen> createState() => _GaleriScreenState();
}

class _GaleriScreenState extends State<GaleriScreen> {
  final List<String> gambarList = [
    'images/kucingku.jpg',
    'images/hamabr1.jpg',
    'images/spiderman.png',
    'images/beach.jpg',
  ];

  String selectedImage = '';

  void _showOptions(BuildContext context, int index) {
    selectedImage = gambarList[index];
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  selectedImage,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text("Gambar 1"),
              const Text("Apakah anda ingin melihat gambar ini?"),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Get.to(() => Page2(imagePath: selectedImage));
                        },
                        child: const Text("Ya")),
                    ElevatedButton(
                        onPressed: () => Get.back(),
                        child: const Text("Tidak")),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

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
      drawer: const MyDrawer(),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemCount: gambarList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _showOptions(context, index);
              },
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(
                  gambarList[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }
}
