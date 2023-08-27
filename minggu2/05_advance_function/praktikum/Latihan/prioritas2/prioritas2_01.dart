void main() {
  List<List<int>> dataList = [
    [1, 10],
    [2, 20],
    [3, 30],
    [4, 40],
    [5, 50],
  ];

  Map<int, int> dataMap = Map.fromIterable(
    dataList,
    key: (item) => item[0],
    value: (item) => item[1],
  );

  print(dataMap);
}
