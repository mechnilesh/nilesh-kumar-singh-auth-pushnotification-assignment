import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shalontime/models/seller_side_models/salon_details_model.dart';
import 'package:shalontime/models/seller_side_models/service_model.dart';

class CRMFirebaseFetchFunctionsViewModel with ChangeNotifier {
  final CollectionReference _serviceProviders =
      FirebaseFirestore.instance.collection('serviceProviders');

  bool isLoading = true;
  String? dateTime;

  List<ServicesModel> listOFServices = [];

  Future<void> fetchSalonDetails(String salonUid) async {
    await _serviceProviders.doc(salonUid).get().then((DocumentSnapshot doc) {
      globalSalonDetailsModel = SalonDetailsModel.fromSnapshot(doc);
      dateTime = DateFormat('yyyy-MM-dd hh:mm:ss a').format(
        Timestamp.fromMillisecondsSinceEpoch(
                globalSalonDetailsModel!.timestamp.millisecondsSinceEpoch)
            .toDate(),
      );

      for (int i = 0;
          i >= globalSalonDetailsModel!.listOfServices.length;
          i++) {
        listOFServices.add(
          ServicesModel.fromMap(globalSalonDetailsModel!.listOfServices[i]),
        );
        notifyListeners();
      }

      // globalServicesModel =
      //     ServicesModel.fromMap(globalSalonDetailsModel!.listOfServices.first);

      notifyListeners();
    }).catchError(
      (err) {
        print(err);
      },
    );
    isLoading = false;
    notifyListeners();
    // print(globalSalonDetailsModel!.salonName);
  }
}
