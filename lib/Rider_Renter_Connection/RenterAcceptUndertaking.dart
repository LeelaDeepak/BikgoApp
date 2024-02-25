import 'package:bigkoapp/Google_Maps/map_key.dart';
import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_to_act/slide_to_act.dart';

class RenterAcceptUndertaking extends StatefulWidget {
  const RenterAcceptUndertaking({Key? key}) : super(key: key);

  @override
  State<RenterAcceptUndertaking> createState() =>
      _RenterAcceptUndertakingState();
}

class _RenterAcceptUndertakingState extends State<RenterAcceptUndertaking> {
  DateTime date = DateTime.now();

  fetchRFRDocData() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('RFR-Transactions');
    final snapshot =
        await users.doc("RFR${date.day}${date.month}${date.year}0").get();
    final data = snapshot.data() as Map<String, dynamic>;
    rfridofrental = data['RFRID'];
    rentalUndertakingacceptedbyrider = data['Rider-Undertaking'];
    print("rfridforrental=$rfridofrental");
  }

  @override
  void initState() {
    fetchRFRDocData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            backgroundColor: Colors.blue.shade900,
            appBar: AppBar(
              title: const Text("Rider Accept Status"),
              automaticallyImplyLeading: false,
              titleTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                  fontSize: 20),
              centerTitle: true,
              backgroundColor: Colors.blue.shade900,
            ),
            body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    height: 250,
                    width: 250,
                    child: Lottie.asset('assets/AcceptedStatus.json'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "The Rider has accepted the Undertaking, Now You Can Proceed Further.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold),
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SlideAction(
                    borderRadius: 12,
                    elevation: 0,
                    innerColor: Colors.yellow,
                    outerColor: Colors.black,
                    sliderButtonIcon: const Icon(
                      Icons.directions_bike_sharp,
                      color: Colors.black,
                      size: 28,
                    ),
                    sliderRotate: false,
                    text: 'Start-Rental',
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow),
                    onSubmit: () {
                      print("Rental-Started");

                      DocumentReference users = FirebaseFirestore.instance
                          .collection('RFR-Transactions')
                          .doc("RFR${date.day}${date.month}${date.year}0");
                      users.set({
                        'RFRDocLength': doclengthofRFR,
                        'RFRID': "RFR${date.day}${date.month}${date.year}0",
                        'Trip-Date':
                            "${date.day} / ${date.month} / ${date.year}",
                        'Renter-Address': presentAddressofuser,
                        'ShareRenterLocationtoRider': true,
                        'Rental-Status': "Started",
                        'Renter-Location': sourceLocation.toString(),
                        'Rider-Location': finaldestination.toString(),
                        'Renter-PhoneNumber': phonenumberofrentertocall,
                        'Rider-PhoneNumber': phonenumberofridertocall,
                        'RiderReachedToRenter': true,
                        'RenterVerifiedRiderReached': true,
                        'Rider-Undertaking': true,
                        'Renter-Undertaking': true,
                        'Rental-Duration': "",
                        'Rental-Description': "",
                        'Check-Bike-To-Rent-By-Rider': false,
                        'Bike-Receieved-To-Start-Trip': false,
                        'End-Trip-By-Rider': false,
                        'End-Trip-By-Renter': false,
                        'Start-Trip-By-Rider': true,
                        'Start-Trip-By-Renter': true,
                        'Vehicle-Name': "",
                        'Renter-Name': globalUseremail,
                        'Rider-Name': myriderchater,
                        'Vehicle-No': "",
                        'Rental-Amount': "",
                        'Rental-Ratings': "",
                        'Check-Bike-After-Rental-Renter': false,
                        'Rider-Paid-Amount': false,
                        'Payment-Done': false,
                      });
                      Navigator.pushNamed(
                          context, 'RenterEnterRentalDetails.id');
                    }),
              )
            ])));
  }
}
