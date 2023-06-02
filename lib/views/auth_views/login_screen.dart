import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shalontime/resources/constants/colors.dart';
import 'package:shalontime/resources/utils/utils.dart';
import 'package:shalontime/views/auth_views/sign_up_screen.dart';
import 'package:shalontime/views/home_screen.dart';

import '../../view_models/auth_view_model.dart';
import '../../widgets/text_form_widget.dart';
import '../app_bottom_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "Welcome to \nSalon Time.",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      TextFormFieldWidget(
                        hintText: "Email",
                        textEditingController: context
                            .read<AuthViewModel>()
                            .emailEditingController,
                      ),
                      const SizedBox(height: 30),
                      TextFormFieldWidget(
                        hintText: "Password",
                        textEditingController: context
                            .read<AuthViewModel>()
                            .passwordEditingController,
                      ),
                      const SizedBox(height: 40),
                      context.watch<AuthViewModel>().isLoding
                          ? LoadingAnimationWidget.prograssiveDots(
                              color: primaryColor, size: 60)
                          : (context
                                      .watch<AuthViewModel>()
                                      .emailEditingController
                                      .value
                                      .text
                                      .isEmpty ||
                                  context
                                      .watch<AuthViewModel>()
                                      .passwordEditingController
                                      .value
                                      .text
                                      .isEmpty)
                              ? ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        primaryColor.withOpacity(0.3),
                                    minimumSize: Size(
                                        MediaQuery.of(context).size.width * 0.9,
                                        50),
                                  ),
                                  child: const Text(
                                    "Sign In",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                )
                              : ElevatedButton(
                                  onPressed: () {
                                    context
                                            .read<AuthViewModel>()
                                            .validateEmail()
                                        ? context
                                            .read<AuthViewModel>()
                                            .signInToFirebase(context)
                                        : Utils.showSnackBar(
                                            context,
                                            "Invalid Email Format",
                                            lightPurpleColor);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    minimumSize: Size(
                                        MediaQuery.of(context).size.width * 0.9,
                                        50),
                                  ),
                                  child: const Text(
                                    "Sign In",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Forgot Password",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => SignUpScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "New user ?",
                              style: TextStyle(
                                color: secondaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 0.5,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          const Text(
                            "  Or  ",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 0.5,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Image.asset(
                        "assets/images/google_btn.png",
                        width: 180,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
