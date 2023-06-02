import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shalontime/resources/utils/utils.dart';
import 'package:shalontime/view_models/seller_side_view_models/shop_register_view_model.dart';
import 'package:shalontime/views/app_bottom_bar.dart';
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
  @override
  void dispose() {
    super.dispose();
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const MyBottomSheet();
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
                      context
                              .watch<ShopRegisterVeiwModel>()
                              .serviceModelList
                              .isNotEmpty
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.55,
                              child: ListView.builder(
                                // physics: NeverScrollableScrollPhysics(),
                                itemCount: context
                                    .watch<ShopRegisterVeiwModel>()
                                    .serviceModelList
                                    .length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: SuggestionWidget(
                                      time: context
                                          .read<ShopRegisterVeiwModel>()
                                          .serviceModelList[index]
                                          .serviceDuration,
                                      tiltle: context
                                          .read<ShopRegisterVeiwModel>()
                                          .serviceModelList[index]
                                          .serviceName,
                                      desc: context
                                          .read<ShopRegisterVeiwModel>()
                                          .serviceModelList[index]
                                          .serviceDescription,
                                      price: context
                                          .read<ShopRegisterVeiwModel>()
                                          .serviceModelList[index]
                                          .servicePrice,
                                    ),
                                  );
                                },
                              ),
                            )
                          : Column(
                              children: const [
                                SizedBox(height: 20),
                                SuggestionWidget(
                                  time: "30",
                                  tiltle: "Hair Cut",
                                  desc:
                                      "Any type of cut. Including skin fades, tapers and all scissor cuts",
                                  price: "60",
                                ),
                                SizedBox(height: 10),
                                SuggestionWidget(
                                  time: "1",
                                  tiltle: "Hair Cut & Beard",
                                  desc: "Any type of cut & beard trim",
                                  price: "120",
                                ),
                                SizedBox(height: 10),
                                SuggestionWidget(
                                  time: "15",
                                  tiltle: "Beard Trim",
                                  desc: "If you just need your beard groomed",
                                  price: "40",
                                ),
                              ],
                            ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      context
                              .watch<ShopRegisterVeiwModel>()
                              .serviceModelList
                              .isNotEmpty
                          ? context.watch<ShopRegisterVeiwModel>().isLoding ==
                                  true
                              ? Center(
                                  child: LoadingAnimationWidget.prograssiveDots(
                                    color: primaryColor,
                                    size: 60,
                                  ),
                                )
                              : ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<ShopRegisterVeiwModel>()
                                        .submitSellerForm(context);
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
                                )
                          : const SizedBox(),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.3)
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
