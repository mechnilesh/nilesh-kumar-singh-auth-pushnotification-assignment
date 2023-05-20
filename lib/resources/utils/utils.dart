import 'package:flutter/material.dart';

class Utils {
  static showSnackBar(BuildContext context, String msg, Color color) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: color,
      ),
    );
  }

  //------------------------Height and with of Device--------------------//

  static height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
