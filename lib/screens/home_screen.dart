import 'package:absolute_news/providers/bottom_navigation_provider.dart';
import 'package:absolute_news/providers/data_provider.dart';
import 'package:absolute_news/providers/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provBottomNav = Provider.of<BottomNavigationBarProvider>(context);
    final provSetting = Provider.of<SettingProvider>(context);
    final provData = Provider.of<DataProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(provBottomNav.titleBar[provBottomNav.currentIndex]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        child: const Icon(Icons.search_rounded),
        onPressed: () {
          provBottomNav.setCurrentIndex = 4;
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: provBottomNav.iconsBar,
        activeIndex: provBottomNav.currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        backgroundColor:
            provSetting.switchValue ? Colors.black : Colors.blueGrey,
        activeColor: Colors.cyan,
        inactiveColor: Colors.white,
        onTap: (val) {
          provBottomNav.setCurrentIndex = val;
        },
      ),
      body: provBottomNav.currentIndex == 0
          ? RefreshIndicator(
              onRefresh: () async {
                provData.setIsFetchError = false;
                provData.data.clear();
                return await provData.fecthData('general', '1');
              },
              child: SingleChildScrollView(
                child: provBottomNav.pages[provBottomNav.currentIndex],
              ),
            )
          : provBottomNav.currentIndex == 1
              ? provBottomNav.pages[provBottomNav.currentIndex]
              : SingleChildScrollView(
                  child: provBottomNav.pages[provBottomNav.currentIndex],
                ),
    );
  }
}
