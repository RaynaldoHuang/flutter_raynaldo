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

double hitungDiskon(int totalHarga, double diskon) {
  return totalHarga * (1 - diskon);
}

void main() {
  List<String> barangBeli = ['buku', 'pensil', 'tas'];
  int totalHarga = TotalHarga(barangBeli);
  double diskon = 0.10;

  double totalHargaDiskon = hitungDiskon(totalHarga, diskon);

  print("Total Harga Barang yang Dibeli: Rp.$totalHarga");
  print("Total Harga Setelah Diskon dan harus dibayar: Rp.$totalHargaDiskon");
}
