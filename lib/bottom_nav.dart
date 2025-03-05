import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internship/profile.dart';
import 'package:internship/rewards.dart';
import 'home.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    RewardsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.orange,
      systemNavigationBarColor: Colors.orange,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),

        bottomNavigationBar: Container(
          height: 65, // Reduced height for bottom navigation bar
          decoration: BoxDecoration(
            color: Colors.orange,
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            backgroundColor: Colors.orange,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 0), // Adjust spacing
                  child: Icon(Icons.home, size: 30), // Reduced icon size
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Icon(CupertinoIcons.layers_alt_fill, size: 30),
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Icon(Icons.person, size: 30),
                ),
                label: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
