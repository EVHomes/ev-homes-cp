import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../navbar_pages/chat.dart';
import '../navbar_pages/dashboard.dart';
import '../navbar_pages/enquiry_form.dart';
import '../navbar_pages/home.dart';
import '../navbar_pages/tagging_form.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    // Your page widgets here
    const HomePage(),
    const DashboardPage(),
    const ClientReportPage(),
    const ChatPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  bool _isMenuVisible = false;

  void _toggleMenu() {
    setState(() {
      _isMenuVisible = !_isMenuVisible;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(

            child: _pages[_currentIndex]
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildNavItem(FluentIcons.home_20_regular, "Home", 0),
                _buildNavItem(FluentIcons.stack_20_regular, "Dashboard", 1),
                _buildNavItem(FluentIcons.tag_20_regular, "Tagging", 2),
                _buildNavItem(FluentIcons.chat_empty_20_regular, "Chat", 3),
              ],
            ),
          ),
        ),

      ],


    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,

            color: _currentIndex == index ? Colors.deepPurpleAccent : Colors.grey,
            weight: 0.5,
          ),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.normal,
              color: _currentIndex == index ? Colors.deepPurpleAccent : Colors.grey,
              fontSize: 12,

            ),
          ),
        ],
      ),
    );
  }
}