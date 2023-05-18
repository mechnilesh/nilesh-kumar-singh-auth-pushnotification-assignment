import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shalontime/models/seller_side_models/service_model.dart';
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
            ElevatedButton(
              onPressed: () {
                context.read<ShopRegisterVeiwModel>().addService();
                print(context
                    .read<ShopRegisterVeiwModel>()
                    .serviceNameEditingController
                    .value
                    .text);

                // Navigator.push(
                //   context,
                //   CupertinoPageRoute(
                //     builder: (ctx) => RegisterNewSellerStepTwo(),
                //   ),
                // );
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
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
