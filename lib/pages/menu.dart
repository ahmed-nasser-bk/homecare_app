import 'package:flutter/material.dart';
import 'bookingPage.dart';
import 'notificationPage.dart';
import 'profilePage.dart';
import 'homePage.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          HomePage(),
          BookingPage(),
          NotificationPage(),
          ProfilePage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedIconTheme: const IconThemeData(color: Colors.cyan, size: 28),
        selectedItemColor: Colors.cyan,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int newIndex) {
          setState(() {
            _pageController.jumpToPage(newIndex);
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'الحجوزات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'الإشعارات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'أنا',
          ),
        ],
      ),
    );
  }
}