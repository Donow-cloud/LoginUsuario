import 'package:flutter/material.dart';
import 'package:traveler_app/Screens/account.dart';
import 'package:traveler_app/Screens/add.dart';
import 'package:traveler_app/Screens/map.dart';
import 'package:traveler_app/Screens/setting.dart';
import 'package:traveler_app/Screens/travel_creator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  Widget page(int index) {
    switch (index) {
      case 0:
        return TravelCreator();
      case 1:
        return Maps();
      case 2:
        return Add();
      case 3:
        return Settings();
      case 4:
        return Account();
        break;
      default:
        return TravelCreator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page(_index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) {
          _index = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        backgroundColor: Colors.blueGrey[600],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 35),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map, size: 35),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 35),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 35),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 35),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
