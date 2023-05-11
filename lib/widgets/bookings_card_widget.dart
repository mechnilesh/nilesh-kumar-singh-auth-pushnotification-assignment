import 'package:flutter/material.dart';

class BookingsCardWidget extends StatelessWidget {
  const BookingsCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      // color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 80,
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
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "1pm - 2pm",
                    style: TextStyle(color: Colors.grey),
                  ),
                  // SizedBox(height: 10),
                  Text(
                    "Hair Cut",
                    style: TextStyle(fontSize: 18),
                  ),
                  // SizedBox(height: 10),
                  Text(
                    "Venny's Barber",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          Text(
            "18 mar",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
