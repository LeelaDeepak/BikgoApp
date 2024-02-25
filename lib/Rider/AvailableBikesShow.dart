import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../globaldetails.dart';

class Availableshowtorider extends StatefulWidget {
  const Availableshowtorider({Key? key}) : super(key: key);

  @override
  State<Availableshowtorider> createState() => _AvailableshowtoriderState();
}

class _AvailableshowtoriderState extends State<Availableshowtorider> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              }),
          automaticallyImplyLeading: false,
          title: const Text(
            "Available Bikes",
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
                      .collection('Renter-details')
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
                              children: snapshot.data!.docs.map((doc) {
                                return Container(
                                  margin: const EdgeInsets.all(10),
                                  color: Colors.blue.shade900,
                                  child: BikesAvailable(doc),
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

  Widget BikesAvailable(doc) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xFFffcd3c)),
      padding: const EdgeInsets.all(18),
      child: Card(
        color: const Color(0xFFffcd3c),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Model:- ${doc.data()['Renter-BikeModel']}",
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Material(
                elevation: 4.0,
                clipBehavior: Clip.hardEdge,
                color: const Color(0xFFffcd3c),
                shape: RoundedRectangleBorder(
                    side: BorderSide(width: 4, color: Colors.blue.shade900),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    BikesShowtoRider(doc),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget BikesShowtoRider(doc) {
    return InkWell(
      onTap: () {
        print("object");

        print("Selected-Bike:");
        print(doc.data()['Renter-Name']);
        Renterkanaam = doc.data()['Renter-Name'];
        RenterBikekaphoto = doc.data()['Renter-Bike-Photo'];
        Renterkaselfie = doc.data()['Renter-Selfie'];
        RenterBikeNaam = doc.data()['Renter-BikeModel'];
        Renterkaaddress = doc.data()['Renter-Address'];
        Renterkaphone = doc.data()['Renter-PhoneNumber'];
        Renterkaemail = doc.data()['Email'];
        Future.delayed(const Duration(seconds: 1), (() => Renterkanaam));
        Future.delayed(const Duration(seconds: 1), (() => RenterBikekaphoto));
        Future.delayed(const Duration(seconds: 1), (() => Renterkaselfie));
        Future.delayed(const Duration(seconds: 1), (() => RenterBikeNaam));
        Future.delayed(const Duration(seconds: 1), (() => Renterkaaddress));
        Future.delayed(const Duration(seconds: 1), (() => Renterkaphone));
        Future.delayed(const Duration(seconds: 1), (() => Renterkaemail));
        print("See Bike");
        print("Bike-Image:$RenterBikekaphoto");
        if (Renterkaemail == globalUseremail) {
          print("He is already a renter and a rider");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.error,
                  size: 32,
                  color: Colors.white,
                ),
                SizedBox(width: 16),
                Expanded(
                    child: Text("Seem You want to rent your bike to yourself",
                        style: TextStyle(
                          fontSize: 20,
                        )))
              ],
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
            shape: const StadiumBorder(),
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            behavior: SnackBarBehavior.floating,
            elevation: 0,
          ));
        }
        print(Renterkaselfie);
        print(Renterkaaddress);
        print(Renterkaphone);
        print("Bike-Photos-Links: $RenterBikekaphoto");
        Navigator.pushNamed(context, 'SelectedBikeByRider.id');
      },
      splashColor: const Color(0xFFffcd3c).withOpacity(0.5),
      child: Ink(
        height: 250,
        width: 350,
        child: CachedNetworkImage(
          imageUrl: doc.data()['Renter-Bike-Photo'].toString(),
          placeholder: (context, RenterBikeLinks) =>
              const CircularProgressIndicator(
            color: Colors.black,
          ),
          errorWidget: (context, RenterBikeLinks, error) => const Icon(
            Icons.error,
            color: Colors.red,
            size: 80,
          ),
        ),
      ),
    );
  }
}
