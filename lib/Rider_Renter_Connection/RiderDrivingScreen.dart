import 'package:bigkoapp/Google_Maps/map_key.dart';
import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class RiderDrivingScreen extends StatefulWidget {
  const RiderDrivingScreen({Key? key}) : super(key: key);

  @override
  State<RiderDrivingScreen> createState() => _RiderDrivingScreenState();
}

class _RiderDrivingScreenState extends State<RiderDrivingScreen> {
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: AppBar(
          title: const Text("Rider-Driving-Screen"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          titleTextStyle: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.yellow, fontSize: 20),
          backgroundColor: Colors.blue.shade900,
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Lottie.asset('assets/whiletrip.json'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 85,
                width: 300,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  icon: const Icon(
                    Icons.settings,
                    size: 40,
                    color: Colors.yellow,
                  ),
                  label: const Text(
                    "Fill-Fuel / Repair",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'checkfuelbill.id');
                  },
                )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 85,
                width: 300,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  icon: const Icon(
                    Icons.stop_circle,
                    size: 40,
                    color: Colors.yellow,
                  ),
                  label: const Text(
                    "End-Trip",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow),
                  ),
                  onPressed: () {
                    print("Trip Ended");
                    DocumentReference users = FirebaseFirestore.instance
                        .collection('RFR-Transactions')
                        .doc("RFR${date.day}${date.month}${date.year}0");
                    users.set({
                      'RFRDocLength': doclengthofRFR,
                      'ShareRenterLocationtoRider': true,
                      'RFRID': "RFR${date.day}${date.month}${date.year}0",
                      'Trip-Date': "${date.day} / ${date.month} / ${date.year}",
                      'Renter-Address': presentAddressofuser,
                      'Rental-Status': "Started",
                      'Renter-Location': sourceLocation.toString(),
                      'Rider-Location': finaldestination.toString(),
                      'Renter-PhoneNumber': phonenumberofrentertocall,
                      'Rider-PhoneNumber': phonenumberofridertocall,
                      'RiderReachedToRenter': true,
                      'RenterVerifiedRiderReached': true,
                      'Rider-Undertaking': true,
                      'Renter-Undertaking': true,
                      'Rental-Duration': rentalduration,
                      'Rental-Description': reasonforrental,
                      'Check-Bike-To-Rent-By-Rider': true,
                      'Bike-Receieved-To-Start-Trip': true,
                      'End-Trip-By-Rider': false,
                      'End-Trip-By-Renter': false,
                      'Start-Trip-By-Rider': true,
                      'Start-Trip-By-Renter': true,
                      'Vehicle-Name': gaadiname,
                      'Renter-Name': globalUseremail,
                      'Rider-Name': myriderchater,
                      'Vehicle-No': gaadinumber,
                      'Rental-Amount': rentalamount,
                      'Rental-Ratings': "",
                      'Check-Bike-After-Rental-Renter': false,
                      'Rider-Paid-Amount': false,
                      'Payment-Done': false,
                    });
                    Navigator.pushNamed(context, 'RentalBill.id');
                    //Navigator.pushNamed(context, 'checkfuelbill.id');
                  },
                )),
          ],
        )),
        floatingActionButton: SizedBox(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            backgroundColor: Colors.yellow,
            child: const Icon(
              Icons.call,
              size: 40,
              color: Colors.black,
            ),
            onPressed: () {
              _makingPhoneCall();
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      ),
    );
  }

  _makingPhoneCall() async {
    var url = Uri.parse("tel:9494570865");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
