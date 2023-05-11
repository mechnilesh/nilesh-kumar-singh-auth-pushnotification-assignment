import 'package:flutter/material.dart';

import '../../resources/constants/colors.dart';

class SuggestionWidget extends StatelessWidget {
  const SuggestionWidget({
    Key? key,
    required this.time,
    required this.tiltle,
    required this.desc,
    required this.price,
  }) : super(key: key);

  final String tiltle, desc, price, time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: whiteColor,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              tiltle,
              style: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.bold,
              ),
            ),
            // SizedBox(height: 5),
            Text(
              desc,
              style: TextStyle(
                color: Colors.grey[400],
                // fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            Text(
              "$price -  $time",
              style: TextStyle(
                color: Colors.grey[400],
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
