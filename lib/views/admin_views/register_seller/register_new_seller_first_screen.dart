import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shalontime/resources/constants/colors.dart';
import 'package:shalontime/view_models/map_view_model.dart';
import 'package:shalontime/view_models/seller_side_view_models/shop_register_view_model.dart';
import 'package:shalontime/views/admin_views/register_seller/register_new_seller_second_screen.dart';

import '../../../widgets/text_form_widget.dart';
import '../../map_view/map_screen.dart';

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
                            .salonNameEditingController,
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        hintText: "GST Number (Optional)",
                        textEditingController: context
                            .read<ShopRegisterVeiwModel>()
                            .gstNumberEditingController,
                      ),
                      const SizedBox(height: 10),

                      //-------------------------------
                      TextFormField(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (ctx) => const MapScreen(),
                            ),
                          );
                        },
                        readOnly: true,
                        controller: context
                            .read<ShopRegisterVeiwModel>()
                            .salonAddressEditingController,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(color: primaryColor),
                          suffixIcon: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (ctx) => const MapScreen(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.add_location_outlined),
                          ),
                          hintText: "Salon's Address",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: primaryColor,
                              width: 2.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.1),
                              width: 1.0,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.1),
                              width: 1.0,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                            horizontal: 16.0,
                          ),
                        ),
                      ),

                      //----------------------------------
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
                      (context
                                  .watch<ShopRegisterVeiwModel>()
                                  .salonNameEditingController
                                  .value
                                  .text
                                  .isNotEmpty &&
                              context
                                  .watch<ShopRegisterVeiwModel>()
                                  .salonAddressEditingController
                                  .value
                                  .text
                                  .isNotEmpty &&
                              context
                                  .watch<ShopRegisterVeiwModel>()
                                  .ownerNameEditingController
                                  .value
                                  .text
                                  .isNotEmpty &&
                              context
                                  .watch<ShopRegisterVeiwModel>()
                                  .ownerMobileEditingController
                                  .value
                                  .text
                                  .isNotEmpty &&
                              context
                                  .watch<ShopRegisterVeiwModel>()
                                  .ownerEmailIdEditingController
                                  .value
                                  .text
                                  .isNotEmpty)
                          ? ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (ctx) =>
                                        RegisterNewSellerStepTwo(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.9,
                                    50),
                              ),
                              child: const Text(
                                "Continue",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            )
                          : ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor.withOpacity(0.4),
                                minimumSize: Size(
                                    MediaQuery.of(context).size.width * 0.9,
                                    50),
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
