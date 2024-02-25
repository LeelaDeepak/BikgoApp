import 'package:bigkoapp/Google_Maps/map_key.dart';
import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RiderUndertaking extends StatefulWidget {
  const RiderUndertaking({Key? key}) : super(key: key);

  @override
  State<RiderUndertaking> createState() => _RiderUndertakingState();
}

class _RiderUndertakingState extends State<RiderUndertaking> {
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
            automaticallyImplyLeading: false,
            titleTextStyle: const TextStyle(
                color: Colors.yellow,
                fontSize: 22,
                fontWeight: FontWeight.bold),
            backgroundColor: Colors.blue.shade900,
            title: const Text("Rider-Undertaking"),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
              child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Condition Of Vehicle',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.yellow),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Padding(
                        padding: EdgeInsets.all(2),
                        child: Text(
                          "The Rider acknowledges that they have examined the vehicle and have found it to be in good condition and free of any known defects. The Rider agrees to return the bike to the Owner in the same condition as when rented, ordinary wear and tear excepted.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Security-Deposit',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.yellow),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Padding(
                        padding: EdgeInsets.all(2),
                        child: Text(
                          "The Rider shall pay a security deposit of to the Owner. The security deposit will be deducted if in case of any problem, provided the vehicle is returned in the same condition as when rented.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Rental Fees',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.yellow),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Padding(
                        padding: EdgeInsets.all(2),
                        child: Text(
                          "The Rider agrees to pay the Owner the rental amount of 1000rs for the use of bike.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Use Of Bike',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.yellow),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Padding(
                        padding: EdgeInsets.all(2),
                        child: Text(
                          "The Rider agrees to use the vehicle only for personal use and will not use the vehicle for any illegal purpose, including but not limited to transporting illegal drugs or contraband.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Maintenance and Repair',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.yellow),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Padding(
                        padding: EdgeInsets.all(2),
                        child: Text(
                          "The Rider agrees to keep the vehicle maintained and to notify the Owner immediately of any problems or needed repairs. The Rider shall not undertake any repairs on the vehicle without the prior written consent of the Owner.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Indemnification',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.yellow),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Padding(
                        padding: EdgeInsets.all(2),
                        child: Text(
                          "The Rider shall indemnify and hold harmless the Owner from any and all claims, actions, damages, or expenses arising from the Rider’s use of the bike.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Governing Law',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.yellow),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Container(
                      alignment: Alignment.center,
                      child: const Padding(
                        padding: EdgeInsets.all(2),
                        child: Text(
                          "This Agreement shall be governed by and construed in accordance with the RTA policies and safety rules.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 60,
                          width: 200,
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green),
                              onPressed: () {
                                DocumentReference users = FirebaseFirestore
                                    .instance
                                    .collection('RFR-Transactions')
                                    .doc(
                                        "RFR${date.day}${date.month}${date.year}0");
                                users.set({
                                  'RFRDocLength': doclengthofRFR,
                                  'ShareRenterLocationtoRider': true,
                                  'RFRID':
                                      "RFR${date.day}${date.month}${date.year}0",
                                  'Trip-Date':
                                      "${date.day} / ${date.month} / ${date.year}",
                                  'Renter-Address': presentAddressofuser,
                                  'Rental-Status': "Started",
                                  'Renter-Location': sourceLocation.toString(),
                                  'Rider-Location': finaldestination.toString(),
                                  'Renter-PhoneNumber':
                                      phonenumberofrentertocall,
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
                                    context, 'RiderSideUndertakingAccepted.id');
                              },
                              icon: const Icon(
                                Icons.thumb_up,
                                color: Colors.black,
                                size: 40,
                              ),
                              label: const Text(
                                "Accept",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ))),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 60,
                          width: 200,
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.yellow,
                                      title: const Text(
                                        'Confirm To Deny',
                                        textAlign: TextAlign.center,
                                      ),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: [
                                            Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 3,
                                                        color: Colors.black)),
                                                child: Lottie.asset(
                                                    "assets/failed.json")),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Upon Denying the Undertaking,",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                                "The Rental process cannot be proceeded further.",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: const Text(
                                            'Yes',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onPressed: () {},
                                        ),
                                        TextButton(
                                          child: const Text('No',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.thumb_down,
                                color: Colors.black,
                                size: 40,
                              ),
                              label: const Text(
                                "Deny",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ))),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          )),
        ));
  }
}
