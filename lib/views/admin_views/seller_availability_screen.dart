import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../resources/constants/colors.dart';

class SellerAvailabilityScreen extends StatefulWidget {
  const SellerAvailabilityScreen({super.key});

  @override
  State<SellerAvailabilityScreen> createState() =>
      _SellerAvailabilityScreenState();
}

class _SellerAvailabilityScreenState extends State<SellerAvailabilityScreen> {
  bool isMon = true;
  bool isTue = true;
  bool isWed = true;
  bool isThu = true;
  bool isFri = true;
  bool isSat = true;
  bool isSun = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                "Availabilty",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Let clients see opening hours and book you based on your availability. You can change this later and update your booking preferences in settings.",
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                tileColor: whiteColor,
                leading: Switch(
                  inactiveTrackColor: Colors.grey[200],
                  activeColor: const Color.fromARGB(255, 100, 225, 104),
                  value: isMon,
                  onChanged: (value) {
                    setState(() {
                      isMon = value;
                    });
                    if (value == false) {}
                  },
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Monday",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "9:00 AM - 5:00 PM",
                      style: TextStyle(
                        fontSize: 12, color: Colors.grey,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                tileColor: whiteColor,
                leading: Switch(
                  inactiveTrackColor: Colors.grey[200],
                  activeColor: const Color.fromARGB(255, 100, 225, 104),
                  value: isTue,
                  onChanged: (value) {
                    setState(() {
                      isTue = value;
                    });
                    if (value == false) {}
                  },
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tuesday",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "9:00 AM - 5:00 PM",
                      style: TextStyle(
                        fontSize: 12, color: Colors.grey,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                tileColor: whiteColor,
                leading: Switch(
                  inactiveTrackColor: Colors.grey[200],
                  activeColor: const Color.fromARGB(255, 100, 225, 104),
                  value: isWed,
                  onChanged: (value) {
                    setState(() {
                      isWed = value;
                    });
                    if (value == false) {}
                  },
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Wednesday",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "9:00 AM - 5:00 PM",
                      style: TextStyle(
                        fontSize: 12, color: Colors.grey,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                tileColor: whiteColor,
                leading: Switch(
                  inactiveTrackColor: Colors.grey[200],
                  activeColor: const Color.fromARGB(255, 100, 225, 104),
                  value: isThu,
                  onChanged: (value) {
                    setState(() {
                      isThu = value;
                    });
                    if (value == false) {}
                  },
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Thursday",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "9:00 AM - 5:00 PM",
                      style: TextStyle(
                        fontSize: 12, color: Colors.grey,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                tileColor: whiteColor,
                leading: Switch(
                  inactiveTrackColor: Colors.grey[200],
                  activeColor: const Color.fromARGB(255, 100, 225, 104),
                  value: isFri,
                  onChanged: (value) {
                    setState(() {
                      isFri = value;
                    });
                    if (value == false) {}
                  },
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Friday",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "9:00 AM - 5:00 PM",
                      style: TextStyle(
                        fontSize: 12, color: Colors.grey,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                tileColor: whiteColor,
                leading: Switch(
                  inactiveTrackColor: Colors.grey[200],
                  activeColor: const Color.fromARGB(255, 100, 225, 104),
                  value: isSat,
                  onChanged: (value) {
                    setState(() {
                      isSat = value;
                    });
                    if (value == false) {}
                  },
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Saturday",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "9:00 AM - 5:00 PM",
                      style: TextStyle(
                        fontSize: 12, color: Colors.grey,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                tileColor: whiteColor,
                leading: Switch(
                  inactiveTrackColor: Colors.grey[200],
                  activeColor: const Color.fromARGB(255, 100, 225, 104),
                  value: isSun,
                  onChanged: (value) {
                    setState(() {
                      isSun = value;
                    });
                    if (value == false) {}
                  },
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Sunday",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "9:00 AM - 5:00 PM",
                      style: TextStyle(
                        fontSize: 12, color: Colors.grey,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   CupertinoPageRoute(
                  //     builder: (ctx) => const SelectDataTimeScreen(),
                  //   ),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: lightPurpleColor,
                  minimumSize: Size(MediaQuery.of(context).size.width, 50),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
