import 'package:bigkoapp/globaldetails.dart';
import 'package:flutter/material.dart';

class SelectedBike extends StatefulWidget {
  const SelectedBike({Key? key}) : super(key: key);

  @override
  State<SelectedBike> createState() => _SelectedBikeState();
}

class _SelectedBikeState extends State<SelectedBike> {
  final double coverHeight = 280;
  final double profileHeight = 144;
  double top = 280 - 144 / 2;
  final bottom = 144 / 2;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFffcd3c),
        appBar: AppBar(
            title: const Text(
              "Rent the Bike",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue.shade900),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView(
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.zero,
                  children: [buildTop(), buildContent()]),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Text(
              ridernaam,
              textAlign: TextAlign.center,
              style: const TextStyle(
                backgroundColor: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildScreenIcon1(Icons.call),
                const SizedBox(
                  width: 12,
                ),
                buildScreenIcon2(Icons.message),
                const SizedBox(
                  width: 12,
                ),
                buildScreenIcon3(Icons.star),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Rider-Address:- \n" + rideradda,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Rider-Age:- " + riderkasaal,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildScreenIcon1(IconData iconData) => CircleAvatar(
      radius: 35,
      child: Center(
        child: IconButton(
          icon: Icon(iconData),
          iconSize: 32,
          onPressed: () {
            print("Hi");
          },
        ),
      ));

  Widget buildScreenIcon2(IconData iconData) => CircleAvatar(
      radius: 35,
      child: Center(
        child: IconButton(
          icon: Icon(iconData),
          iconSize: 32,
          onPressed: () {
            print("Hi");
          },
        ),
      ));

  Widget buildScreenIcon3(IconData iconData) => CircleAvatar(
      radius: 35,
      child: Center(
        child: IconButton(
          icon: Icon(iconData),
          iconSize: 32,
          onPressed: () {
            print("Hi");
          },
        ),
      ));

  Widget buildTop() {
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            child: buildCoverImage(),
            margin: EdgeInsets.only(bottom: bottom),
          ),
          Positioned(top: top, child: buildProfileImage())
        ]);
  }

  Widget buildCoverImage() => Image.asset(
        'assets/RiderCard.png',
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundImage: NetworkImage(riderselfietoshow),
      );
}
