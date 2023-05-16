import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shalontime/resources/constants/colors.dart';
import 'package:shalontime/view_models/seller_side_view_models/shop_register_view_model.dart';
import 'package:shalontime/views/admin_views/register_seller/register_screen_step_two.dart';

import '../../../widgets/text_form_widget.dart';

class RegisterNewSeller extends StatefulWidget {
  const RegisterNewSeller({super.key});

  @override
  State<RegisterNewSeller> createState() => _RegisterNewSellerState();
}

class _RegisterNewSellerState extends State<RegisterNewSeller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "Register Your\nSalon",
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        "Salon's Details",
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormFieldWidget(
                        hintText: "Salon's Name",
                        textEditingController: context
                            .read<ShopRegisterVeiwModel>()
                            .shopNameEditingController              ,
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        hintText: "GST Number (Optional)",
                        textEditingController: context
                            .read<ShopRegisterVeiwModel>()
                            .gstNumberEditingController,
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        hintText: "Salon's Address",
                        textEditingController: context
                            .read<ShopRegisterVeiwModel>()
                            .shopAddressEditingController,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Owner's Details",
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormFieldWidget(
                        hintText: "Owner's Full Name",
                        textEditingController: context
                            .read<ShopRegisterVeiwModel>()
                            .ownerNameEditingController,
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        hintText: "Owner's Mobile",
                        textEditingController: context
                            .read<ShopRegisterVeiwModel>()
                            .ownerMobileEditingController,
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        hintText: "Owner's Email",
                        textEditingController: context
                            .read<ShopRegisterVeiwModel>()
                            .ownerEmailIdEditingController,
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (ctx) => RegisterNewSellerStepTwo(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          minimumSize:
                              Size(MediaQuery.of(context).size.width * 0.9, 50),
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 80),
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
