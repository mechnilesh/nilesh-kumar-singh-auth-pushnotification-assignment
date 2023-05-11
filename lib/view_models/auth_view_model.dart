import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  //

  bool validateEmail() {
    // Define the regular expression pattern for an email address
    final pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

    // Create a regular expression object from the pattern
    final regex = RegExp(pattern);

    // Use the `hasMatch` method of the regular expression object to check if the email address matches the pattern
    return regex.hasMatch(emailEditingController.value.text);
  }

  //--------------------register with email and password--------------//

  void signupToFireBase(BuildContext context) async {
    isLoding = true;
    notifyListeners();
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailEditingController.value.text,
        password: passwordEditingController.value.text,
      )
          .then((value) {
        addNewUser(context);
      });
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

  //------------------------sign out function  -----------------------//

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

  Future<void> addNewUser(BuildContext context) {
    return users.add({
      'name': nameEditingController.value.text,
      'email': emailEditingController.value.text,
      'city': cityEditingController.value.text,
      'gender': selectedGender,
      'token': fcmToken,
    }).then((value) {
      isLoding = false;
      notifyListeners();
      Navigator.of(context).pushAndRemoveUntil(
          CupertinoPageRoute(
            builder: (context) => const BottomBarPage(index: 0),
          ),
          (Route<dynamic> route) => false);
    }).catchError(
      (error) => print("Failed to add user: $error"),
    );
  }
}
