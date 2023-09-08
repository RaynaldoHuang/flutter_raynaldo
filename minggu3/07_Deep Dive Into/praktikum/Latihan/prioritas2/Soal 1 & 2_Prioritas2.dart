/// JAWABAN UNTUK SOAL 1 DAN 2 PRIORITAS 2:
///
class Matematika {
  int hasil() {
    return 0;
  }
}

class KelipatanPersekutuanTerkecil implements Matematika {
  int x;
  int y;

  KelipatanPersekutuanTerkecil(this.x, this.y);

  @override
  int hasil() {
    return (x * y) ~/ kelipatanPersekutuan(x, y);
  }

  int kelipatanPersekutuan(int a, int b) {
    if (a == 0 || b == 0) return 0;
    while (b != 0) {
      var t = b;
      b = a % b;
      a = t;
    }
    return a;
  }
}

class FaktorPersekutuanTerbesar implements Matematika {
  int x;
  int y;

  FaktorPersekutuanTerbesar(this.x, this.y);

  @override
  int hasil() {
    return faktorPersekutuan(x, y);
  }

  int faktorPersekutuan(int a, int b) {
    while (b != 0) {
      var t = b;
      b = a % b;
      a = t;
    }
    return a;
  }
}

void main() {
  Matematika kpk = KelipatanPersekutuanTerkecil(9, 7);
  Matematika fpb = FaktorPersekutuanTerbesar(12, 4);

  print("Kelipatan Persekutuan Terkecil: ${kpk.hasil()}");
  print("Faktor Persekutuan Terbesar: ${fpb.hasil()}");
}
