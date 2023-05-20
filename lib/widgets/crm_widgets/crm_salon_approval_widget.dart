// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:shalontime/resources/utils/utils.dart';

import '../../resources/constants/colors.dart';
import '../../views/crm_views/crm_review_details_screen.dart';

class CRMSalonApprovalWidget extends StatefulWidget {
  const CRMSalonApprovalWidget({
    Key? key,
    required this.salonName,
    required this.salonAddress,
    required this.timeStamp,
    required this.salonUid,
  }) : super(key: key);

  final String salonName;
  final String salonAddress;
  final Timestamp timeStamp;
  final String salonUid;

  @override
  State<CRMSalonApprovalWidget> createState() => _CRMSalonApprovalWidgetState();
}

class _CRMSalonApprovalWidgetState extends State<CRMSalonApprovalWidget> {
  DateTime? dateTime;
  String? formatedDateTime;

  @override
  void initState() {
    dateTime = Timestamp.fromMillisecondsSinceEpoch(
            widget.timeStamp.millisecondsSinceEpoch)
        .toDate();
    formatedDateTime = DateFormat('yyyy-MM-dd hh:mm:ss a').format(dateTime!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Utils.width(context),
              // color: primaryColor,
              child: Text(
                widget.salonName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: Utils.width(context),
              // color: primaryColor,
              child: Text(
                widget.salonAddress,
                overflow: TextOverflow.clip,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: Utils.width(context),
              // color: primaryColor,
              child: Text(
                formatedDateTime.toString(),
                overflow: TextOverflow.clip,
                style: TextStyle(
                  color: lightPurpleColor,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: Utils.width(context),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (ctx) =>
                          ReviewDetailsScreen(salonUid: widget.salonUid),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: greenColor,
                ),
                child: const Text(
                  "Review",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
