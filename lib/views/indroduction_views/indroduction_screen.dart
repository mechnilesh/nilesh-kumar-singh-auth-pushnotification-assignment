import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shalontime/resources/constants/colors.dart';
import 'package:shalontime/views/app_bottom_bar.dart';

import '../../widgets/slider_widget.dart';

class AuthStateCheckScreen extends StatelessWidget {
  const AuthStateCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return const AppBottomBarPage(index: 0);
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return const IndroductionScreen();
      },
    );
  }
}

class IndroductionScreen extends StatelessWidget {
  const IndroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: const SliderWidget(),
    );
  }
}
