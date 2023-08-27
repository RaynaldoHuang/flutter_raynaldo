Future<List<int>> multiplyList(List<int> data, int multiplier) async {
  List<int> results = [];

  await Future.forEach(data, (int element) async {
    int multipliedValue = element * multiplier;
    results.add(multipliedValue);
  });

  return results;
}

void main() async {
  List<int> dataList = [1, 2, 3, 4, 5];
  int multiplierValue = 10;

  List<int> resultList = await multiplyList(dataList, multiplierValue);
  print(resultList);
}
