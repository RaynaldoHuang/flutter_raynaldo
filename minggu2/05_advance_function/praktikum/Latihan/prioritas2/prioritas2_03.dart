import 'dart:async';
import 'dart:io';

Future<void> main() async {
  stdout.write('Masukan nilai: ');
  String input = stdin.readLineSync() ?? '';

  try {
    int number = int.parse(input);
    int factorial = await calculateFactorial(number);
    print('faktorial dari $number adalah $factorial');
  } catch (e) {
    print('Input salah. Masukan nilai berupa angka dengan benar.');
  }
}

Future<int> calculateFactorial(int n) async {
  int result = 1;

  for (int i = 1; i <= n; i++) {
    result *= i;
    await Future.delayed(Duration(milliseconds: 100));
  }

  return result;
}
