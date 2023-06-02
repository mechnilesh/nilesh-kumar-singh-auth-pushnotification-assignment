import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shalontime/models/seller_side_models/salon_details_model.dart';

class HomeScreenViewModel with ChangeNotifier {
  List<SalonDetailsModel> listOfSalons = [];
  List<DocumentSnapshot> listOfDocumentSnapshot = [];

  final CollectionReference _serviceProviders =
      FirebaseFirestore.instance.collection('serviceProviders');

  Future<void> getSalonsNearBy(
      BuildContext context, String city, String state) async {
    //clearing list for reusing it
    listOfSalons = [];
    listOfDocumentSnapshot = [];

    await _serviceProviders
        .where('salonCity', isEqualTo: city)
        .where("salonState", isEqualTo: state)
        .where("isVerfied", isEqualTo: true)
        .get()
        .then((QuerySnapshot<dynamic> querySnapshot) {
      for (var documentSnapshot in querySnapshot.docs) {
        listOfDocumentSnapshot.add(documentSnapshot);
        notifyListeners();
      }

      addToListOfSalons();
    }).catchError((error) {
      // Handle any errors that occur during the fetch operation
      print("Error fetching data: $error");
    });
  }

  //

  void addToListOfSalons() {
    for (int i = 0; i < listOfDocumentSnapshot.length; i++) {
      globalSalonDetailsModel =
          SalonDetailsModel.fromSnapshot(listOfDocumentSnapshot[i]);

      listOfSalons.add(globalSalonDetailsModel!);
      notifyListeners();

      // print(">>>>>>>>>>>>>>>>>${globalSalonDetailsModel!.salonName}<<<<<<<");
    }

    print(">>>>>>>>>>>>>>>>>${listOfSalons[1].uid}<<<<<<<");
  }
}
