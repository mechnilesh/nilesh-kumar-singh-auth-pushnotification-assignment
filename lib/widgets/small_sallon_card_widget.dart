import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalontime/views/barber_shop_screen.dart';

import '../resources/constants/colors.dart';

class SaloonSmallCard extends StatelessWidget {
  const SaloonSmallCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (ctx) => const BarberShopDetailsScreen(),
          ),
        );
      },
      // splashColor: Colors.amber,
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width * 0.65,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    fit: BoxFit.cover,
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA_xLphGVgPo3tzNUuXyGydsXm-vKh15vXvKJlCHkLd3_9MutUgH3ZFf1E4LFcmNO0wQk&usqp=CAU",
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Vinny's Barber",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        color: Colors.grey[400], size: 18),
                    Text(
                      "200m",
                      style: TextStyle(
                        color: Colors.grey[400], fontSize: 12,
                        // fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Row(
                  // textBaseline: TextBaseline.ideographic,
                  // crossAxisAlignment: CrossAxisAlignment.,
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: Colors.orange,
                      size: 18,
                    ),
                    Text(
                      "4.2",
                      style: TextStyle(
                        color: Colors.grey[400], fontSize: 12,
                        // fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
