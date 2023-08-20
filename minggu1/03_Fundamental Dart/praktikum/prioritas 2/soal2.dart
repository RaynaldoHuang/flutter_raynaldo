import 'dart:math';

double hitungVolumeTabung(double jariJari, double tinggi) {
  return pi * pow(jariJari, 2) * tinggi;
}

void main() {
  double jariJari = 5;
  double tinggi = 10;

  double volume = hitungVolumeTabung(jariJari, tinggi);
  print("Volume Tabung: $volume");
}
