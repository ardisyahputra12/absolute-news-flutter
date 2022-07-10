import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FirstScreenProvider extends ChangeNotifier {
  bool _loadScreen = true;
  bool get loadScreen => _loadScreen;
  set setLoadScreen(val) {
    _loadScreen = val;
    notifyListeners();
  }

  bool _hidePassword = true;
  bool get hidePassword => _hidePassword;
  set setHidePassword(val) {
    _hidePassword = val;
    notifyListeners();
  }

  List _users = [
    [
      '0000',
      'user01@gmail.com',
      'user_01',
      'user01',
      '-',
      '-',
      '-',
      '-',
      '-',
      XFile(''),
    ],
  ];
  List get users => _users;

  void deleteUser(userId) {
    _users = _users.where((user) => user[0] != userId).toList();
    notifyListeners();
  }

  TextEditingController _email = TextEditingController();
  TextEditingController get email => _email;
  set setEmail(val) {
    _email = val;
    notifyListeners();
  }

  TextEditingController _username = TextEditingController();
  TextEditingController get username => _username;
  set setUsername(val) {
    _username = val;
    notifyListeners();
  }

  TextEditingController _password = TextEditingController();
  TextEditingController get password => _password;
  set setpassword(val) {
    _password = val;
    notifyListeners();
  }

  bool _emailIsEmpty = false;
  bool get emailIsEmpty => _emailIsEmpty;
  set setEmailIsEmpty(val) {
    _emailIsEmpty = val;
    notifyListeners();
  }

  bool _emailTypeIsEmpty = false;
  bool get emailTypeIsEmpty => _emailTypeIsEmpty;
  set setEmailTypeIsEmpty(val) {
    _emailTypeIsEmpty = val;
    notifyListeners();
  }

  bool _usernameIsEmpty = false;
  bool get usernameIsEmpty => _usernameIsEmpty;
  set setUsernameIsEmpty(val) {
    _usernameIsEmpty = val;
    notifyListeners();
  }

  bool _passwordIsEmpty = false;
  bool get passwordIsEmpty => _passwordIsEmpty;
  set setPasswordIsEmpty(val) {
    _passwordIsEmpty = val;
    notifyListeners();
  }

  bool _loginError = false;
  bool get loginError => _loginError;
  set setLoginError(val) {
    _loginError = val;
    notifyListeners();
  }
}
