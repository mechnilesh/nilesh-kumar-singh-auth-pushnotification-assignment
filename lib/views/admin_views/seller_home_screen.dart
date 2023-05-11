import 'package:flutter/material.dart';
import 'package:shalontime/resources/constants/colors.dart';

class SellerHomeScreen extends StatelessWidget {
  const SellerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteLightColor,
        elevation: 0,
        title: Text(
          "Salon Time",
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Appointment Requests",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 40.0),
                      child: AppointmentRequestWidget(),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppointmentRequestWidget extends StatelessWidget {
  const AppointmentRequestWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05), // shadow color
            spreadRadius: 2, // how far the shadow spreads
            blurRadius: 5, // the blur radius of the shadow
            offset: const Offset(0, 2), // the offset of the shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: whiteColor,
                          backgroundImage:
                              AssetImage("assets/images/avatar.png"),
                        ),
                        SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nilesh Kumar Singh"),
                            SizedBox(height: 5),
                            Text("1:00pm - 2:00pm"),
                          ],
                        ),
                      ],
                    ),
                    Text("18 April"),
                  ],
                ),
                // Divider(height: 50),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Service",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Text(
                          "Hair Cut",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Text(
                          "₹60",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   CupertinoPageRoute(
                      //     builder: (ctx) => const SelectDataTimeScreen(),
                      //   ),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      // minimumSize:
                      //     Size(MediaQuery.of(context).size.width * 0.9, 50),
                    ),
                    child: const Text(
                      "Decline",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
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
                      // minimumSize:
                      //     Size(MediaQuery.of(context).size.width * 0.9, 50),
                    ),
                    child: const Text(
                      "Accept",
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
