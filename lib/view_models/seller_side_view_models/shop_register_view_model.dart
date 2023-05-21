import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalontime/models/seller_side_models/seller_register_model.dart';
import 'package:shalontime/models/seller_side_models/service_model.dart';
import 'package:shalontime/models/user_model.dart';
import 'package:shalontime/view_models/auth_view_model.dart';
import 'package:shalontime/views/admin_views/register_seller/registration_done_screen.dart';

import '../../views/bottom_bar.dart';

CollectionReference serviceProviders =
    FirebaseFirestore.instance.collection('serviceProviders');

class ShopRegisterVeiwModel with ChangeNotifier {
  bool isLoding = false;

  //-------------------------------
  void notifiListener() {
    notifyListeners();
  }

  //---------------

  TextEditingController salonNameEditingController = TextEditingController();

  TextEditingController gstNumberEditingController = TextEditingController();

  TextEditingController salonAddressEditingController = TextEditingController();

  TextEditingController ownerNameEditingController = TextEditingController();

  TextEditingController ownerMobileEditingController = TextEditingController();

  TextEditingController ownerEmailIdEditingController = TextEditingController();

  double? latitudeShop;

  double? longitudeShop;

  //---------------------------------Step 2-----------------------------------//

  TextEditingController serviceNameEditingController = TextEditingController();

  TextEditingController servicePriceEditingController = TextEditingController();

  TextEditingController serviceDurationEditingController =
      TextEditingController();

  TextEditingController serviceDescriptionEditingController =
      TextEditingController();

  //-----------------------------------adding service to list-----------------//

  List<ServicesModel> serviceModelList = [];

  void addService() {
    ServicesModel serviceModel = ServicesModel(
      serviceName: serviceNameEditingController.value.text,
      servicePrice: servicePriceEditingController.value.text,
      serviceDuration: serviceDurationEditingController.value.text,
      serviceDescription: serviceDescriptionEditingController.value.text,
    );
    serviceModelList.add(serviceModel);
    notifyListeners();
  }

  //---------------------------Submiting form to firestore--------------------//

  Future<String> submitSellerForm(BuildContext context) async {
    String reponse = 'something went wrong';
    isLoding = true;
    notifiListener();

    SellerRegisterModel sellerRegisterModel = SellerRegisterModel(
      salonName: salonNameEditingController.value.text,
      gstNumber: gstNumberEditingController.value.text,
      salonAddress: salonAddressEditingController.value.text,
      ownerName: ownerNameEditingController.value.text,
      ownerMobile: ownerMobileEditingController.value.text,
      ownerEmail: ownerEmailIdEditingController.value.text,
      uid: globalUserDataModel!.uid,
      listOfServices: serviceModelList,
      salonOpenClose: false,
      latitude: latitudeShop!,
      longitude: longitudeShop!,
      timestamp: FieldValue.serverTimestamp(),
    );

    await serviceProviders
        .doc(globalUserDataModel!.uid)
        .set(sellerRegisterModel.toMap())
        .then((value) {
      users.doc(globalUserDataModel!.uid).update(
        {
          'registrationStatus': true,
        },
      ).then((value) {
        Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(
              builder: (context) => const RegistraionDoneScreen(),
            ),
            (Route<dynamic> route) => false);
      }).catchError((error) {
        print("$error");
        reponse = error;
      });
      isLoding = false;
      reponse = 'success';
      notifyListeners();
    }).catchError(
      (error) {
        print("Failed to add user: $error");
        reponse = error;
      },
    );

    isLoding = false;
    notifiListener();

    return reponse;
  }
}
