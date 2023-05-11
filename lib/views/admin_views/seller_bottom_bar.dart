import 'package:flutter/material.dart';

import 'package:shalontime/resources/constants/colors.dart';
import 'package:shalontime/views/admin_views/seller_home_screen.dart';
import 'package:shalontime/views/admin_views/seller_profile_screen.dart';
import 'package:shalontime/views/admin_views/seller_schedule_screen.dart';
import 'package:shalontime/widgets/seller_widgets/time_slot_bookings.dart';

class SellerBottomBarPage extends StatefulWidget {
  const SellerBottomBarPage({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  @override
  State<SellerBottomBarPage> createState() => _SellerBottomBarPageState();
}

class _SellerBottomBarPageState extends State<SellerBottomBarPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = widget.index;
    super.initState();
  }

  final List<Widget> _listViewBody = [
    SellerHomeScreen(),
    SellerScheduleScreen(),
    SellerProfileScreen(),
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
            icon: Icon(Icons.event_busy_outlined),
            activeIcon: Icon(Icons.event_busy),
            label: 'Schedules',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings_outlined),
            activeIcon: Icon(Icons.admin_panel_settings_rounded),
            label: 'Me',
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
