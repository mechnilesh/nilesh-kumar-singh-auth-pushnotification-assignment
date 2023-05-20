import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shalontime/resources/constants/colors.dart';
import 'package:shalontime/widgets/crm_widgets/crm_salon_approval_widget.dart';

class CRMSalonVerificationScreen extends StatefulWidget {
  const CRMSalonVerificationScreen({super.key});

  @override
  State<CRMSalonVerificationScreen> createState() =>
      _CRMSalonVerificationScreenState();
}

class _CRMSalonVerificationScreenState
    extends State<CRMSalonVerificationScreen> {
  final Stream<QuerySnapshot> _serviceProvidersStream = FirebaseFirestore
      .instance
      .collection('serviceProviders')
      .orderBy('timestamp', descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text("Salon Verifications"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _serviceProvidersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CRMSalonApprovalWidget(
                  salonName: data['salonName'],
                  timeStamp: data['timestamp'],
                  salonAddress: data['salonAddress'],
                  salonUid: data['uid'],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
