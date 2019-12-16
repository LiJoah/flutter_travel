import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_travel/store/index/index.dart';
import 'package:provider/provider.dart';

List<String> bottomNavPagePath = ["/home", "/journey", "/me"];

class BottomNavComponent extends StatelessWidget {
  BottomNavComponent();
  BottomNavigationBarItem _renderBottomNavBarItem(IconData icon, String text) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _renderBottomNavBar() {
    return [
      _renderBottomNavBarItem(Icons.home, "首页"),
      _renderBottomNavBarItem(Icons.calendar_today, "行程"),
      _renderBottomNavBarItem(Icons.person, "我的"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final IndexStore indexStore = Provider.of<IndexStore>(context);
    return Observer(
      builder: (_) {
        return BottomNavigationBar(
          items: _renderBottomNavBar(),
          currentIndex: indexStore.currentTabIndex,
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xff00E5EE),
          selectedIconTheme: IconThemeData(
            color: Color(0xff00E5EE),
          ),
          onTap: (int index) {
            indexStore.setCurrentTabIndex(index);
          },
        );
      },
    );
  }
}
