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
}

class Balok extends BangunRuang {
  Balok(double panjang, double lebar, double tinggi)
      : super(panjang, lebar, tinggi);
}

void main() {
  Kubus kubus = Kubus(3.0);
  Balok balok = Balok(7.0, 5.0, 9.0);

  print("Volume Kubus: ${kubus.hitungVolume()}");
  print("Volume Balok: ${balok.hitungVolume()}");
}
