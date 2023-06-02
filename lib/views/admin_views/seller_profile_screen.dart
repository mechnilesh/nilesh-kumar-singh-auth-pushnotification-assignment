import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalontime/resources/constants/colors.dart';
import 'package:shalontime/views/admin_views/seller_availability_screen.dart';
import 'package:shalontime/views/admin_views/seller_bottom_bar.dart';
import 'package:shalontime/views/admin_views/seller_open_close_shop_screen.dart';
import 'package:shalontime/views/app_bottom_bar.dart';

class SellerProfileScreen extends StatefulWidget {
  const SellerProfileScreen({super.key});

  @override
  State<SellerProfileScreen> createState() => _SellerProfileScreenState();
}

class _SellerProfileScreenState extends State<SellerProfileScreen> {
  bool isSeller = true;

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
                height: 50,
              ),
              Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                "0",
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Clients",
                                style: TextStyle(color: whiteColor),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "0",
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Bookings",
                                style: TextStyle(color: whiteColor),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "0",
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Reviews",
                                style: TextStyle(color: whiteColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        color: lightPurpleColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Nilesh Kumar Singh",
                                style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "nilesh.contact.work@gmail.com",
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
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                tileColor: whiteColor,
                trailing: Switch(
                  inactiveTrackColor: Colors.grey[200],
                  activeColor: Color.fromARGB(255, 100, 225, 104),
                  value: isSeller,
                  onChanged: (value) {
                    setState(() {
                      isSeller = value;
                    });
                    if (value == false) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const AppBottomBarPage(index: 2),
                          ),
                          (route) => false);
                    }
                  },
                ),
                title: const Text("Seller Mode"),
              ),
              const SizedBox(height: 20),
              ListTile(
                tileColor: whiteColor,
                leading: Icon(
                  Icons.cut_outlined,
                  color: lightPurpleColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: lightPurpleColor,
                  size: 18,
                ),
                title: const Text("Services"),
              ),
              ListTile(
                tileColor: whiteColor,
                leading: Icon(
                  Icons.photo_filter_rounded,
                  color: lightPurpleColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: lightPurpleColor,
                  size: 18,
                ),
                title: const Text("Sample Work"),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (ctx) => const SellerAvailabilityScreen(),
                    ),
                  );
                },
                tileColor: whiteColor,
                leading: Icon(
                  Icons.schedule,
                  color: lightPurpleColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: lightPurpleColor,
                  size: 18,
                ),
                title: const Text("Availability"),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (ctx) => const SellerOpenCloseShopScreen(),
                    ),
                  );
                },
                tileColor: whiteColor,
                leading: Icon(
                  Icons.toggle_on_outlined,
                  color: lightPurpleColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: lightPurpleColor,
                  size: 18,
                ),
                title: const Text("Close/Open Shop"),
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
