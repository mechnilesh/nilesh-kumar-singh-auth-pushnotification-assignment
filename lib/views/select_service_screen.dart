// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shalontime/views/select_date_time_screen.dart';

import '../resources/constants/colors.dart';
import '../view_models/user_side_view_models/home_screen_view_model.dart';

class SelectServiceScreen extends StatefulWidget {
  const SelectServiceScreen({super.key, required this.index});
  final int index;

  @override
  State<SelectServiceScreen> createState() => _SelectServiceScreenState();
}

class _SelectServiceScreenState extends State<SelectServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      floatingActionButton: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 65),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: lightPurpleColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.arrow_back,
                color: whiteColor,
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Select Service"),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
        leading: const SizedBox(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: whiteLightColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(top: 40.0, left: 16, right: 16),
                      child: ListView.builder(
                        itemCount: context
                            .read<HomeScreenViewModel>()
                            .listOfSalons[widget.index]
                            .listOfServices
                            .length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              SelectServiceCardWidget(
                                serviceName: context
                                    .read<HomeScreenViewModel>()
                                    .listOfSalons[widget.index]
                                    .listOfServices[index]['serviceName'],
                                serviceprice: context
                                    .read<HomeScreenViewModel>()
                                    .listOfSalons[widget.index]
                                    .listOfServices[index]['servicePrice']
                                    .toString(),
                              ),
                              const SizedBox(height: 20)
                            ],
                          );
                        },
                      )),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (ctx) => const SelectDataTimeScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: orangeColor,
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.9, 50),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectServiceCardWidget extends StatefulWidget {
  SelectServiceCardWidget({
    Key? key,
    required this.serviceName,
    required this.serviceprice,
  }) : super(key: key);

  final String serviceName;
  final String serviceprice;

  @override
  State<SelectServiceCardWidget> createState() =>
      _SelectServiceCardWidgetState();
}

class _SelectServiceCardWidgetState extends State<SelectServiceCardWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isSelected == false) {
          isSelected = true;
        } else {
          isSelected = false;
        }
        setState(() {});
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: isSelected == true ? lightPurpleColor : whiteColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05), // shadow color
              spreadRadius: 2, // how far the shadow spreads
              blurRadius: 5, // the blur radius of the shadow
              offset: const Offset(0, 2), // the offset of the shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon(Icons.touch)
              Text(
                widget.serviceName.toUpperCase(),
                style: TextStyle(
                    color: isSelected == true ? whiteColor : primaryColor),
              ),
              Container(
                height: 30,
                width: 60,
                decoration: BoxDecoration(
                  color: greenColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                  // border: Border.all(
                  //   color: Color.fromARGB(255, 238, 236, 236),
                  // ),
                ),
                child: Center(
                  child: Text(
                    "₹${widget.serviceprice}",
                    style: TextStyle(color: greenColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
