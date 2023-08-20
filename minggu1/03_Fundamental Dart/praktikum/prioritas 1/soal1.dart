class Persegi {
  double sisi;

  Persegi(this.sisi);

  double hitungLuas() {
    return sisi * sisi;
  }

  double hitungKeliling() {
    return 4 * sisi;
  }
}

class PersegiPanjang {
  double panjang;
  double lebar;

  PersegiPanjang(this.panjang, this.lebar);

  double hitungLuas() {
    return panjang * lebar;
  }

  double hitungKeliling() {
    return 2 * (panjang + lebar);
  }
}

void main() {
  Persegi persegi = Persegi(5);
  print("Luas Persegi: ${persegi.hitungLuas()}");
  print("Keliling Persegi: ${persegi.hitungKeliling()}");

  PersegiPanjang persegiPanjang = PersegiPanjang(4, 6);
  print("Luas Persegi Panjang: ${persegiPanjang.hitungLuas()}");
  print("Keliling Persegi Panjang: ${persegiPanjang.hitungKeliling()}");
}
