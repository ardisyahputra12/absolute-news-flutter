import 'dart:io';
import 'package:absolute_news/providers/edit_profil_provider.dart';
import 'package:absolute_news/providers/first_screen_provider.dart';
import 'package:absolute_news/providers/profil_provider.dart';
import 'package:absolute_news/widgets/icon_button_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfilScreen extends StatelessWidget {
  const EditProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<FirstScreenProvider>(context);
    final profilProv = Provider.of<ProfilProvider>(context);
    final editProv = Provider.of<EditProfilProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: editProv.photo.path.isNotEmpty
                        ? FileImage(File(editProv.photo.path))
                        : const AssetImage('./assets/images/logo.png')
                            as ImageProvider,
                  ),
                  const SizedBox(height: 5),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            actionsPadding:
                                const EdgeInsets.only(bottom: 25, top: 10),
                            title: const Text('Ambil foto dari?'),
                            actionsAlignment: MainAxisAlignment.spaceAround,
                            actions: [
                              IconButtonProfileWidget(
                                isGallery: true,
                                icon: Icons.photo_library_rounded,
                                title: 'Album Foto',
                              ),
                              IconButtonProfileWidget(
                                isGallery: false,
                                icon: Icons.photo_camera_rounded,
                                title: 'Kamera',
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      'Ubah Foto',
                      style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: editProv.userName,
                decoration: InputDecoration(
                  label: const Text('Nama Pengguna'),
                  prefixIcon: const Icon(Icons.person_pin),
                  errorText: prov.usernameIsEmpty
                      ? 'Wajib lebih dari 2 karakter!'
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onChanged: (val) {
                  val.length < 3
                      ? prov.setUsernameIsEmpty = true
                      : prov.setUsernameIsEmpty = false;
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: editProv.email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: const Text('Email'),
                  prefixIcon: const Icon(Icons.email_rounded),
                  errorText: prov.emailIsEmpty
                      ? 'Wajib diisi!'
                      : prov.emailTypeIsEmpty
                          ? "Gunakan '@', Wajib berisi email!"
                          : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onChanged: (val) {
                  val.isEmpty
                      ? prov.setEmailIsEmpty = true
                      : prov.setEmailIsEmpty = false;

                  !val.contains('@')
                      ? prov.setEmailTypeIsEmpty = true
                      : prov.setEmailTypeIsEmpty = false;
                },
              ),
              const Divider(height: 70),
              TextField(
                controller: editProv.name,
                decoration: InputDecoration(
                  label: const Text('Nama'),
                  prefixIcon: const Icon(Icons.person_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 55,
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'Jenis Kelamin',
                    prefixIcon: const Icon(Icons.male_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      focusColor: Colors.transparent,
                      items: const [
                        DropdownMenuItem(
                          child: Text('Pilih Jenis Kelamin'),
                          value: '-',
                        ),
                        DropdownMenuItem(
                          child: Text('Pria'),
                          value: 'Pria',
                        ),
                        DropdownMenuItem(
                          child: Text('Wanita'),
                          value: 'Wanita',
                        ),
                      ],
                      value: editProv.gender,
                      onChanged: (val) {
                        editProv.setGender = val;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: TextEditingController(
                  text: editProv.birthday.toString().substring(0, 10),
                ),
                readOnly: true,
                decoration: InputDecoration(
                  label: const Text('Tanggal Lahir'),
                  prefixIcon: const Icon(Icons.date_range_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onTap: () async {
                  var date = await showDatePicker(
                    context: context,
                    initialDate: editProv.birthday,
                    firstDate: DateTime(1922),
                    lastDate: DateTime.now().subtract(
                      const Duration(days: 3652),
                    ),
                  );

                  if (date != null) {
                    editProv.setBirthday = date;
                  }
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: editProv.phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  label: const Text('Telepon'),
                  prefixIcon: const Icon(Icons.phone_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: editProv.address,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  label: const Text('Alamat'),
                  prefixIcon: const Icon(Icons.home_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              const Divider(height: 70),
              TextField(
                controller: editProv.password,
                obscureText: editProv.hidePassword,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.security_rounded),
                  suffixIcon: IconButton(
                    onPressed: () {
                      editProv.setHidePassword = !editProv.hidePassword;
                    },
                    icon: editProv.hidePassword
                        ? const Icon(Icons.visibility_rounded)
                        : const Icon(Icons.visibility_off_rounded),
                  ),
                  label: const Text('Kata Sandi'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  errorText: prov.passwordIsEmpty
                      ? 'Wajib lebih dari 4 karakter!'
                      : null,
                ),
                onChanged: (val) {
                  val.length < 5
                      ? prov.setPasswordIsEmpty = true
                      : prov.setPasswordIsEmpty = false;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 130,
                      height: 34,
                      child: OutlinedButton(
                        onPressed: () {
                          editProv.setId = profilProv.id;
                          editProv.setUserName = profilProv.userName.text;
                          editProv.setEmail = profilProv.email.text;
                          editProv.setName = profilProv.name.text;
                          editProv.setGender = profilProv.gender;
                          editProv.setBirthday = profilProv.birthday.text == '-'
                              ? editProv.birthday
                              : DateTime.parse(profilProv.birthday.text);
                          editProv.setPhone = profilProv.phone.text;
                          editProv.setAddress = profilProv.address.text;
                          editProv.setPassword = profilProv.password.text;
                          editProv.setPhoto = profilProv.photo;

                          editProv.setHidePassword = true;
                          editProv.setBirthday = DateTime.now().subtract(
                            const Duration(days: 3652),
                          );
                          prov.setEmailIsEmpty = false;
                          prov.setEmailTypeIsEmpty = false;
                          prov.setUsernameIsEmpty = false;
                          prov.setPasswordIsEmpty = false;

                          Navigator.pop(context);
                        },
                        child: const Text('Batal'),
                        style: OutlinedButton.styleFrom(
                          primary: Colors.cyan,
                          side: const BorderSide(color: Colors.cyan),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 130,
                      height: 34,
                      child: ElevatedButton(
                        onPressed: editProv.email.text.isEmpty ||
                                !editProv.email.text.contains('@') ||
                                editProv.userName.text.length < 3 ||
                                editProv.password.text.length < 5
                            ? null
                            : () {
                                profilProv.setUserName = editProv.userName.text;
                                profilProv.setEmail = editProv.email.text;
                                profilProv.setName = editProv.name.text.isEmpty
                                    ? '-'
                                    : editProv.name.text;
                                profilProv.setGender = editProv.gender;
                                profilProv.setBirthday = editProv.birthday
                                    .toString()
                                    .substring(0, 10);
                                profilProv.setPhone =
                                    editProv.phone.text.isEmpty
                                        ? '-'
                                        : editProv.phone.text;
                                profilProv.setAddress =
                                    editProv.address.text.isEmpty
                                        ? '-'
                                        : editProv.address.text;
                                profilProv.setPassword = editProv.password.text;
                                profilProv.setPhoto = editProv.photo;

                                for (var i = 0; i < prov.users.length; i++) {
                                  if (prov.users[i][0] == editProv.id) {
                                    prov.users[i][1] = editProv.email.text;
                                    prov.users[i][2] = editProv.userName.text;
                                    prov.users[i][3] = editProv.password.text;
                                    prov.users[i][4] = editProv.name.text;
                                    prov.users[i][5] = editProv.gender;
                                    prov.users[i][6] = editProv.birthday
                                        .toString()
                                        .substring(0, 10);
                                    prov.users[i][7] = editProv.phone.text;
                                    prov.users[i][8] = editProv.address.text;
                                    prov.users[i][9] = editProv.photo;
                                  }
                                }

                                editProv.setHidePassword = true;
                                editProv.setBirthday = DateTime.now().subtract(
                                  const Duration(days: 3652),
                                );
                                Navigator.pop(context);
                              },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text('Simpan'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
