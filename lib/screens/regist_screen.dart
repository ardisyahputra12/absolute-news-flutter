import 'package:absolute_news/providers/first_screen_provider.dart';
import 'package:absolute_news/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class RegistScreen extends StatelessWidget {
  const RegistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<FirstScreenProvider>(context);
    const uuid = Uuid();

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
                      TextField(
                        controller: prov.email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          errorText: prov.emailIsEmpty
                              ? 'Wajib diisi!'
                              : prov.emailTypeIsEmpty
                                  ? "Gunakan '@', Wajib berisi email!"
                                  : null,
                          labelText: 'Email',
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
                        maxLength: 20,
                        controller: prov.username,
                        decoration: InputDecoration(
                          errorText: prov.usernameIsEmpty
                              ? 'Wajib lebih dari 3 karakter!'
                              : null,
                          labelText: 'Nama Pengguna',
                        ),
                        onChanged: (val) {
                          val.length < 3
                              ? prov.setUsernameIsEmpty = true
                              : prov.setUsernameIsEmpty = false;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        maxLength: 20,
                        controller: prov.password,
                        obscureText: prov.hidePassword,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          errorText: prov.passwordIsEmpty
                              ? 'Wajib lebih dari 5 karakter!'
                              : null,
                          suffixIcon: IconButton(
                            onPressed: () {
                              prov.setHidePassword = !prov.hidePassword;
                            },
                            icon: prov.hidePassword
                                ? const Icon(Icons.visibility_rounded)
                                : const Icon(Icons.visibility_off_rounded),
                          ),
                          labelText: 'Kata Sandi',
                        ),
                        onChanged: (val) {
                          val.length < 5
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
                                prov.username.text.length < 3 ||
                                prov.password.text.length < 5
                            ? null
                            : () {
                                prov.users.add([
                                  uuid.v4(),
                                  prov.email.text,
                                  prov.username.text,
                                  prov.password.text,
                                  '-',
                                  '-',
                                  '-',
                                  '-',
                                  '-',
                                  XFile(''),
                                ]);

                                prov.email.clear();
                                prov.username.clear();
                                prov.password.clear();
                                prov.setEmailIsEmpty = false;
                                prov.setEmailTypeIsEmpty = false;
                                prov.setUsernameIsEmpty = false;
                                prov.setPasswordIsEmpty = false;
                                prov.setHidePassword = true;

                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                  (route) => false,
                                );
                              },
                        child: const Text(
                          'Daftar',
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
                          'Sudah punya akun?',
                          style: TextStyle(fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {
                            prov.email.clear();
                            prov.username.clear();
                            prov.password.clear();
                            prov.setEmailIsEmpty = false;
                            prov.setEmailTypeIsEmpty = false;
                            prov.setUsernameIsEmpty = false;
                            prov.setPasswordIsEmpty = false;
                            prov.setHidePassword = true;

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Silahkan Masuk',
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
