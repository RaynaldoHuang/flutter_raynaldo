class Calculator {
  double Penambahan(double A1, double A2) => A1 + A2;
  double Pengurangan(double A1, double A2) => A1 - A2;
  double Perkalian(double A1, double A2) => A1 * A2;

  double divide(double A1, double A2) {
    if (A2 == 0) {
      print("Tidak bisa melakukan pembagian dengan nol.\n");
      return double.nan;
    }
    return A1 / A2;
  }
}

void main() {
  Calculator calculator = Calculator();

  double hasilPenjumlahan = calculator.Penambahan(5, 3);
  double hasilPengurangan = calculator.Pengurangan(10, 4);
  double hasilPerkalian = calculator.Perkalian(6, 40);

  double hasilPembagian = calculator.divide(8, 0);

  print("Hasil Penjumlahan: $hasilPenjumlahan");
  print("Hasil Pengurangan: $hasilPengurangan");
  print("Hasil Perkalian: $hasilPerkalian");
  print("Hasil Pembagian: $hasilPembagian");
}
