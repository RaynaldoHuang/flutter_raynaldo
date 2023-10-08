import 'package:flutter/material.dart';
import 'package:flutter7_1/contact.dart';

class ContactProvider extends ChangeNotifier {
  final List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  void addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void editContact(int index, Contact newContact) {
    _contacts[index] = newContact;
    notifyListeners();
  }

  void updateContact(Contact updatedContact) {
    // Temukan indeks kontak yang ingin diperbarui dalam daftar _contacts
    int contactIndex =
        _contacts.indexWhere((contact) => contact == updatedContact);

    if (contactIndex != -1) {
      // Perbarui kontak pada indeks yang ditemukan dengan kontak yang diperbarui
      _contacts[contactIndex] = updatedContact;

      // Memberi tahu listener bahwa terjadi perubahan pada daftar kontak
      notifyListeners();
    }
  }

  void deleteContact(int index) {
    _contacts.removeAt(index);
    notifyListeners();
  }
}
