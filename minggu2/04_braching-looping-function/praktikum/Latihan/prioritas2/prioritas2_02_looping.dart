import 'dart:io';

void main() {
  int n = 6;

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < i; j++) {
      stdout.write(" ");
    }
    for (int k = 1; k <= (n - i) * 2 - 1; k++) {
      stdout.write("0");
    }
    stdout.writeln();
  }
  for (int i = n - 2; i >= 0; i--) {
    for (int j = 0; j < i; j++) {
      stdout.write(" ");
    }
    for (int k = 1; k <= (n - i) * 2 - 1; k++) {
      stdout.write("0");
    }
    stdout.writeln();
  }
}
