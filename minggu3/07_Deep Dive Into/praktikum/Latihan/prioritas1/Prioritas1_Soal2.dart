class BangunRuang {
  double lebar;
  double panjang;
  double tinggi;

  BangunRuang(this.lebar, this.panjang, this.tinggi);

  double hitungVolume() {
    return panjang * lebar * tinggi;
  }
}

class Kubus extends BangunRuang {
  double sisi;

  Kubus(this.sisi) : super(sisi, sisi, sisi);

  @override
  double hitungVolume() {
    return sisi * sisi * sisi;
  }
}

class Balok extends BangunRuang {
  Balok(double panjang, double lebar, double tinggi)
      : super(panjang, lebar, tinggi);

  @override
  double hitungVolume() {
    return panjang * lebar * tinggi;
  }
}

void main() {
  BangunRuang bangun = Kubus(3.0);
  print("Volume Kubus: ${bangun.hitungVolume()}");

  bangun = Balok(7.0, 5.0, 9.0);
  print("Volume Balok: ${bangun.hitungVolume()}");
}
