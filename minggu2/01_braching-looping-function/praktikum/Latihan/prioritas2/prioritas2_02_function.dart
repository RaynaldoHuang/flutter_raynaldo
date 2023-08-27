BigInt faktorial(int n) {
  if (n <= 1) {
    return BigInt.from(1);
  } else {
    return BigInt.from(n) * faktorial(n - 1);
  }
}

void main() {
  List<int> nilai = [10, 40, 50];

  for (int n in nilai) {
    BigInt hasilFaktorial = faktorial(n);
    print("Faktorial dari $n adalah $hasilFaktorial");
  }
}
