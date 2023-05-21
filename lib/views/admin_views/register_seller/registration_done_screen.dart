import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shalontime/resources/constants/colors.dart';

import '../../bottom_bar.dart';

class RegistraionDoneScreen extends StatelessWidget {
  const RegistraionDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Column(
            children: [
              Icon(
                Icons.check_circle_outline_rounded,
                color: whiteColor,
                size: 100,
              ),
              const SizedBox(height: 20),
              Text(
                "Form Submitted Successfully :)",
                style: TextStyle(color: whiteColor, fontSize: 20),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Text(
                  "Your salon registration will be completed after verification. Thank you for your patience.",
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  CupertinoPageRoute(
                    builder: (context) => const BottomBarPage(index: 0),
                  ),
                  (Route<dynamic> route) => false);
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Go To Home Screen",
                    style: TextStyle(
                      color: whiteColor,
                      // fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.double_arrow_rounded,
                    color: whiteColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
