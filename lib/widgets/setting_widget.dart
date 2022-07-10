import 'package:absolute_news/providers/edit_profil_provider.dart';
import 'package:absolute_news/providers/profil_provider.dart';
import 'package:absolute_news/providers/setting_provider.dart';
import 'package:absolute_news/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:cool_alert/cool_alert.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<SettingProvider>(context);
    final profilProv = Provider.of<ProfilProvider>(context);
    final editProv = Provider.of<EditProfilProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Column(
            children: [
              SwitchListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                tileColor: Colors.blueGrey.withOpacity(0.2),
                selectedTileColor: Colors.blueGrey.withOpacity(0.2),
                title: const Text('Tema'),
                secondary: prov.switchValue
                    ? const Icon(Icons.dark_mode)
                    : const Icon(Icons.light_mode),
                value: prov.switchValue,
                selected: prov.switchValue,
                onChanged: (val) {
                  prov.setSwitchValue = val;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey.withOpacity(0.2),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Cek Pembaruan Aplikasi'),
                        leading: const Icon(Icons.change_circle),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () {
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.info,
                            title: 'Pembaruan aplikasi',
                            text: 'Anda sudah di versi terbaru.',
                            confirmBtnText: 'Tutup',
                            loopAnimation: true,
                            confirmBtnColor: Colors.cyan,
                          );
                        },
                      ),
                      const Divider(indent: 60),
                      ListTile(
                        title: const Text('Beri Rating di PlayStore'),
                        leading: const Icon(Icons.star_rounded),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () {
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.confirm,
                            title: 'Beri rating',
                            text: 'Anda akan diarahkan ke aplikasi playstore.',
                            cancelBtnText: 'Batal',
                            confirmBtnText: 'Oke',
                            showCancelBtn: true,
                            loopAnimation: true,
                            cancelBtnTextStyle:
                                const TextStyle(color: Colors.cyan),
                            confirmBtnColor: Colors.cyan,
                          );
                        },
                      ),
                      const Divider(indent: 60),
                      ListTile(
                        title: const Text('Tentang'),
                        leading: const Icon(Icons.info_rounded),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () {
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.info,
                            title: 'Tentang AbsoluteNews',
                            text:
                                'Aplikasi ini menyediakan berita dari berbagai sumber media. Aktifkan koneksi internet Anda agar aplikasi dapat menampilkan berita. Saat ini berita yang dimuat masih terbatas, aplikasi hanya dapat melakukan pengambilan data atau melakukan pencarian sebanyak 500 kali per hari.',
                            confirmBtnText: 'Tutup',
                            confirmBtnColor: Colors.cyan,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey.withOpacity(0.2),
                ),
                child: ListTile(
                  title: const Text('Keluar'),
                  leading: const Icon(Icons.logout_rounded),
                  onTap: () {
                    CoolAlert.show(
                      context: context,
                      type: CoolAlertType.warning,
                      title: 'Keluar?',
                      text: 'Anda akan keluar dari akun ini.',
                      cancelBtnText: 'Batal',
                      confirmBtnText: 'Oke',
                      showCancelBtn: true,
                      loopAnimation: true,
                      cancelBtnTextStyle: const TextStyle(color: Colors.cyan),
                      confirmBtnColor: Colors.cyan,
                      onConfirmBtnTap: () {
                        profilProv.setId = '';
                        profilProv.setEmail = '-';
                        profilProv.setUserName = '-';
                        profilProv.setPassword = '-';
                        profilProv.setName = '-';
                        profilProv.setGender = '';
                        profilProv.setBirthday = '-';
                        profilProv.setPhone = '-';
                        profilProv.setAddress = '-';
                        profilProv.setPhoto = XFile('');

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 50),
            child: Column(
              children: [
                const Text('Hubungi Pengembang'),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Image.asset(
                        './assets/images/icons8-email-64.png',
                        width: 25,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Image.asset(
                        './assets/images/icons8-globe-30.png',
                        width: 25,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Image.asset(
                        './assets/images/icons8-whatsapp-30.png',
                        width: 25,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Image.asset(
                        './assets/images/icons8-instagram-30.png',
                        width: 25,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Image.asset(
                        './assets/images/icons8-facebook-50.png',
                        width: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Text('AbsoluteNews v1.0'),
        ],
      ),
    );
  }
}
