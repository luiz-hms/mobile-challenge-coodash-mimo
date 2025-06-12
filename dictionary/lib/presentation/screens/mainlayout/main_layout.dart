import 'package:dictionary/presentation/screens/mainlayout/favorite.dart';
import 'package:dictionary/presentation/screens/mainlayout/history.dart';
import 'package:dictionary/presentation/screens/mainlayout/home.dart';
import 'package:dictionary/presentation/widgets/bottom_navigation_bar_item/bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const List<Widget> _pages = <Widget>[Home(), History(), Favorite()];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomBarItem(
            icon: Icon(Icons.home, color: Color(0xff151419)),
            label: "Home",
          ),
          BottomBarItem(
            icon: Icon(Icons.history, color: Color(0xff151419)),
            label: "Histórico",
          ),
          BottomBarItem(
            icon: Icon(Icons.favorite, color: Colors.red),
            label: "Favoritos",
          ),
        ],
        onTap: _onItemTapped,
      ),
      body: Center(child: _pages.elementAt(_selectedIndex)),
    );
  }
}
