import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilProvider extends ChangeNotifier {
  final ImagePicker _imagePicker = ImagePicker();

  XFile _photo = XFile('');
  XFile get photo => _photo;
  set setPhoto(val) {
    _photo = val;
    notifyListeners();
  }

  editPhoto(bool isGallery) async {
    try {
      var res = await _imagePicker.pickImage(
        source: isGallery == true ? ImageSource.gallery : ImageSource.camera,
      );

      if (res != null) {
        setPhoto = res;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  bool _hidePassword = true;
  bool get hidePassword => _hidePassword;
  set setHidePassword(val) {
    _hidePassword = val;
    notifyListeners();
  }

  String _id = '';
  String get id => _id;
  set setId(val) {
    _id = val;
    notifyListeners();
  }

  TextEditingController _userName = TextEditingController();
  TextEditingController get userName => _userName;
  set setUserName(val) {
    _userName.text = val;
    notifyListeners();
  }

  TextEditingController _email = TextEditingController();
  TextEditingController get email => _email;
  set setEmail(val) {
    _email.text = val;
    notifyListeners();
  }

  TextEditingController _name = TextEditingController();
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

  DateTime _birthday = DateTime.now().subtract(const Duration(days: 3652));
  DateTime get birthday => _birthday;
  set setBirthday(val) {
    _birthday = val;
    notifyListeners();
  }

  TextEditingController _phone = TextEditingController();
  TextEditingController get phone => _phone;
  set setPhone(val) {
    _phone.text = val;
    notifyListeners();
  }

  TextEditingController _address = TextEditingController();
  TextEditingController get address => _address;
  set setAddress(val) {
    _address.text = val;
    notifyListeners();
  }

  TextEditingController _password = TextEditingController();
  TextEditingController get password => _password;
  set setPassword(val) {
    _password.text = val;
    notifyListeners();
  }
}
