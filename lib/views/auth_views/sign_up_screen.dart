import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shalontime/resources/constants/colors.dart';
import 'package:shalontime/view_models/auth_view_model.dart';

import '../../resources/utils/utils.dart';
import '../../widgets/text_form_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  "Create new\naccount.",
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
                        hintText: "Name",
                        textEditingController:
                            context.read<AuthViewModel>().nameEditingController,
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        hintText: "Email",
                        textEditingController: context
                            .read<AuthViewModel>()
                            .emailEditingController,
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        hintText: "Mobile",
                        textEditingController: context
                            .read<AuthViewModel>()
                            .mobileEditingController,
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        hintText: "Password",
                        textEditingController: context
                            .read<AuthViewModel>()
                            .passwordEditingController,
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        hintText: "Confirm Password",
                        textEditingController: context
                            .read<AuthViewModel>()
                            .confirmPasswordEditingController,
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        hintText: "City",
                        textEditingController:
                            context.read<AuthViewModel>().cityEditingController,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Radio(
                                activeColor: primaryColor,
                                value: 'Male',
                                groupValue: context
                                    .read<AuthViewModel>()
                                    .selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    context
                                        .read<AuthViewModel>()
                                        .selectedGender = value.toString();
                                  });
                                },
                              ),
                              const Text("Male"),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                activeColor: primaryColor,
                                value: 'Female',
                                groupValue: context
                                    .read<AuthViewModel>()
                                    .selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    context
                                        .read<AuthViewModel>()
                                        .selectedGender = value.toString();
                                  });
                                },
                              ),
                              Text("Female")
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      context.watch<AuthViewModel>().isLoding
                          ? LoadingAnimationWidget.prograssiveDots(
                              color: primaryColor, size: 60)
                          : (context
                                      .watch<AuthViewModel>()
                                      .nameEditingController
                                      .value
                                      .text
                                      .isEmpty ||
                                  context
                                      .watch<AuthViewModel>()
                                      .emailEditingController
                                      .value
                                      .text
                                      .isEmpty ||
                                  context
                                      .watch<AuthViewModel>()
                                      .mobileEditingController
                                      .value
                                      .text
                                      .isEmpty ||
                                  context
                                      .watch<AuthViewModel>()
                                      .passwordEditingController
                                      .value
                                      .text
                                      .isEmpty ||
                                  context
                                      .watch<AuthViewModel>()
                                      .confirmPasswordEditingController
                                      .value
                                      .text
                                      .isEmpty ||
                                  context
                                      .watch<AuthViewModel>()
                                      .cityEditingController
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
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                )
                              : ElevatedButton(
                                  onPressed: () {
                                    if (context
                                            .read<AuthViewModel>()
                                            .passwordEditingController
                                            .value
                                            .text ==
                                        context
                                            .read<AuthViewModel>()
                                            .confirmPasswordEditingController
                                            .value
                                            .text) {
                                      context
                                              .read<AuthViewModel>()
                                              .validateEmail()
                                          ? context
                                              .read<AuthViewModel>()
                                              .signupToFireBase(context)
                                          : Utils.showSnackBar(
                                              context,
                                              "Invalid Email Format",
                                              lightPurpleColor);
                                    } else {
                                      Utils.showSnackBar(
                                          context,
                                          "Passwords do not match",
                                          lightPurpleColor);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    minimumSize: Size(
                                        MediaQuery.of(context).size.width * 0.9,
                                        50),
                                  ),
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                      const SizedBox(height: 40),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Log In Here",
                            style: TextStyle(
                              color: secondaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 80),
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
