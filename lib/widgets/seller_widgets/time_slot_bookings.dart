import 'package:flutter/material.dart';

import '../../resources/constants/colors.dart';

Widget buildTimeSlotWidget(String timeLabel, int appointmentCount) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          SizedBox(
            width: 70,
            child: Text(timeLabel),
          ),
        ],
      ),
      appointmentCount == 0
          ? Row(
              children: const [
                SizedBox(width: 100),
                Text(
                  "No Appointment",
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
                // ),
              ],
            )
          : Row(
              children: [
                const SizedBox(width: 80),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: appointmentCount,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, right: 16),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: lightPurpleColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      // color: orangeColor,
                                      width: MediaQuery.of(context).size.width *
                                          0.48,
                                      child: Text(
                                        "Nilesh Kumar Singh",
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                    Divider(),
                                    Text("Hair Cut"),
                                  ],
                                ),
                                Text("12:15 PM"),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
      SizedBox(
        height: 50,
      ),
    ],
  );
}
