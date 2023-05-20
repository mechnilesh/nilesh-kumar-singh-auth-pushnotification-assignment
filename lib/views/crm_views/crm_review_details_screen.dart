import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shalontime/models/seller_side_models/salon_details_model.dart';
import 'package:shalontime/models/seller_side_models/service_model.dart';

import 'package:shalontime/resources/constants/colors.dart';
import 'package:shalontime/resources/utils/utils.dart';
import 'package:shalontime/view_models/crm_view_models/crm_firebase_fetch_functions.dart';

class ReviewDetailsScreen extends StatefulWidget {
  const ReviewDetailsScreen({
    Key? key,
    required this.salonUid,
  }) : super(key: key);

  final String salonUid;

  @override
  State<ReviewDetailsScreen> createState() => _ReviewDetailsScreenState();
}

class _ReviewDetailsScreenState extends State<ReviewDetailsScreen> {
  @override
  void initState() {
    context
        .read<CRMFirebaseFetchFunctionsViewModel>()
        .fetchSalonDetails(widget.salonUid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(salonUid);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text("Verify Details Of ${globalSalonDetailsModel!.salonName}"),
      ),
      body: context.watch<CRMFirebaseFetchFunctionsViewModel>().isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Salon's Name",
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(globalSalonDetailsModel!.salonName),
                    const SizedBox(height: 20),
                    Text(
                      "Salon's Address",
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(globalSalonDetailsModel!.salonAddress),
                    const SizedBox(height: 20),
                    Text(
                      "Salon's GST Number",
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(globalSalonDetailsModel!.gstNumber),
                    const SizedBox(height: 20),
                    Text(
                      "Owner's Name",
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(globalSalonDetailsModel!.ownerName),
                    const SizedBox(height: 20),
                    Text(
                      "Owner's Mobile",
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(globalSalonDetailsModel!.ownerMobile),
                    const SizedBox(height: 20),
                    Text(
                      "Owner's Email",
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(globalSalonDetailsModel!.ownerEmail),
                    const SizedBox(height: 20),
                    Text(
                      "UID",
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(globalSalonDetailsModel!.uid),
                    const SizedBox(height: 20),
                    Text(
                      "Date and Time",
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      context
                          .watch<CRMFirebaseFetchFunctionsViewModel>()
                          .dateTime
                          .toString(),
                    ),
                    Text(context.read<CRMFirebaseFetchFunctionsViewModel>().listOFServices.first.serviceName),
                    SizedBox(height: Utils.height(context) * 0.28),
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
                            ),
                            child: const Text(
                              "Decline",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
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
                              backgroundColor: greenColor,
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
            ),
    );
  }
}
