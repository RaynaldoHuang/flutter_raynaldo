import 'dart:io';

void main() {
  print("Masukkan sebuah angka: ");
  int angka = int.parse(stdin.readLineSync()!);

  print("Tabel Perkalian $angka:");
  for (int i = 1; i <= 10; i++) {
    int hasil = angka * i;
    print("$angka x $i = $hasil");
  }
}
