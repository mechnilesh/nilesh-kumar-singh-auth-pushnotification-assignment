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

  //-------------------------------------------------------------------//
  static showDialogUnavalableArea(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false, // Disable back button
          child: AlertDialog(
            title: const Text('Service Unavailable.'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Service Unavailable. Coming soon to your area.'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  //
}
