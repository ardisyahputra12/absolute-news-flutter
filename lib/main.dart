import 'package:absolute_news/providers/bottom_navigation_provider.dart';
import 'package:absolute_news/providers/edit_profil_provider.dart';
import 'package:absolute_news/providers/first_screen_provider.dart';
import 'package:absolute_news/providers/data_provider.dart';
import 'package:absolute_news/providers/profil_provider.dart';
import 'package:absolute_news/providers/setting_provider.dart';
import 'package:absolute_news/screens/cover_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FirstScreenProvider()),
    ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider()),
    ChangeNotifierProvider(create: (_) => SettingProvider()),
    ChangeNotifierProvider(create: (_) => DataProvider()),
    ChangeNotifierProvider(create: (_) => ProfilProvider()),
    ChangeNotifierProvider(create: (_) => EditProfilProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<SettingProvider>(context);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: prov.switchValue ? prov.darkMode : prov.lightMode,
      home: const CoverScreen(),
    );
  }
}
