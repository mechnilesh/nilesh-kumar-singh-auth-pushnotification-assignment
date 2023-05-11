import 'package:flutter/material.dart';

import '../../resources/constants/colors.dart';

class SellerOpenCloseShopScreen extends StatefulWidget {
  const SellerOpenCloseShopScreen({super.key});

  @override
  State<SellerOpenCloseShopScreen> createState() =>
      _SellerOpenCloseShopScreenState();
}

class _SellerOpenCloseShopScreenState extends State<SellerOpenCloseShopScreen> {
  bool isAccepting = true;

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Open And Close Shop",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Open or close your shop to accept or stop new appointments.",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 40),
                  ListTile(
                    tileColor: whiteColor,
                    leading: Switch(
                      inactiveTrackColor: Colors.grey[200],
                      activeColor: const Color.fromARGB(255, 100, 225, 104),
                      value: isAccepting,
                      onChanged: (value) {
                        setState(() {
                          isAccepting = value;
                        });
                        if (value == false) {}
                      },
                    ),
                    title: Text(
                      isAccepting
                          ? "Accepting appointments"
                          : "Not accepting appointments",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 20),

              SizedBox(height: 80),
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
