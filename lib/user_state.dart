import 'package:flutter/foundation.dart';

class UserState extends ChangeNotifier {
  String _firstName = "Some";
  String _lastName = "Some";

  String get firstName => _firstName;
  String get lastName => _lastName;

  void changeFirstName(String name) {
    _firstName = name;
    notifyListeners();
  }

  void changeLastName(String name) {
    _lastName = name;
    notifyListeners();
  }
}