import 'package:flutter/material.dart';
import 'package:flutter_project/homepage..dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isButtonEnabled = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_checkIfButtonShouldBeEnabled);
    _passwordController.addListener(_checkIfButtonShouldBeEnabled);
    _loadSavedPreferences();
  }

  void _checkIfButtonShouldBeEnabled() {
    setState(() {
      _isButtonEnabled = _nameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  _loadSavedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userLoggedIn = prefs.getString('userLoggedIn');
    if (userLoggedIn == 'true') {
      _nameController.text = prefs.getString('name') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
      // Jika pengguna sudah login, arahkan ke HomePage
      Get.to(const HomePage());
    }
  }

  _savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userLoggedIn',
        'true'); // Gunakan kunci sebagai penanda user sudah login
    prefs.setString('name', _nameController.text);
    prefs.setString('password', _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: const Text(
          "Masuk ke Appsku",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Nama Lengkap",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                TextField(
                  controller: _nameController,
                  cursorColor: Colors.black,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                      hintText: "Masukkan Nama Lengkap"),
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Password",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  cursorColor: Colors.black,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  obscureText: true,
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                      hintText: "Masukkan Password"),
                ),
                const SizedBox(height: 16),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Text("Lupa password? "),
                        InkWell(
                            child: Text("Reset Password",
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    )),
                const SizedBox(height: 20),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.white,
                            elevation: 0,
                            backgroundColor: Colors.black),
                        onPressed: _isButtonEnabled
                            ? () {
                                _savePreferences();
                                Get.to(const HomePage());
                              }
                            : null,
                        child: const Text("Masuk",
                            style: TextStyle(fontSize: 18)))),
                const SizedBox(height: 20),
                const Text("Belum punya akun?"),
                const SizedBox(height: 16),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                color: Colors.black, width: 1)),
                        onPressed: () {},
                        child: const Text(
                          "Daftar Sekarang",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ))),
              ],
            )
          ],
        ),
      )),
    );
  }
}
