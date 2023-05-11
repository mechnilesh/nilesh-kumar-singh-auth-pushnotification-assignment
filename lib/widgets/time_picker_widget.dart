import 'package:flutter/material.dart';
import 'package:shalontime/resources/constants/colors.dart';

class TimeSlotPicker extends StatefulWidget {
  const TimeSlotPicker({super.key});

  @override
  _TimeSlotPickerState createState() => _TimeSlotPickerState();
}

class _TimeSlotPickerState extends State<TimeSlotPicker> {
  int _selectedTimeSlotIndex = -1;
  List<String> _timeSlots = [
    '9am - 10am',
    '10am - 11am',
    '11am - 12pm',
    '12pm - 1pm',
    '1pm - 2pm',
    '2pm - 3pm',
    '3pm - 4pm',
    '4pm - 5pm',
    '5pm - 6pm',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: _timeSlots.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // You can change the number of columns as needed
        childAspectRatio: 2.0,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedTimeSlotIndex = index;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: _selectedTimeSlotIndex == index
                    ? orangeColor // You can change the selected time slot color
                    : Colors.black,
                // width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
              color: _selectedTimeSlotIndex == index
                  ? orangeColor // You can change the selected time slot color
                  : Colors.transparent,
            ),
            margin: const EdgeInsets.all(8.0),
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Center(
              child: Text(
                _timeSlots[index],
                style: TextStyle(
                  // fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: _selectedTimeSlotIndex == index
                      ? whiteColor // You can change the selected time slot text color
                      : Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
