import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalontime/models/user_model.dart';
import 'package:shalontime/resources/constants/colors.dart';
import 'package:shalontime/resources/utils/utils.dart';
import 'package:shalontime/views/auth_views/login_screen.dart';

import '../views/bottom_bar.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');
String fcmToken = '';

class AuthViewModel with ChangeNotifier {
  String selectedGender = "Male";
  bool isLoding = false;
  bool isValidEmail = false;

  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confirmPasswordEditingController =
      TextEditingController();
  TextEditingController mobileEditingController = TextEditingController(); //
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController cityEditingController = TextEditingController();

  // Define the regular expression pattern for an email address
  bool validateEmail() {
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(emailEditingController.value.text);
  }

  //--------------------register with email and password--------------//

  void signupToFireBase(BuildContext context) async {
    isLoding = true;
    notifyListeners();
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailEditingController.value.text,
        password: passwordEditingController.value.text,
      );

      String response = await addNewUser(userCredential);

      if (response == 'success') {
        if (context.mounted) {
          Navigator.of(context).pushAndRemoveUntil(
              CupertinoPageRoute(
                builder: (context) => const BottomBarPage(index: 0),
              ),
              (Route<dynamic> route) => false);
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Utils.showSnackBar(context, 'weak-password', lightPurpleColor);
      } else if (e.code == 'email-already-in-use') {
        Utils.showSnackBar(context, "account already exists", lightPurpleColor);
      }
      isLoding = false;
      notifyListeners();
    } catch (e) {
      isLoding = false;
      notifyListeners();
      Utils.showSnackBar(context, e.toString(), lightPurpleColor);
    }
  }

  //------------------------login with email and password---------------//

  void signInToFirebase(BuildContext context) async {
    isLoding = true;
    notifyListeners();
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailEditingController.value.text,
        password: passwordEditingController.value.text,
      )
          .then(
        (value) {
          isLoding = false;
          notifyListeners();
          Navigator.of(context).pushAndRemoveUntil(
              CupertinoPageRoute(
                builder: (context) => const BottomBarPage(index: 0),
              ),
              (Route<dynamic> route) => false);
        },
      );
    } on FirebaseAuthException catch (e) {
      isLoding = false;
      notifyListeners();
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  //-----------------------------sign out function-----------------------//

  void signOutFromFirebase(BuildContext context) async {
    await FirebaseAuth.instance.signOut().then(
      (value) {
        notifyListeners();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (Route<dynamic> route) => false);
      },
    );
  }

  //-----------------------creating new user to firebase----------------//

  Future<String> addNewUser(UserCredential userCredential) async {
    String reponse = 'something went wrong';

    UserDataModel userDataModel = UserDataModel(
      email: emailEditingController.value.text,
      name: nameEditingController.value.text,
      city: cityEditingController.value.text,
      gender: selectedGender,
      token: fcmToken,
      uid: userCredential.user!.uid,
      isSeller: false,
    );

    await users
        .doc(userCredential.user!.uid)
        .set(userDataModel.toJson())
        .then((value) {
      isLoding = false;
      reponse = 'success';
      notifyListeners();
    }).catchError(
      (error) {
        print("Failed to add user: $error");
        reponse = error;
      },
    );

    return reponse;
  }

  //-------------------------Get Current User Data------------------------------------//

  void getCurrentUserData() async {
    isLoding = true;

    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    globalUserDataModel = UserDataModel.fromSnapshot(documentSnapshot);

    isLoding = false;
    notifyListeners();
  }
}
