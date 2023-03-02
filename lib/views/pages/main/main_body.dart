// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/app_controller.dart';
import '../../i18n/generated_locales/l10n.dart';
import '../home/index.dart';
import 'quotes_app.dart';

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  final controller = Get.find<AppController>();

  int _selectedIndex = 0;
  final pageController = PageController();
  final bodyList = [HomePage(), Container()];

  _onItemTapped(int index) {
    switch (index) {
      case 2:
        drawerController.toggle!();
        break;

      default:
        pageController.jumpToPage(index);
        setState(() {
          _selectedIndex = index;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(
        title: const Text("Main screen"),
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            drawerController.toggle!();
          },
        ),
      ),
      // backgroundColor: Colors.white,
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: bodyList, // No sliding
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppLocalizations.current.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Tìm kiếm",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: AppLocalizations.current.other,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
