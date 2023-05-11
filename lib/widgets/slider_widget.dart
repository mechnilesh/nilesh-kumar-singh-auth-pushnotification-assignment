import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shalontime/resources/constants/colors.dart';
import 'package:shalontime/views/auth_views/login_screen.dart';
import 'package:shalontime/views/home_screen.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final PageController _pageController = PageController(initialPage: 0);

  int activePage = 0;
  bool isFadeName = true;
  bool isFadeDescription = true;

  List<String> imageList = [
    "assets/images/booking.png",
    "assets/images/haircut.png",
    "assets/images/ontime.png"
  ];

  List<String> headlines = [
    "Book A Visit Easy\nAnd Fast",
    "Find Best Shallon \n Near You",
    "No More Waiting\nFor Your Turn",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(
      imagesLength,
      (index) {
        return Container(
          margin: const EdgeInsets.all(3),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: currentIndex == index ? primaryColor : Colors.grey[300],
            shape: BoxShape.circle,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: PageView.builder(
              itemCount: 3,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) async {
                setState(() {
                  activePage = page;
                });
                // isFadeName = true;
                // isFadeDescription = true;
                // await Future.delayed(const Duration(milliseconds: 600), () {
                //   setState(() {
                //     isFadeName = false;
                //   });
                // });
                // await Future.delayed(
                //   const Duration(milliseconds: 1100),
                //   () {
                //     setState(() {
                //       isFadeDescription = false;
                //     });
                //   },
                // );
              },
              itemBuilder: (context, pagePosition) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          // fit: BoxFit.,
                          image: AssetImage(
                            imageList[activePage],
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            headlines[activePage],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              height: 1.8,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              height: 1.8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(3, activePage),
          ),
          const SizedBox(
            height: 50,
          ),
          activePage == 2
              ? ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (ctx) => LoginScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.9, 50),
                  ),
                  child: const Text(
                    "Try Now",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                )
              : ElevatedButton(
                  onPressed: () {
                    if (activePage < 2) {
                      setState(() {
                        activePage++;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: primaryColor,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      size: 40,
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
