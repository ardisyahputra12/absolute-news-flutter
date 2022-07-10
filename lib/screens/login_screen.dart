import 'package:absolute_news/providers/bottom_navigation_provider.dart';
import 'package:absolute_news/providers/data_provider.dart';
import 'package:absolute_news/providers/first_screen_provider.dart';
import 'package:absolute_news/providers/profil_provider.dart';
import 'package:absolute_news/screens/home_screen.dart';
import 'package:absolute_news/screens/regist_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<FirstScreenProvider>(context);
    final provData = Provider.of<DataProvider>(context, listen: false);
    final provBottomNav = Provider.of<BottomNavigationBarProvider>(context);
    final provProfil = Provider.of<ProfilProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 60,
          ),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  './assets/images/logo.png',
                  width: 140,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 80),
                  child: Column(
                    children: [
                      prov.loginError == true
                          ? ListTile(
                              title: const Text(
                                'Email atau kata sandi salah.',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              tileColor: Colors.red.withOpacity(0.2),
                              leading: const Icon(Icons.error_rounded),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            )
                          : Container(),
                      const SizedBox(height: 20),
                      TextField(
                        controller: prov.email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          errorText: prov.emailIsEmpty
                              ? 'Wajib diisi!'
                              : prov.emailTypeIsEmpty
                                  ? "Gunakan '@', Wajib berisi email!"
                                  : null,
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
                      const SizedBox(height: 20),
                      TextField(
                        obscureText: prov.hidePassword,
                        obscuringCharacter: '*',
                        controller: prov.password,
                        decoration: InputDecoration(
                          labelText: 'Kata Sandi',
                          suffixIcon: IconButton(
                            onPressed: () {
                              prov.setHidePassword = !prov.hidePassword;
                            },
                            icon: prov.hidePassword
                                ? const Icon(Icons.visibility_rounded)
                                : const Icon(Icons.visibility_off_rounded),
                          ),
                          errorText:
                              prov.passwordIsEmpty ? 'Wajib diisi!' : null,
                        ),
                        onChanged: (val) {
                          val.isEmpty
                              ? prov.setPasswordIsEmpty = true
                              : prov.setPasswordIsEmpty = false;
                        },
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 250,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: prov.email.text.isEmpty ||
                                !prov.email.text.contains('@') ||
                                prov.password.text.isEmpty
                            ? null
                            : () {
                                if (prov.users.isNotEmpty) {
                                  for (var i = 0; i < prov.users.length; i++) {
                                    if (prov.users[i][1] == prov.email.text &&
                                        prov.users[i][3] ==
                                            prov.password.text) {
                                      prov.email.clear();
                                      prov.password.clear();
                                      prov.setLoginError = false;
                                      prov.setEmailIsEmpty = false;
                                      prov.setEmailTypeIsEmpty = false;
                                      prov.setPasswordIsEmpty = false;
                                      prov.setHidePassword = true;

                                      provBottomNav.setCurrentIndex = 0;

                                      provProfil.setId = prov.users[i][0];
                                      provProfil.setEmail = prov.users[i][1];
                                      provProfil.setUserName = prov.users[i][2];
                                      provProfil.setPassword = prov.users[i][3];
                                      provProfil.setName = prov.users[i][4];
                                      provProfil.setGender = prov.users[i][5];
                                      provProfil.setBirthday = prov.users[i][6];
                                      provProfil.setPhone = prov.users[i][7];
                                      provProfil.setAddress = prov.users[i][8];
                                      provProfil.setPhoto = prov.users[i][9];

                                      provData.fecthData('general', '1');

                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeScreen(),
                                        ),
                                        (route) => false,
                                      );

                                      break;
                                    } else {
                                      prov.setLoginError = true;
                                    }
                                  }
                                } else {
                                  prov.setLoginError = true;
                                }
                              },
                        child: const Text(
                          'Masuk',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Tidak punya akun?',
                          style: TextStyle(fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {
                            prov.email.clear();
                            prov.password.clear();
                            prov.setLoginError = false;
                            prov.setEmailIsEmpty = false;
                            prov.setEmailTypeIsEmpty = false;
                            prov.setPasswordIsEmpty = false;
                            prov.setHidePassword = true;

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegistScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Silahkan Daftar',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.cyan,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
