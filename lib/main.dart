import 'package:flutter/material.dart';

import 'pages/points_page.dart';
import 'pages/help_page.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';

void main() {
  runApp(const TungPointsApp());
}

class TungPointsApp extends StatefulWidget {
  const TungPointsApp({super.key});

  @override
  State<TungPointsApp> createState() => _TungPointsAppState();
}

class _TungPointsAppState extends State<TungPointsApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    PointsPage(),
    HelpPage(),
    AboutPage(),
    ContactPage(),
  ];

  final List<String> _titles = const [
    'Points',
    'Help',
    'About',
    'Contact',
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Master Tung Points',

      /// 🌿 V2 THEME
      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          surface: Colors.white,
        ),

        scaffoldBackgroundColor: Colors.white,

        appBarTheme: const AppBarTheme(
          centerTitle: false,
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          elevation: 0,
        ),

        /// 📖 MEDICAL READING TYPOGRAPHY
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            height: 1.3,
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            height: 1.35,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            height: 1.55,
          ),
          bodySmall: TextStyle(
            fontSize: 15,
            height: 1.5,
          ),
        ),
      ),

      home: Scaffold(
        appBar: AppBar(
          title: Text(_titles[_selectedIndex]),
        ),
        body: _pages[_selectedIndex],

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.grain),
              label: 'Points',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help_outline),
              label: 'Help',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: 'About',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail),
              label: 'Contact',
            ),
          ],
        ),
      ),
    );
  }
}
