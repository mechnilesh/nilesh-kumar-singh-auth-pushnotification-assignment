import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalontime/views/select_date_time_screen.dart';

import '../resources/constants/colors.dart';

class SelectServiceScreen extends StatefulWidget {
  const SelectServiceScreen({super.key});

  @override
  State<SelectServiceScreen> createState() => _SelectServiceScreenState();
}

class _SelectServiceScreenState extends State<SelectServiceScreen> {
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
        title: const Text("Select Service"),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: whiteLightColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(top: 40.0, left: 16, right: 16),
                      child: ListView.builder(
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              SelectServiceCardWidget(),
                              SizedBox(height: 20)
                            ],
                          );
                        },
                      )),
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
                      builder: (ctx) => const SelectDataTimeScreen(),
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

class SelectServiceCardWidget extends StatelessWidget {
  const SelectServiceCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(6),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icon(Icons.touch)
            Text(
              "Beard trim".toUpperCase(),
              style: TextStyle(color: primaryColor),
            ),
            Container(
              height: 30,
              width: 60,
              decoration: BoxDecoration(
                color: greenColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
                // border: Border.all(
                //   color: Color.fromARGB(255, 238, 236, 236),
                // ),
              ),
              child: Center(
                child: Text(
                  "₹60",
                  style: TextStyle(color: greenColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
