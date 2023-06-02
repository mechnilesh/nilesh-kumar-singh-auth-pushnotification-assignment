import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shalontime/views/select_service_screen.dart';
import '../resources/constants/colors.dart';
import '../view_models/user_side_view_models/home_screen_view_model.dart';

class BarberShopDetailsScreen extends StatefulWidget {
  const BarberShopDetailsScreen({super.key, required this.index});

  final int index;

  @override
  State<BarberShopDetailsScreen> createState() =>
      _BarberShopDetailsScreenState();
}

class _BarberShopDetailsScreenState extends State<BarberShopDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    // print(
    //   context
    //       .read<HomeScreenViewModel>()
    //       .listOfSalons[widget.index]
    //       .listOfServices[0]['serviceName']
    //       .toString(),
    // );

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 60),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Card(
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.arrow_back),
              ),
            ),
          ),
        ),
      ),
      // backgroundColor: primaryColor,

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: lightPurpleColor,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        opacity: 0.3,
                        image: NetworkImage(
                            "https://media.istockphoto.com/id/872361244/photo/man-getting-his-beard-trimmed-with-electric-razor.jpg?s=612x612&w=0&k=20&c=_IjZcrY0Gp-2z6AWTQederZCA9BLdl-iqWkH0hGMTgg="),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              context
                                  .watch<HomeScreenViewModel>()
                                  .listOfSalons[widget.index]
                                  .salonName,
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 50,
                              decoration: BoxDecoration(
                                color: greenColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Text(
                                  "Open",
                                  style: TextStyle(color: whiteColor),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80,
                          decoration: BoxDecoration(
                            color: lightPurpleColor,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: Color.fromARGB(255, 238, 236, 236),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 238, 236, 236),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    color: lightPurpleColor,
                                    size: 40,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Location",
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        context
                                            .watch<HomeScreenViewModel>()
                                            .listOfSalons[widget.index]
                                            .salonAddress,
                                        style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 12,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Services",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 35,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: context
                                .read<HomeScreenViewModel>()
                                .listOfSalons[widget.index]
                                .listOfServices
                                .length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 238, 236, 236),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      context
                                          .read<HomeScreenViewModel>()
                                          .listOfSalons[widget.index]
                                          .listOfServices[index]['serviceName'],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 40,
                          child: TabBar(
                            unselectedLabelColor: Colors.grey,
                            labelColor: Colors.black,
                            indicatorColor: orangeColor,
                            tabs: const [
                              Tab(
                                text: 'Information',
                              ),
                              Tab(
                                text: 'Portfolio',
                              ),
                              Tab(
                                text: 'Review',
                              )
                            ],
                            controller: _tabController,
                            indicatorSize: TabBarIndicatorSize.tab,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: TabBarView(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text(
                                  style: TextStyle(height: 2),
                                  context
                                      .watch<HomeScreenViewModel>()
                                      .listOfSalons[widget.index]
                                      .salonAddress,
                                ),
                              ),
                              Text('Portfolio'),
                              Text('Review')
                            ],
                            controller: _tabController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                      builder: (ctx) =>
                          SelectServiceScreen(index: widget.index),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: orangeColor,
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.9, 50),
                ),
                child: const Text(
                  "Book Now",
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
