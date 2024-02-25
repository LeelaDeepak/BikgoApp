import 'package:bigkoapp/Google_Maps/map_key.dart';
import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_to_act/slide_to_act.dart';

class PreviewBillDetails extends StatefulWidget {
  const PreviewBillDetails({Key? key}) : super(key: key);

  @override
  State<PreviewBillDetails> createState() => _PreviewBillDetailsState();
}

class _PreviewBillDetailsState extends State<PreviewBillDetails> {
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
          title: const Text("Preview-Rental-Bill"),
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
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white,
                    height: 250,
                    width: 250,
                    child: Lottie.asset("assets/Preview_Bill.json"),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Text(
                                    "Renter",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ClipOval(
                                    child: Material(
                                      color: Colors.white,
                                      child: Ink.image(
                                        image: const AssetImage(
                                            "assets/random3.png"),
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 100,
                                        child: InkWell(onTap: () {}),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Text(
                                    "Rider",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ClipOval(
                                    child: Material(
                                      color: Colors.white,
                                      child: Ink.image(
                                        image: const AssetImage(
                                            "assets/random2.png"),
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 100,
                                        child: InkWell(onTap: () {}),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Renter Undertaking",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 4, color: Colors.black)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "I am Ready to Hand over the Bike to the Rider, as part of the Bikgo-Rental Process.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 4, color: Colors.black)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "I declare that I will accept responsibility for returning my bike in the event of an emergency that was not caused by the rider.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 4, color: Colors.black)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "I ensure that Bike Has Minimum Fuel.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 3, color: Colors.black)),
                              padding: const EdgeInsets.all(8),
                              child: const Text(
                                "Vehicle-Name \n Bajaj",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 3, color: Colors.black)),
                              padding: const EdgeInsets.all(8),
                              child: const Text(
                                "Vehicle-No \n TS 4687 NJ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 3, color: Colors.black)),
                              padding: const EdgeInsets.all(8),
                              child: const Text(
                                "Rent-Amount \n 450Rs",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 3, color: Colors.black)),
                              padding: const EdgeInsets.all(8),
                              child: const Text(
                                "Rent-Duration \n 12 Hours",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                          ],
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 10,
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
                    text: 'Start-Renting',
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow),
                    onSubmit: () {
                      if (myriderchater == "Freoz Shah") {
                        gaadinumber = "TS 5779 GM";
                        gaadiname = "Royal Enfield";
                        if (rentalduration == "6 Hours") {
                          rentalamount = "250";
                        } else if (rentalduration == "12 Hours") {
                          rentalamount = "500";
                        } else {
                          rentalamount = "1000";
                        }
                      } else if (myriderchater == "Pradeep Rawat") {
                        gaadinumber = "AP 8976 BK";
                        gaadiname = "Honda SP";
                        if (rentalduration == "6 Hours") {
                          rentalamount = "200";
                        } else if (rentalduration == "12 Hours") {
                          rentalamount = "400";
                        } else {
                          rentalamount = "800";
                        }
                      } else if (myriderchater == "Rajesh Bhat") {
                        gaadinumber = "TN 9952 JX";
                        gaadiname = "Hero XPulse";
                        if (rentalduration == "6 Hours") {
                          rentalamount = "250";
                        } else if (rentalduration == "12 Hours") {
                          rentalamount = "500";
                        } else {
                          rentalamount = "1000";
                        }
                      } else if (myriderchater == "Vinod Sharma") {
                        gaadinumber = "TS 4687 NJ";
                        gaadiname = "Pulsar";
                        if (rentalduration == "6 Hours") {
                          rentalamount = "225";
                        } else if (rentalduration == "12 Hours") {
                          rentalamount = "450";
                        } else {
                          rentalamount = "900";
                        }
                      }
                      DocumentReference users = FirebaseFirestore.instance
                          .collection('RFR-Transactions')
                          .doc("RFR${date.day}${date.month}${date.year}0");
                      users.set({
                        'RFRDocLength': doclengthofRFR,
                        'RFRID': "RFR${date.day}${date.month}${date.year}0",
                        'Trip-Date':
                            "${date.day} / ${date.month} / ${date.year}",
                        'ShareRenterLocationtoRider': true,
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
                        'Check-Bike-To-Rent-By-Rider': false,
                        'Bike-Receieved-To-Start-Trip': false,
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
                      print("Rental-Started");
                      Navigator.pushNamed(context, 'TrackingRiderWhileTrip.id');
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
