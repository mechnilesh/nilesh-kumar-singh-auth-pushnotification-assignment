import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shalontime/models/seller_side_models/service_model.dart';
import 'package:shalontime/resources/utils/utils.dart';
import 'package:shalontime/view_models/seller_side_view_models/shop_register_view_model.dart';
import 'package:shalontime/views/admin_views/register_seller/register_new_seller.dart';

import '../../resources/constants/colors.dart';
import '../text_form_widget.dart';

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({super.key});

  @override
  MyBottomSheetState createState() => MyBottomSheetState();
}

class MyBottomSheetState extends State<MyBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                size: 30,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Add Your Service",
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFormFieldWidget(
              hintText: "For eg. Beard Trim, Hair Cut etc..",
              textEditingController: context
                  .read<ShopRegisterVeiwModel>()
                  .serviceNameEditingController,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextFormFieldWidget(
                    hintText: "Price",
                    textEditingController: context
                        .read<ShopRegisterVeiwModel>()
                        .servicePriceEditingController,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: TextFormFieldWidget(
                    hintText: "for eg. 15 minutes",
                    textEditingController: context
                        .read<ShopRegisterVeiwModel>()
                        .serviceDurationEditingController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormFieldWidget(
              hintText: "Description",
              textEditingController: context
                  .read<ShopRegisterVeiwModel>()
                  .serviceDescriptionEditingController,
            ),
            const SizedBox(height: 40),
            (context
                        .watch<ShopRegisterVeiwModel>()
                        .serviceNameEditingController
                        .value
                        .text
                        .isNotEmpty &&
                    context
                        .watch<ShopRegisterVeiwModel>()
                        .servicePriceEditingController
                        .value
                        .text
                        .isNotEmpty &&
                    context
                        .watch<ShopRegisterVeiwModel>()
                        .serviceDurationEditingController
                        .value
                        .text
                        .isNotEmpty &&
                    context
                        .watch<ShopRegisterVeiwModel>()
                        .serviceDescriptionEditingController
                        .value
                        .text
                        .isNotEmpty)
                ? ElevatedButton(
                    onPressed: () {
                      context.read<ShopRegisterVeiwModel>().addService();
                      Navigator.pop(context);
                      Utils.showSnackBar(
                          context, "Service Added", Colors.green);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: Size(
                        MediaQuery.of(context).size.width,
                        50,
                      ),
                    ),
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  )
                : ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor.withOpacity(0.3),
                      minimumSize: Size(
                        MediaQuery.of(context).size.width,
                        50,
                      ),
                    ),
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
