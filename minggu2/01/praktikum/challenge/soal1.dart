int TotalHarga(List<String> barangBeli) {
  Map<String, int> hargaBarang = {
    'buku': 10000,
    'pensil': 5000,
    'tas': 100000,
  };

  int totalHarga = 0;
  for (String barang in barangBeli) {
    totalHarga += hargaBarang[barang] ?? 0;
  }
  return totalHarga;
}

void main() {
  List<String> barangBeli = ['buku', 'pensil', 'tas'];
  int totalHarga = TotalHarga(barangBeli);
  print("Total Harga Barang yang Dibeli: $totalHarga rupiah");
}
