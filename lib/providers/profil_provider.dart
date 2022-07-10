import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilProvider extends ChangeNotifier {
  XFile _photo = XFile('');
  XFile get photo => _photo;
  set setPhoto(val) {
    _photo = val;
    notifyListeners();
  }

  String _id = '';
  String get id => _id;
  set setId(val) {
    _id = val;
    notifyListeners();
  }

  TextEditingController _userName = TextEditingController(text: '-');
  TextEditingController get userName => _userName;
  set setUserName(val) {
    _userName.text = val;
    notifyListeners();
  }

  TextEditingController _email = TextEditingController(text: '-');
  TextEditingController get email => _email;
  set setEmail(val) {
    _email.text = val;
    notifyListeners();
  }

  TextEditingController _name = TextEditingController(text: '-');
  TextEditingController get name => _name;
  set setName(val) {
    _name.text = val;
    notifyListeners();
  }

  String _gender = '-';
  String get gender => _gender;
  set setGender(val) {
    _gender = val;
    notifyListeners();
  }

  TextEditingController _birthday = TextEditingController(text: '-');
  TextEditingController get birthday => _birthday;
  set setBirthday(val) {
    _birthday.text = val;
    notifyListeners();
  }

  TextEditingController _phone = TextEditingController(text: '-');
  TextEditingController get phone => _phone;
  set setPhone(val) {
    _phone.text = val;
    notifyListeners();
  }

  TextEditingController _address = TextEditingController(text: '-');
  TextEditingController get address => _address;
  set setAddress(val) {
    _address.text = val;
    notifyListeners();
  }

  TextEditingController _password = TextEditingController(text: '-');
  TextEditingController get password => _password;
  set setPassword(val) {
    _password.text = val;
    notifyListeners();
  }
}
