import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shalontime/view_models/seller_side_view_models/shop_register_view_model.dart';
import 'package:shalontime/views/bottom_bar.dart';
import '../../../resources/constants/colors.dart';
import '../../../widgets/seller_widgets/bottom_sheet_widget.dart';
import '../../../widgets/seller_widgets/suggestion_widget.dart';

class RegisterNewSellerStepTwo extends StatefulWidget {
  const RegisterNewSellerStepTwo({super.key});

  @override
  State<RegisterNewSellerStepTwo> createState() =>
      _RegisterNewSellerStepTwoState();
}

class _RegisterNewSellerStepTwoState extends State<RegisterNewSellerStepTwo> {
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return MyBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showBottomSheet(context),
        child: Icon(
          Icons.add,
          color: primaryColor,
        ),
      ),
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
                  "\nAdd Services",
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
                        "Suggestions",
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SuggestionWidget(
                        time: "30mins",
                        tiltle: "Hair Cut",
                        desc:
                            "Any type of cut. Including skin fades, tapers and all scissor cuts",
                        price: "₹60",
                      ),
                      const SizedBox(height: 10),
                      const SuggestionWidget(
                        time: "1hrs",
                        tiltle: "Hair Cut & Beard",
                        desc: "Any type of cut & beard trim",
                        price: "₹120",
                      ),
                      const SizedBox(height: 10),
                      const SuggestionWidget(
                        time: "15mins",
                        tiltle: "Beard Trim",
                        desc: "If you just need your beard groomed",
                        price: "40",
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      ElevatedButton(
                        onPressed: () {
                          context
                              .read<ShopRegisterVeiwModel>()
                              .submitSellerForm();
                          // print("submitted");
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (ctx) => const BottomBarPage(index: 2),
                          //     ),
                          //     (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          minimumSize: Size(
                            MediaQuery.of(context).size.width * 0.9,
                            50,
                          ),
                        ),
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.2)
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
