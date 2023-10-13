// ignore_for_file: sort_child_properties_last, unnecessary_const

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _showSubmittedData() {
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String email = _emailController.text;
    String message = _messageController.text;

    // Menampilkan data dalam alert
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Data yang Dikirim'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama Depan: $firstName'),
                Text('Nama Belakang: $lastName'),
                Text('Email: $email'),
                Text('Pesan: $message'),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                _firstNameController.clear();
                _lastNameController.clear();
                _emailController.clear();
                _messageController.clear();
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 10).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title:
            const Text("MyAPP", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(
              title: Text(
                "Contact Us",
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              title: Text("About Us", style: TextStyle(fontSize: 18)),
            ),
            ListTile(
              title: Text("Login", style: TextStyle(fontSize: 18)),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset(
              'assets/logo.png',
              width: 150,
            ),
            const SizedBox(height: 30),
            Lottie.asset('assets/animation1.json',
                frameRate: FrameRate(60), repeat: true),
            const SizedBox(height: 30),
            const Text(
              "Selamat Datang",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: Text(
                "Kami berkomitmen untuk mengantarkan produk pilihan Anda dengan aman dan tepat waktu",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange),
                    onPressed: () {},
                    child: const Text(
                      "Eksplorasi Aplikasi",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.orange)),
                    onPressed: () {},
                    child: const Text(
                      "Login Sekarang",
                      style: TextStyle(color: Colors.orange, fontSize: 16),
                    )),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                );
              },
              child: Container(
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                ),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.orange),
              ),
            ),
            const SizedBox(height: 10),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                    offset: Offset(0, _animation.value),
                    child: const Text("Klik atau scroll kebawah"));
              },
            ),
            const SizedBox(height: 90),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: [
                  const Text(
                    "Kontak Kami",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                  ),
                  const Text(
                    "Kami berkomitmen untuk mengantarkan produk pilihan Anda dengan aman dan tepat waktu",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text("Nama Depan*")),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              controller: _firstNameController,
                              decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  fillColor: Color.fromARGB(255, 241, 241, 241),
                                  filled: true),
                            ),
                          ),
                        ],
                      )),
                      const SizedBox(width: 10),
                      Expanded(
                          child: Column(
                        children: [
                          const Align(
                              alignment: Alignment.topLeft,
                              child: Text("Nama Belakang")),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: 50,
                            child: TextField(
                              controller: _lastNameController,
                              decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                  fillColor: Color.fromARGB(255, 241, 241, 241),
                                  filled: true),
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Align(
                      alignment: Alignment.topLeft, child: Text("Email*")),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          fillColor: Color.fromARGB(255, 241, 241, 241),
                          filled: true),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: Text("Ada yang kami bisa bantu?")),
                  const SizedBox(height: 5),
                  SizedBox(
                    child: TextField(
                      controller: _messageController,
                      maxLines: 10,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          fillColor: Color.fromARGB(255, 241, 241, 241),
                          filled: true),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: 50,
                  width: 100,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      onPressed: () {
                        _showSubmittedData();
                      },
                      child: const Text(
                        "Kirim",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                ),
              ),
            ),
            const SizedBox(height: 150),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Column(
                children: [
                  const Text(
                    "About Us",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                  ),
                  const Text(
                    "Kami berkomitmen untuk mengantarkan produk pilihan Anda dengan aman dan tepat waktu",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/kucingku.jpg"),
                                        fit: BoxFit.fill),
                                    color: Colors.amber,
                                  ),
                                  height: 150,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      right: 10, left: 10, bottom: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      Text("Kucing Anggora"),
                                      SizedBox(height: 10),
                                      Text("Rp.2.000.000",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/kucingku.jpg"),
                                        fit: BoxFit.fill),
                                    color: Colors.amber,
                                  ),
                                  height: 150,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      right: 10, left: 10, bottom: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      Text("Kucing Anggora"),
                                      SizedBox(height: 10),
                                      Text("Rp.2.000.000",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    _controller.dispose();
    super.dispose();
  }
}
