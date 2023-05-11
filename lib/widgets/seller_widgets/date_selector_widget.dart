import 'package:flutter/material.dart';
import 'package:shalontime/resources/constants/colors.dart';

class SellerHorizontalDateSelector extends StatefulWidget {
  const SellerHorizontalDateSelector({super.key});

  @override
  SellerHorizontalDateSelectorState createState() =>
      SellerHorizontalDateSelectorState();
}

class SellerHorizontalDateSelectorState
    extends State<SellerHorizontalDateSelector> {
  static const int itemCount =
      121; // show 60 previous days + current day + 60 upcoming days
  int _selectedIndex = 60; // index of the current day
  final ScrollController _scrollController =
      ScrollController(); // add ScrollController

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _scrollToSelected(); // call the scroll method
  }

  void _scrollToSelected() {
    _scrollController.animateTo(
      _selectedIndex * 60.0, // scroll position based on the selected index
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelected();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: SingleChildScrollView(
        // replace the SizedBox with SingleChildScrollView
        scrollDirection: Axis.horizontal,
        controller: _scrollController, // add the ScrollController
        child: Row(
          // replace the ListView.builder with Row
          children: List.generate(
            itemCount,
            (index) {
              final DateTime currentDate = DateTime.now();
              final DateTime date = currentDate.add(Duration(days: index - 60));

              return GestureDetector(
                onTap: () => _onItemSelected(index),
                child: Container(
                  width: 60.0,
                  // margin: EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    color: _selectedIndex == index
                        ? lightPurpleColor  
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${date.day}',
                        style: TextStyle(
                          fontSize: 24.0,
                          color: _selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _getMonthAbbreviation(date.month),
                        style: TextStyle(
                          fontSize: 12.0,
                          color: _selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  String _getMonthAbbreviation(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}
