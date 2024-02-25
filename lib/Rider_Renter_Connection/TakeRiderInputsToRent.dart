import 'package:bigkoapp/Google_Maps/map_key.dart';
import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_to_act/slide_to_act.dart';

class StartTakingInputByRider extends StatefulWidget {
  const StartTakingInputByRider({Key? key}) : super(key: key);

  @override
  State<StartTakingInputByRider> createState() =>
      _StartTakingInputByRiderState();
}

class _StartTakingInputByRiderState extends State<StartTakingInputByRider> {
  int _selected = 1;
  DateTime date = DateTime.now();
  String btn1 = "6 Hours";
  String btn2 = "12 Hours";
  String btn3 = "Rent Days";
  TextEditingController daysController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: AppBar(
          title: const Text("Rental-Details"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          titleTextStyle: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.yellow, fontSize: 20),
          backgroundColor: Colors.blue.shade900,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 250,
                    width: 250,
                    child: Lottie.asset("assets/FillupFormtoRent.json"),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Rental-Duration",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Center(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: _icon(1,
                                        text: Text(
                                          btn1,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        icon: Icons.directions_bike),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: _icon(2,
                                        text: Text(
                                          btn2,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        icon: Icons.directions_bike),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: _icon(3,
                                        text: Text(
                                          btn3,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        icon: Icons.directions_bike),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Text(
                "Rental-Description",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(8),
                  width: 370,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      hintText: 'Rider Reason To Rent',
                      prefixIcon: Icon(
                        Icons.directions_bike,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    controller: reasonController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 70,
                    width: 300,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      child: const Text(
                        "Preview-Bill",
                        style: TextStyle(color: Colors.yellow, fontSize: 18),
                      ),
                      onPressed: () {
                        reasonforrental = reasonController.text;
                        if (_selected == 1 && reasonController.text != "") {
                          print("Rental-Started");
                          rentalduration = "6 Hours";
                          reasonforrental = reasonController.text;
                          DocumentReference users = FirebaseFirestore.instance
                              .collection('RFR-Transactions')
                              .doc("RFR${date.day}${date.month}${date.year}0");
                          users.set({
                            'RFRDocLength': doclengthofRFR,
                            'RFRID': "RFR${date.day}${date.month}${date.year}0",
                            'Trip-Date':
                                "${date.day} / ${date.month} / ${date.year}",
                            'Renter-Address': presentAddressofuser,
                            'Rental-Status': "Started",
                            'ShareRenterLocationtoRider': true,
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
                          Navigator.pushNamed(context, 'PreviewBill.id');
                        } else if (_selected == 2 &&
                            reasonController.text != "") {
                          print("Rental-Started");
                          rentalduration = "12 Hours";
                          DocumentReference users = FirebaseFirestore.instance
                              .collection('RFR-Transactions')
                              .doc("RFR${date.day}${date.month}${date.year}0");
                          users.set({
                            'RFRDocLength': doclengthofRFR,
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
                          Navigator.pushNamed(context, 'PreviewBill.id');
                        } else if (_selected == 3 &&
                            reasonController.text != "") {
                          if (rentaldays.toString() != "") {
                            rentalduration = rentaldays;
                            print("Rental-Started");
                            DocumentReference users = FirebaseFirestore.instance
                                .collection('RFR-Transactions')
                                .doc(
                                    "RFR${date.day}${date.month}${date.year}0");
                            users.set({
                              'RFRDocLength': doclengthofRFR,
                              'RFRID':
                                  "RFR${date.day}${date.month}${date.year}0",
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
                            Navigator.pushNamed(context, 'PreviewBill.id');
                          } else {
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
                                          'Enter the No.of Days for Renting in Days',
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
                        } else {
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
                                        'Enter the Details to Start Rental Process.',
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
                    ),
                  ))
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Enter The Number Of Rental Days'),
            content: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  rentaldays = value;
                });
              },
              controller: daysController,
              decoration:
                  const InputDecoration(hintText: "Number Of Rental Days"),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: const Text(
                  'Rent',
                  style: TextStyle(color: Colors.yellow),
                ),
                onPressed: () {
                  rentaldays = daysController.text;
                  if (daysController.text.isEmpty) {
                    print("Enter Number of days to rent");
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
                                  'Enter the No.of Days for Renting in Days',
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
                  } else {
                    print("Days=" + rentaldays);
                    Navigator.pop(context);
                    daysController.clear();
                  }
                },
              ),
            ],
          );
        });
  }

  Widget _icon(int index, {required Text text, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkResponse(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 40,
                color: _selected == index ? Colors.yellow : Colors.white,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                    (index == 1)
                        ? btn1
                        : (index == 2)
                            ? btn2
                            : btn3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color:
                            _selected == index ? Colors.yellow : Colors.white)),
              ),
            ],
          ),
          onTap: () {
            setState(
              () {
                _selected = index;
              },
            );
            print("Rental-index:$_selected");
            if (_selected == 1) {
              print(btn1);
            } else if (_selected == 2) {
              print(btn2);
            } else {
              _displayTextInputDialog(context);
              print(btn3);
            }
          }),
    );
  }
}
