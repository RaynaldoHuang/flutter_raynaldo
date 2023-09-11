import 'dart:io';

void main() {
  List<int> values = readInputValues();
  int average = calculateRoundedAverage(values);
  print('Sample output: $average');
}

List<int> readInputValues() {
  List<int> values = [];

  print('Masukan nilai (ketik "done" kalau sudah selesai input data):');

  while (true) {
    String input = stdin.readLineSync()!;
    if (input.toLowerCase() == 'done') {
      break;
    }

    try {
      int value = int.parse(input);
      values.add(value);
    } catch (e) {
      print(
          'input salah. Masukan nilai dengan benar dan ketik "done" kalau sudah selesai.');
    }
  }

  return values;
}

int calculateRoundedAverage(List<int> values) {
  if (values.isEmpty) {
    return 0; // Return 0 if the list is empty
  }

  int sum = 0;
  for (int value in values) {
    sum += value;
  }

  double average = sum / values.length;
  int roundedAverage = average.ceil();

  return roundedAverage;
}
