import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shalontime/models/seller_side_models/salon_details_model.dart';
import 'package:shalontime/resources/constants/colors.dart';
import 'package:shalontime/resources/utils/utils.dart';
import 'package:shalontime/view_models/crm_view_models/crm_salon_view_model.dart';

class ReviewDetailsScreen extends StatefulWidget {
  const ReviewDetailsScreen({
    Key? key,
    required this.salonUid,
  }) : super(key: key);

  final String salonUid;

  @override
  State<ReviewDetailsScreen> createState() => _ReviewDetailsScreenState();
}

class _ReviewDetailsScreenState extends State<ReviewDetailsScreen> {
  @override
  void initState() {
    context.read<CRMSalonViewModel>().fetchSalonDetails(widget.salonUid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(salonUid);
    return context.watch<CRMSalonViewModel>().isLoading
        ? const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: secondaryColor,
              title: Text(
                  "Verify Details Of ${globalSalonDetailsModel!.salonName}"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Salon's Name",
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(globalSalonDetailsModel!.salonName),
                    const SizedBox(height: 20),
                    Text(
                      "Salon's Address",
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(globalSalonDetailsModel!.salonAddress),
                    const SizedBox(height: 20),
                    Text(
                      "Salon's GST Number",
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(globalSalonDetailsModel!.gstNumber),
                    const SizedBox(height: 20),
                    Text(
                      "Owner's Name",
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(globalSalonDetailsModel!.ownerName),
                    const SizedBox(height: 20),
                    Text(
                      "Owner's Mobile",
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(globalSalonDetailsModel!.ownerMobile),
                    const SizedBox(height: 20),
                    Text(
                      "Owner's Email",
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(globalSalonDetailsModel!.ownerEmail),
                    const SizedBox(height: 20),
                    Text(
                      "UID",
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(globalSalonDetailsModel!.uid),
                    const SizedBox(height: 20),
                    Text(
                      "Date and Time",
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      context.watch<CRMSalonViewModel>().dateTime.toString(),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Services",
                      style: TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: context
                          .watch<CRMSalonViewModel>()
                          .listOFServices
                          .length,
                      itemBuilder: (context, index) {
                        if (context
                            .watch<CRMSalonViewModel>()
                            .listOFServices
                            .isEmpty) {
                          return const LinearProgressIndicator();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: ListTile(
                            tileColor: secondaryColor.withOpacity(0.8),
                            textColor: whiteColor,
                            title: Text(
                              context
                                  .read<CRMSalonViewModel>()
                                  .listOFServices[index]
                                  .serviceName,
                            ),
                            subtitle: Text(
                              "${context.read<CRMSalonViewModel>().listOFServices[index].serviceDuration} minute",
                            ),
                            trailing: Text(
                              "₹${context.read<CRMSalonViewModel>().listOFServices[index].servicePrice}/-",
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: Utils.height(context) * 0.1),
                    context.watch<CRMSalonViewModel>().isSeller
                        ? ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.grey,
                              minimumSize:
                                  Size(MediaQuery.of(context).size.width, 40),
                            ),
                            child: const Text(
                              "Approved",
                            ),
                          )
                        : context
                                    .watch<CRMSalonViewModel>()
                                    .registrationStatus ==
                                false
                            ? ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.grey,
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width, 40),
                                ),
                                child: const Text(
                                  "Declined",
                                ),
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<CRMSalonViewModel>()
                                            .declineSalon(
                                              globalSalonDetailsModel!.uid,
                                            );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey[200],
                                      ),
                                      child: const Text(
                                        "Decline",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<CRMSalonViewModel>()
                                            .approveSalon(
                                              globalSalonDetailsModel!.uid,
                                            );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: greenColor,
                                      ),
                                      child: const Text(
                                        "Approve",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                    SizedBox(height: Utils.height(context) * 0.1),
                  ],
                ),
              ),
            ),
          );
  }
}
