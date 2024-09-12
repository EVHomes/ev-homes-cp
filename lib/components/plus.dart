import 'package:ev_homes_crm_v7/components/nav_bar.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../navbar_pages/enquiry_form.dart';
import '../navbar_pages/tagging_form.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool _isMenuVisible = false;

  void _toggleMenu() {
    setState(() {
      _isMenuVisible = !_isMenuVisible;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Your main content goes here
          const Center(child: NavBar()),
          // Additional Buttons

          if (_isMenuVisible) ...[
            Positioned(
              bottom: 170.0, // Position above the FAB
              right: 16.0,
              child: AnimatedOpacity(
                opacity: _isMenuVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent),
                  onPressed: () {
                    // Navigate to the Client Tagging Form page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ClientTaggingForm()),
                    );
                  },
                  child: const Text(
                    'Client Tagging Form',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 220.0, // Position above the Client Tagging Form button
              right: 16.0,
              child: AnimatedOpacity(
                opacity: _isMenuVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent),
                  onPressed: () {
                    // Navigate to the Enquiry Form page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EnquiryForm()),
                    );
                  },
                  child: const Text(
                    'Enquiry Form',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],

          Positioned(
            bottom: 100.0,
            right: 20.0,
            child: FloatingActionButton(
              backgroundColor: Colors.deepPurpleAccent,
              elevation: 10,
              onPressed: _toggleMenu,
              tooltip: 'Add',
              child: const Icon(
                FluentIcons.add_24_regular,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}