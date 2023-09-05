class Hewan {
  double berat;
  String nama;

  Hewan(this.nama, this.berat);
}

class Mobil {
  double kapasitas;
  List<Hewan> muatan = [];

  Mobil(this.kapasitas);

  double totalMuatan() {
    double totalBeratMuatan = 0;
    for (var hewan in muatan) {
      totalBeratMuatan += hewan.berat;
    }
    return totalBeratMuatan;
  }

  void tambahMuatan(Hewan hewan) {
    if (totalMuatan() + hewan.berat <= kapasitas) {
      muatan.add(hewan);
      print(
          "Hewan ${hewan.nama} dengan berat ${hewan.berat} kg ditambahkan ke dalam muatan.");
    } else {
      print(
          "Kapasitas muatan sudah penuh. ${hewan.nama} dengan berat ${hewan.berat} Kg tidak dapat di Angkut. \n");
    }
  }
}

void main() {
  Mobil mobil = Mobil(420);
  Hewan kambing = Hewan("kambing", 200);
  Hewan domba = Hewan("Domba", 220);
  Hewan rusa = Hewan("Rusa", 190);

  mobil.tambahMuatan(kambing);
  mobil.tambahMuatan(domba);
  mobil.tambahMuatan(rusa);

  print("Total Muatan di Mobil: ${mobil.totalMuatan()} kg");
}
