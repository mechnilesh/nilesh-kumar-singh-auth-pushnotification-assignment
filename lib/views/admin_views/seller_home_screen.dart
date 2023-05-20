import 'package:flutter/material.dart';
import 'package:shalontime/resources/constants/colors.dart';

import '../../widgets/seller_widgets/appointment_reques_widget.dart';

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
