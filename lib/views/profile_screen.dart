import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:shalontime/models/user_model.dart';
import 'package:shalontime/resources/constants/colors.dart';
import 'package:shalontime/view_models/auth_view_model.dart';
import 'package:shalontime/views/admin_views/register_seller/register_new_seller.dart';
import 'package:shalontime/views/admin_views/seller_bottom_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSeller = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                // height: MediaQuery.of(context).size.height * 0.1,
                height: 110,
              ),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            globalUserDataModel!.name,
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            globalUserDataModel!.email,
                            style: TextStyle(
                              color: whiteColor,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: whiteColor,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              globalUserDataModel!.isSeller
                  ? ListTile(
                      tileColor: whiteColor,
                      trailing: Switch(
                        inactiveTrackColor: Colors.grey[200],
                        activeColor: const Color.fromARGB(255, 100, 225, 104),
                        value: isSeller,
                        onChanged: (value) {
                          setState(() {
                            isSeller = value;
                          });
                          if (value == true) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) =>
                                      const SellerBottomBarPage(index: 2),
                                ),
                                (route) => false);
                          }
                        },
                      ),
                      title: const Text("Seller Mode"),
                    )
                  : const SizedBox(),
              const SizedBox(height: 20),
              ListTile(
                tileColor: whiteColor,
                leading: Icon(
                  Icons.settings_outlined,
                  color: lightPurpleColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: lightPurpleColor,
                  size: 18,
                ),
                title: const Text("Settings"),
              ),
              const SizedBox(height: 20),
              ListTile(
                tileColor: whiteColor,
                leading: Icon(
                  Icons.star_border_rounded,
                  color: lightPurpleColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: lightPurpleColor,
                  size: 18,
                ),
                title: const Text("Rate Us"),
              ),
              ListTile(
                tileColor: whiteColor,
                leading: Icon(
                  Icons.privacy_tip_outlined,
                  color: lightPurpleColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: lightPurpleColor,
                  size: 18,
                ),
                title: const Text("Privacy Policy"),
              ),
              ListTile(
                tileColor: whiteColor,
                leading: Icon(
                  Icons.phonelink_lock_sharp,
                  color: lightPurpleColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: lightPurpleColor,
                  size: 18,
                ),
                title: const Text("Terms & Conditions"),
              ),
              const SizedBox(height: 20),
              ListTile(
                tileColor: whiteColor,
                leading: Icon(
                  Icons.share_outlined,
                  color: lightPurpleColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: lightPurpleColor,
                  size: 18,
                ),
                title: const Text("Invite Friends"),
              ),
              globalUserDataModel!.isSeller
                  ? SizedBox()
                  : ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const RegisterNewSeller(),
                          ),
                        );
                      },
                      tileColor: whiteColor,
                      leading: Icon(
                        Icons.business_center_outlined,
                        color: lightPurpleColor,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: lightPurpleColor,
                        size: 18,
                      ),
                      title: const Text("Register Your Salon"),
                    ),
              const SizedBox(height: 20),
              ListTile(
                onTap: () {
                  context.read<AuthViewModel>().signOutFromFirebase(context);
                },
                tileColor: whiteColor,
                leading: Icon(
                  Icons.power_settings_new_rounded,
                  color: lightPurpleColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: lightPurpleColor,
                  size: 18,
                ),
                title: const Text("Log Out"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
