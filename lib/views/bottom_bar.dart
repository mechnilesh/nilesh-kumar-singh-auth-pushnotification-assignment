// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shalontime/resources/constants/colors.dart';
import 'package:shalontime/views/home_screen.dart';
import 'package:shalontime/views/profile_screen.dart';

import 'bookings_screen.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  final ScrollController _homeController = ScrollController();
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = widget.index;
    super.initState();
  }

  final List<Widget> _listViewBody = [
    HomeScreen(),
    BookingsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listViewBody[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: whiteColor,
        elevation: 1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            activeIcon: Icon(Icons.other_houses),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            activeIcon: Icon(Icons.calendar_month_sharp),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Me',
            activeIcon: Icon(Icons.person_sharp),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey[300],
        onTap: (int index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
    );
  }
}
