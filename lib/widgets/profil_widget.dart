import 'dart:io';
import 'package:absolute_news/providers/edit_profil_provider.dart';
import 'package:absolute_news/providers/first_screen_provider.dart';
import 'package:absolute_news/providers/profil_provider.dart';
import 'package:absolute_news/screens/cover_screen.dart';
import 'package:absolute_news/screens/edit_profile_screen.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ProfilWidget extends StatelessWidget {
  const ProfilWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<FirstScreenProvider>(context);
    final profilProv = Provider.of<ProfilProvider>(context);
    final editProv = Provider.of<EditProfilProvider>(context);
    const uuid = Uuid();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: profilProv.photo.path.isNotEmpty
                  ? FileImage(File(profilProv.photo.path))
                  : const AssetImage('./assets/images/logo.png')
                      as ImageProvider,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25, bottom: 7),
            child: Text(
              'Informasi Akun',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Column(
            children: [
              TextField(
                controller: profilProv.userName,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Nama Pengguna',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: profilProv.email,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 7),
            child: Text(
              'Informasi Pengguna',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Column(
            children: [
              TextField(
                controller: profilProv.name,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: TextEditingController(text: profilProv.gender),
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Jenis Kelamin',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: profilProv.birthday,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Tanggal Lahir',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: profilProv.phone,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Telepon',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: profilProv.address,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Alamat',
                ),
              ),
            ],
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
                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.warning,
                        title: 'Hapus Akun',
                        text: 'Apakah Anda yakin akan menghapus akun ini?',
                        cancelBtnText: 'Batal',
                        confirmBtnText: 'Oke',
                        showCancelBtn: true,
                        loopAnimation: true,
                        cancelBtnTextStyle: const TextStyle(color: Colors.cyan),
                        confirmBtnColor: Colors.cyan,
                        onConfirmBtnTap: () {
                          prov.deleteUser(profilProv.id);

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CoverScreen(),
                            ),
                            (route) => false,
                          );
                        },
                      );
                    },
                    child: const Text('Hapus Akun'),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.red,
                      side: const BorderSide(color: Colors.red),
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

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfilScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text('Edit Profil'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
