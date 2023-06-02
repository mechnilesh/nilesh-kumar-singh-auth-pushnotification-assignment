import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shalontime/models/seller_side_models/salon_details_model.dart';
import 'package:shalontime/models/seller_side_models/service_model.dart';

class CRMSalonViewModel with ChangeNotifier {
  final CollectionReference _serviceProviders =
      FirebaseFirestore.instance.collection('serviceProviders');

  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  bool isLoading = true;
  bool isSeller = false;
  bool registrationStatus = false;
  String? dateTime;

  List<ServicesModel> listOFServices = [];

  Future<void> fetchSalonDetails(String salonUid) async {
    //clearing list for reusing it
    listOFServices = [];

    await _serviceProviders.doc(salonUid).get().then((DocumentSnapshot doc) {
      globalSalonDetailsModel = SalonDetailsModel.fromSnapshot(doc);

      fetchIsSellerOrNot(globalSalonDetailsModel!.uid);

      dateTime = DateFormat('yyyy-MM-dd hh:mm:ss a').format(
        Timestamp.fromMillisecondsSinceEpoch(
                globalSalonDetailsModel!.timestamp.millisecondsSinceEpoch)
            .toDate(),
      );

      for (int i = 0; i < globalSalonDetailsModel!.listOfServices.length; i++) {
        listOFServices.add(
          ServicesModel.fromMap(
            globalSalonDetailsModel!.listOfServices[i],
          ),
        );
        notifyListeners();
      }

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

  //--------------------------approve and decline verification---------------//

  void approveSalon(String sellerUid) async {
    await _users.doc(sellerUid).update({"isSeller": true}).then((value) {
      _serviceProviders
          .doc(sellerUid)
          .update({"isVerfied": true}).then((value) {
        isSeller = true;
        notifyListeners();
      });
    }).catchError((error) {
      print("$error");
    });
  }

  void declineSalon(String sellerUid) async {
    await _users
        .doc(sellerUid)
        .update({"isSeller": false, "registrationStatus": false}).then((value) {
      _serviceProviders
          .doc(sellerUid)
          .update({"isVerfied": false}).then((value) {
        registrationStatus = false;
        notifyListeners();
      });
    }).catchError((error) {
      print("$error");
    });
  }

  //-------------------------fetch isSellr ------------------//

  void fetchIsSellerOrNot(String sellerUID) async {
    await _users.doc(sellerUID).get().then(
      (DocumentSnapshot<dynamic> documentSnapshot) {
        isSeller = documentSnapshot.data()['isSeller'];
        registrationStatus = documentSnapshot.data()['registrationStatus'];
        notifyListeners();
      },
    );
    print(isSeller);
  }
}
