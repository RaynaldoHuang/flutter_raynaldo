import 'dart:io';

void main(List<String> args) {
  int tinggi = 8;

  for (int i = 1; i <= tinggi; i++) {
    for (int j = 1; j <= 2 * tinggi - 1; j++) {
      if (j >= tinggi - i + 1 && j <= tinggi + i - 1)
        stdout.write("* ");
      else
        stdout.write("  ");
    }
    print("");
  }
}
