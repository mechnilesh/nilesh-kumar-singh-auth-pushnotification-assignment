import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalontime/views/booking_summary_screen.dart';
import 'package:shalontime/widgets/date_picker_widget.dart';
import 'package:shalontime/widgets/time_picker_widget.dart';
import '../resources/constants/colors.dart';

class SelectDataTimeScreen extends StatefulWidget {
  const SelectDataTimeScreen({super.key});

  @override
  State<SelectDataTimeScreen> createState() => _SelectDataTimeScreenState();
}

class _SelectDataTimeScreenState extends State<SelectDataTimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      floatingActionButton: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 65),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: lightPurpleColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.arrow_back,
                color: whiteColor,
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Select Date & Time"),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: whiteLightColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16,
                      top: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Divider(),
                        HorizontalDatePicker(),
                        Divider(),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Select Time Slots",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(child: TimeSlotPicker()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (ctx) => const BookingSummaryScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: orangeColor,
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.9, 50),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
