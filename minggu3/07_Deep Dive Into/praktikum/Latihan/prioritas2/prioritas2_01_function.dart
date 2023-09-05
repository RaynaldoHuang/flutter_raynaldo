import 'dart:math';

double hitungLuasLingkaran(double jariJari) {
  return pi * jariJari * jariJari;
}

void main() {
  double jariJari = 10;

  double luas = hitungLuasLingkaran(jariJari);
  print("Luas lingkaran dengan jari-jari $jariJari adalah $luas");
}
