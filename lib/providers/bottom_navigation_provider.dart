import 'package:absolute_news/widgets/categori_widget.dart';
import 'package:absolute_news/widgets/setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:absolute_news/widgets/home_widget.dart';
import 'package:absolute_news/widgets/profil_widget.dart';
import 'package:absolute_news/widgets/search_widget.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set setCurrentIndex(val) {
    _currentIndex = val;
    notifyListeners();
  }

  final List<IconData> _iconsBar = [
    Icons.home_rounded,
    Icons.category_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];
  List<IconData> get iconsBar => _iconsBar;

  final List _TitleBar = [
    'AbsoluteNews',
    'Kategori',
    'Pengaturan',
    'Profil',
    'Pencarian',
  ];
  List get titleBar => _TitleBar;

  final List _pages = const [
    HomeWidget(),
    CategoriWidget(),
    SettingWidget(),
    ProfilWidget(),
    SearchWidget(),
  ];
  List get pages => _pages;
}
