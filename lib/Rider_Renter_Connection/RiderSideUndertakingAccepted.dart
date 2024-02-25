import 'package:bigkoapp/Google_Maps/map_key.dart';
import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_to_act/slide_to_act.dart';

class RiderSideUndertakingAccepted extends StatefulWidget {
  const RiderSideUndertakingAccepted({Key? key}) : super(key: key);

  @override
  State<RiderSideUndertakingAccepted> createState() =>
      _RiderSideUndertakingAcceptedState();
}

class _RiderSideUndertakingAcceptedState
    extends State<RiderSideUndertakingAccepted> {
  bool btn1 = false;
  bool btn2 = false;
  bool btn3 = false;
  DateTime date = DateTime.now();

  fetchRFRDocData() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('RFR-Transactions');
    final snapshot = await users
        .doc("RFR${date.day}${date.month}${date.year}$doclengthofRFR")
        .get();
    final data = snapshot.data() as Map<String, dynamic>;
    rfridofrental = data['RFRID'];
    rentalUndertakingacceptedbyrider = data['Rider-Undertaking'];
    print("rfridforrental=$rfridofrental");
    print("rentalUndertakingacceptedbyrider=$rentalUndertakingacceptedbyrider");
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
          title: const Text("Undertaking-Status"),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white,
                    height: 250,
                    width: 250,
                    child: Lottie.asset("assets/Startkeys.json"),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "The Renter has accepted Your Undertaking, Now You Can Proceed Further.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold),
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 70,
                width: 300,
                child: ElevatedButton.icon(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      print("Check-Bike");
                      setState(() {
                        btn1 = true;
                      });
                    },
                    icon: const Icon(
                      Icons.info_outline,
                      color: Colors.yellow,
                      size: 40,
                    ),
                    label: const Text(
                      "Check-Bike",
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 70,
                width: 300,
                child: ElevatedButton.icon(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      print("Receieved-Bike");
                      setState(() {
                        btn2 = true;
                      });
                    },
                    icon: const Icon(
                      Icons.directions_bike,
                      color: Colors.yellow,
                      size: 40,
                    ),
                    label: const Text(
                      "Recieved-Bike",
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 70,
                width: 300,
                child: ElevatedButton.icon(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      setState(() {
                        btn3 = true;
                      });
                      if (btn1 == true && btn2 == true && btn3 == true) {
                        print("Rider-Driving Screen");
                        DocumentReference users = FirebaseFirestore.instance
                            .collection('RFR-Transactions')
                            .doc("RFR${date.day}${date.month}${date.year}0");
                        users.set({
                          'RFRDocLength': doclengthofRFR,
                          'ShareRenterLocationtoRider': true,
                          'RFRID': "RFR${date.day}${date.month}${date.year}0",
                          'Trip-Date':
                              "${date.day} / ${date.month} / ${date.year}",
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
                        Navigator.pushNamed(context, 'RiderDrivingScreen.id');
                      } else {
                        print(
                            "Please Click on all the Buttons to start the Trip");
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.directions_bike,
                                size: 32,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                  child: Text(
                                      'Please Slide on all the Buttons to start the Trip as Part of Bike-Checkup Status.',
                                      style: TextStyle(
                                        fontSize: 20,
                                      )))
                            ],
                          ),
                          backgroundColor: Colors.red,
                          duration: const Duration(seconds: 3),
                          shape: const StadiumBorder(),
                          margin: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          behavior: SnackBarBehavior.floating,
                          elevation: 0,
                        ));
                      }
                    },
                    icon: const Icon(
                      Icons.play_circle,
                      color: Colors.yellow,
                      size: 40,
                    ),
                    label: const Text(
                      "Start-Trip",
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
