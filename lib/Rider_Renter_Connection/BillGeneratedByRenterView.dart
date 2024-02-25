import 'package:bigkoapp/Google_Maps/map_key.dart';
import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class BillGeneratedByRenter extends StatefulWidget {
  const BillGeneratedByRenter({Key? key}) : super(key: key);

  @override
  State<BillGeneratedByRenter> createState() => _BillGeneratedByRenterState();
}

class _BillGeneratedByRenterState extends State<BillGeneratedByRenter> {
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
          title: const Text("My-Rental-Bill"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          titleTextStyle: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.yellow, fontSize: 20),
          backgroundColor: Colors.blue.shade900,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 20,
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
                                      image: AssetImage("assets/random3.png"),
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
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 3, color: Colors.black)),
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "Vehicle-Name \n $gaadiname",
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
                                border:
                                    Border.all(width: 3, color: Colors.black)),
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "Vehicle-No \n $gaadinumber",
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
                                border:
                                    Border.all(width: 3, color: Colors.black)),
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "Rent-Amount \n $rentalamount",
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
                                border:
                                    Border.all(width: 3, color: Colors.black)),
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "Rent-Duration \n $rentalduration",
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
                                border:
                                    Border.all(width: 3, color: Colors.black)),
                            padding: const EdgeInsets.all(8),
                            child: const Text(
                              "Any-Problems \n No",
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
                                border:
                                    Border.all(width: 3, color: Colors.black)),
                            padding: const EdgeInsets.all(8),
                            child: const Text(
                              "Problem \n Nothing",
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SlideAction(
                  borderRadius: 12,
                  elevation: 0,
                  innerColor: Colors.yellow,
                  outerColor: Colors.black,
                  sliderButtonIcon: const Icon(
                    Icons.check_box,
                    color: Colors.black,
                    size: 28,
                  ),
                  sliderRotate: false,
                  text: 'Check-Bike',
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow),
                  onSubmit: () {
                    DocumentReference users = FirebaseFirestore.instance
                        .collection('RFR-Transactions')
                        .doc("RFR${date.day}${date.month}${date.year}0");
                    users.set({
                      'RFRDocLength': doclengthofRFR,
                      'ShareRenterLocationtoRider': true,
                      'RFRID': "RFR${date.day}${date.month}${date.year}0",
                      'Trip-Date': "${date.day} / ${date.month} / ${date.year}",
                      'Renter-Address': presentAddressofuser,
                      'Rental-Status': "Ended",
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
                      'End-Trip-By-Rider': true,
                      'End-Trip-By-Renter': true,
                      'Start-Trip-By-Rider': true,
                      'Start-Trip-By-Renter': true,
                      'Vehicle-Name': gaadiname,
                      'Renter-Name': globalUseremail,
                      'Rider-Name': myriderchater,
                      'Vehicle-No': gaadinumber,
                      'Rental-Amount': rentalamount,
                      'Rental-Ratings': "",
                      'Check-Bike-After-Rental-Renter': true,
                      'Rider-Paid-Amount': false,
                      'Payment-Done': false,
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SlideAction(
                  borderRadius: 12,
                  elevation: 0,
                  innerColor: Colors.yellow,
                  outerColor: Colors.black,
                  sliderButtonIcon: const Icon(
                    Icons.payment,
                    color: Colors.black,
                    size: 28,
                  ),
                  sliderRotate: false,
                  text: 'Amount-Paid',
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow),
                  onSubmit: () {
                    print("Amount-paid");
                    DocumentReference users = FirebaseFirestore.instance
                        .collection('RFR-Transactions')
                        .doc("RFR${date.day}${date.month}${date.year}0");
                    users.set({
                      'RFRDocLength': doclengthofRFR,
                      'RFRID': "RFR${date.day}${date.month}${date.year}0",
                      'Trip-Date': "${date.day} / ${date.month} / ${date.year}",
                      'Renter-Address': presentAddressofuser,
                      'Rental-Status': "Ended",
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
                      'End-Trip-By-Rider': true,
                      'End-Trip-By-Renter': true,
                      'Start-Trip-By-Rider': true,
                      'Start-Trip-By-Renter': true,
                      'Vehicle-Name': gaadiname,
                      'Renter-Name': globalUseremail,
                      'Rider-Name': myriderchater,
                      'Vehicle-No': gaadinumber,
                      'Rental-Amount': rentalamount,
                      'Rental-Ratings': "",
                      'Check-Bike-After-Rental-Renter': true,
                      'Rider-Paid-Amount': true,
                      'Payment-Done': true,
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.thumb_up,
                            size: 32,
                          ),
                          SizedBox(width: 16),
                          Expanded(
                              child: Text('Trip-Completed',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)))
                        ],
                      ),
                      backgroundColor: Colors.yellow,
                      duration: const Duration(seconds: 3),
                      shape: const StadiumBorder(),
                      margin: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 12),
                      behavior: SnackBarBehavior.floating,
                      elevation: 0,
                    ));
                    Navigator.pushNamed(context, 'RenterTabs.id');
                  }),
            )
          ]),
        ),
      ),
    );
  }
}
