// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shalontime/models/user_model.dart';

import 'package:shalontime/resources/constants/colors.dart';
import 'package:shalontime/view_models/auth_view_model.dart';
import 'package:shalontime/views/home_screen.dart';
import 'package:shalontime/views/profile_screen.dart';

import '../view_models/map_view_model.dart';
import '../view_models/user_side_view_models/home_screen_view_model.dart';
import 'bookings_screen.dart';

class AppBottomBarPage extends StatefulWidget {
  const AppBottomBarPage({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  State<AppBottomBarPage> createState() => _AppBottomBarPageState();
}

class _AppBottomBarPageState extends State<AppBottomBarPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = widget.index;
    context.read<MapViewModel>().getCurrentLocation(context);
    super.initState();
  }

  final List<Widget> _listViewBody = [
    const HomeScreen(),
    const BookingsScreen(),
    const ProfileScreen(),
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
