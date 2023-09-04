String cekNilai(int nilai) {
  if (nilai > 70) {
    return "Nilai A";
  } else if (nilai > 40) {
    return "Nilai B";
  } else if (nilai > 0) {
    return "Nilai C";
  } else {
    return "";
  }
}

void main() {
  int nilaiMahasiswa = 85;
  String hasilCek = cekNilai(nilaiMahasiswa);
  print("Hasil pengecekan nilai: $hasilCek");
}
