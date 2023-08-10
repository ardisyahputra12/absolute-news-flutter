import 'package:absolute_news/providers/first_screen_provider.dart';
import 'package:absolute_news/screens/login_screen.dart';
import 'package:absolute_news/screens/regist_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class CoverScreen extends StatelessWidget {
  const CoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<FirstScreenProvider>(context);

    return prov.loadScreen == true
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(80),
              child: Center(
                child: TweenAnimationBuilder(
                  curve: Curves.slowMiddle,
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(seconds: 3),
                  builder: (context, double value, _) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          './assets/images/logo.png',
                          width: 140,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: 220,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 50),
                                child: LinearProgressIndicator(
                                  value: value,
                                  color: Colors.cyan,
                                  backgroundColor: Colors.blueGrey,
                                ),
                              ),
                            ),
                            const Text(
                              'Versi 1.0',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                  onEnd: () {
                    Timer(const Duration(seconds: 3), () {
                      prov.setLoadScreen = false;
                    });
                  },
                ),
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              margin: const EdgeInsets.only(
                top: 60,
                bottom: 50,
                right: 30,
                left: 30,
              ),
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 60,
                right: 30,
                left: 30,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      './assets/images/logo.png',
                      width: 140,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 250,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Masuk',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.cyan,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          width: 250,
                          height: 40,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegistScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Daftar',
                              style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 16,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.cyan),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
