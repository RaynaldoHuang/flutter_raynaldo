import 'dart:ui';

class Contact {
  late final String name;
  late final String nomor;
  late final DateTime dateTime;
  late final Color color;
  late final String fileName;

  Contact({
    required this.name,
    required this.nomor,
    required this.dateTime,
    required this.color,
    required this.fileName,
  });

  @override
  String toString() {
    return 'Contact { name: $name, nomor: $nomor, dateTime: $dateTime, color: $color, fileName: $fileName }';
  }
}
