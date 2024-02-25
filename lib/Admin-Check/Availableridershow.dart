import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Availableridershow extends StatefulWidget {
  const Availableridershow({Key? key}) : super(key: key);

  @override
  State<Availableridershow> createState() => _AvailableridershowState();
}

class _AvailableridershowState extends State<Availableridershow> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  Navigator.pushNamed(context, 'PresentAccount.id');
                },
                icon: const Icon(Icons.directions_bike))
          ],
          title: const Text(
            "Available Riders",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue.shade900,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Rider-details')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                          child: CircularProgressIndicator(
                              color: Color(0xFFffcd3c)));
                    } else {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView(
                              padding: const EdgeInsets.all(8),
                              primary: false,
                              shrinkWrap: true,
                              children: snapshot.data!.docs.map((d) {
                                return Container(
                                  margin: const EdgeInsets.all(10),
                                  color: Colors.blue.shade900,
                                  child: RiderAvailable(d),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget RiderAvailable(d) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 30),
          width: double.infinity,
          child: Card(
              color: const Color(0xFFffcd3c),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 40, bottom: 0, left: 20, right: 10),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          d.data()['Rider-Name'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.white),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("Verified-Rider with valid Bike-License",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        ButtonBar(
                          children: <Widget>[
                            SizedBox(
                              height: 60,
                              width: 180,
                              child: ElevatedButton.icon(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.black)),
                                icon: const Icon(
                                  Icons.remove_red_eye,
                                  size: 40,
                                  color: Color(0xFFffcd3c),
                                ),
                                label: const Text(
                                  "View",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFffcd3c)),
                                ),
                                onPressed: () {
                                  Ridersforbike(d);
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
        ),
        circularImageWithBorder(d.data()['Rider-Selfie'], 40, 5, Colors.black),
      ],
    );
  }

  static Widget circularImageWithBorder(
      String imgPath, double rad, double borderWidth, Color borderColor) {
    return CircleAvatar(
        radius: rad + borderWidth,
        backgroundColor: borderColor,
        child: CircleAvatar(
          backgroundImage: NetworkImage(imgPath),
          radius: rad,
        ));
  }

  Ridersforbike(d) {
    print(d.data()['Rider-Selfie']);
    print(d.data()['Rider-Name']);
    print(d.data()['Rider-Address']);
    print(d.data()['Rider-Age']);
    print(d.data()['Rider-PhoneNumber']);
    ridernaam = d.data()['Rider-Name'];
    rideradda = d.data()['Rider-Address'];
    riderkaphonenp = d.data()['Rider-PhoneNumber'];
    riderkasaal = d.data()['Rider-Age'];
    riderselfietoshow = d.data()['Rider-Selfie'];
    Future.delayed(const Duration(seconds: 1), (() => rideradda));
    Future.delayed(const Duration(seconds: 1), (() => riderkaphonenp));
    Future.delayed(const Duration(seconds: 1), (() => riderkasaal));
    Future.delayed(const Duration(seconds: 1), (() => ridernaam));
    Future.delayed(const Duration(seconds: 1), (() => riderselfietoshow));
    Navigator.pushNamed(context, 'Renterselectrider.id');
  }
}
