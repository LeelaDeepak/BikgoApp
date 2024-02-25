import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'HomePage.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            onPageChanged: (index) {
              setState(() => isLastPage = index == 3);
            },
            controller: controller,
            children: [
              buildPage(
                  color: Colors.blue.shade900,
                  urlImage: "assets/bikesforscreens.PNG",
                  title: 'Select-Bike',
                  subtitle: 'Choose the bike of your choice wisely.'),
              buildPage(
                  urlImage: "assets/enjoyride.png",
                  color: Colors.blue.shade900,
                  title: 'Enjoy-Ride',
                  subtitle: 'Enjoy your ride for the duration of time.'),
              buildPage(
                  color: Colors.blue.shade900,
                  urlImage: "assets/payment.png",
                  title: 'Pay-Ride',
                  subtitle: 'Pay for your ride according to your duration.'),
              buildPage(
                  color: Colors.blue.shade900,
                  urlImage: "assets/returnbikebacktoowner.png",
                  title: 'Return-Bike',
                  subtitle: 'Return the bike to its owner after your ride.')
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    backgroundColor: Colors.black,
                    minimumSize: const Size.fromHeight(80)),
                child: const Text(
                  'Get-Started',
                  style: TextStyle(fontSize: 24, color: Colors.yellow),
                ),
                onPressed: () async {
                  //navigate directly to home page
                  Navigator.pushNamed(context, 'Home.id');
                },
              )
            : Container(
                //padding btw Next button and Skip Button
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          controller.jumpToPage(4);
                        },
                        child: Text(
                          'SKIP',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue.shade900,
                          ),
                        )),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 4,
                        effect: WormEffect(
                            spacing: 16,
                            dotColor: Colors.blue.shade900,
                            activeDotColor: Colors.blue.shade900),
                        onDotClicked: (index) => controller.animateToPage(index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          'NEXT',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue.shade900,
                          ),
                        )),
                  ],
                ),
              ),
      ),
    );
  }

  Widget buildPage(
          {required Color color,
          required String urlImage,
          required String title,
          required String subtitle}) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(48), // Image radius
                  child: Image.asset(urlImage, fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 44),
            Text(title,
                style: const TextStyle(
                  color: Colors.yellow,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ],
        ),
      );
}
