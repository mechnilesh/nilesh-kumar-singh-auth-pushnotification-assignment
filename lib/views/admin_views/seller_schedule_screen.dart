import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:shalontime/widgets/seller_widgets/date_selector_widget.dart';
import 'package:shalontime/widgets/seller_widgets/time_slot_bookings.dart';

import '../../resources/constants/colors.dart';

class SellerScheduleScreen extends StatelessWidget {
  const SellerScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteLightColor,
        elevation: 0,
        title: Text(
          "Today's Schedule",
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            SellerHorizontalDateSelector(),
            Divider(),
            Expanded(
              child: ListView(
                children: [
                  buildTimeSlotWidget('1:00 AM', 0),
                  buildTimeSlotWidget('2:00 AM', 0),
                  buildTimeSlotWidget('3:00 AM', 0),
                  buildTimeSlotWidget('12:00 AM', 0),
                  buildTimeSlotWidget('4:00 AM', 0),
                  buildTimeSlotWidget('5:00 AM', 3),
                  buildTimeSlotWidget('6:00 AM', 6),
                  buildTimeSlotWidget('7:00 AM', 0),
                  buildTimeSlotWidget('8:00 AM', 0),
                  buildTimeSlotWidget('9:00 AM', 0),
                  buildTimeSlotWidget('10:00 AM', 1),
                  buildTimeSlotWidget('11:00 AM', 1),
                  buildTimeSlotWidget('12:00 PM', 1),
                  //
                  buildTimeSlotWidget('1:00 PM', 1),
                  buildTimeSlotWidget('2:00 PM', 1),
                  buildTimeSlotWidget('3:00 PM', 1),
                  buildTimeSlotWidget('4:00 PM', 1),
                  buildTimeSlotWidget('5:00 PM', 1),
                  buildTimeSlotWidget('6:00 PM', 1),
                  buildTimeSlotWidget('7:00 PM', 1),
                  buildTimeSlotWidget('8:00 PM', 1),
                  buildTimeSlotWidget('9:00 PM', 1),
                  buildTimeSlotWidget('10:00 PM', 1),
                  buildTimeSlotWidget('11:00 PM', 1),
                  //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
