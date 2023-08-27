import 'dart:io';
import 'dart:math';

bool isPrime(int n) {
  if (n <= 1) {
    return false;
  }

  for (int i = 2; i <= sqrt(n); i++) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  stdout.writeln("Masukkan sebuah angka: ");
  int angka = int.parse(stdin.readLineSync()!);

  if (isPrime(angka)) {
    print("bilangan prima");
  } else {
    print("bukan bilangan prima");
  }
}
