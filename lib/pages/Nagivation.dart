import 'package:book_store/pages/cartpage.dart';
import 'package:book_store/pages/favorite.dart';
import 'package:book_store/pages/homepage.dart';
import 'package:book_store/pages/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
class PracticeBottomNavBar extends StatefulWidget {
  const PracticeBottomNavBar({super.key});
  @override
  State<PracticeBottomNavBar> createState() => _PracticeBottomNavBarState();}
class _PracticeBottomNavBarState extends State<PracticeBottomNavBar> {
  List list = [
    HomePage(),
    ProfilePage(),
    CartPage(),
    Favorite(),
  ];
  List<Icon> allItems = [
    Icon(Icons.home,color: Colors.black,),
    Icon(Icons.person,color: Colors.black,),
    Icon(Icons.book,color: Colors.black,),
    Icon(Icons.favorite,color: Colors.black,)
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.grey,

        buttonBackgroundColor: Color(0xff0096c7),
        index: _currentIndex,
        onTap: (int index) {
          _currentIndex = index;
          setState(() {});
        },
        items: allItems,
      ),
    );
  }
}