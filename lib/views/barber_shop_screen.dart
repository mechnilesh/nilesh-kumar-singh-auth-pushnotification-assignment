import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalontime/views/select_service_screen.dart';
import '../resources/constants/colors.dart';

class BarberShopDetailsScreen extends StatefulWidget {
  const BarberShopDetailsScreen({super.key});

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
                              "Venny's Barber",
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
                                        "Madbrains Technolgy & solutions LLP, UP, India",
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
                            itemCount: 14,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: Color.fromARGB(255, 238, 236, 236),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Hair Cut"),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 40,
                          child: TabBar(
                            unselectedLabelColor: Colors.grey,
                            labelColor: Colors.black,
                            indicatorColor: orangeColor,
                            tabs: const [
                              Tab(
                                text: 'Information  ',
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
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                    style: TextStyle(height: 2),
                                    "In Flutter, a tab bar is a widget that displays a row of tabs, and each tab can contain a separate content or view. Tab bars are commonly used in mobile app UIs to allow users to switch between different sections or pages within the same screen. Here's an example of how to implement a tab bar in Flutter: In Flutter, a tab bar is a widget that displays a row of tabs, and each tab can contain a separate content or view. Tab bars are commonly used in mobile app UIs to allow users to switch between different sections or pages within the same screen. Here's an example of how to implement a tab bar in Flutter:"),
                              ),
                              Text('Person'),
                              Text('Person')
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
                      builder: (ctx) => const SelectServiceScreen(),
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
