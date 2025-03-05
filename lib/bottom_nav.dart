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

  // Define routes that will be displayed within the bottom nav
  final Map<int, Widget> _screens = {
    0: HomePage(),
    1: RewardPage(),
    2: ProfilePage(),
  };

  Widget _currentScreen = HomePage(); // Default screen

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _currentScreen = _screens[index]!;
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: _currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.orange,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.layers_alt_fill, size: 30),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: "",
          ),
        ],
      ),
    );
  }
}
