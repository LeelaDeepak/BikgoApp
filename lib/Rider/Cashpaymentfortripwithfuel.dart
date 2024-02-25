import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Cashpaymentwithfuelfortrip extends StatefulWidget {
  const Cashpaymentwithfuelfortrip({Key? key}) : super(key: key);

  @override
  State<Cashpaymentwithfuelfortrip> createState() =>
      _CashpaymentwithfuelfortripState();
}

class _CashpaymentwithfuelfortripState
    extends State<Cashpaymentwithfuelfortrip> {
  TextEditingController cashController = TextEditingController();
  TimeOfDay time = TimeOfDay.now();
  TimeOfDay ftime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Cash-Payment",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.yellow),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                child: Card(
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Generated Trip-Amount :- $rent Rs",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 122,
                child: Card(
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      "Please enter the trip amount as shown above as a symbol of confidence that you have paid the cash to the renter.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: 350,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Trip-Amount',
                      hintText: 'Enter Your Trip Amount',
                      prefixIcon: Icon(
                        Icons.money_sharp,
                        size: 30,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    controller: cashController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 80,
                  width: 350,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.black;
                        }
                        return Colors.black;
                      }),
                    ),
                    icon: const Icon(
                      Icons.done,
                      color: Colors.yellow,
                      size: 30,
                    ),
                    label: const Text(
                      "Paid-Cash",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow),
                    ),
                    onPressed: () {
                      if (cashController.text != "") {
                        if (cashController.text == rent.toString()) {
                          final hours = time.hour.toString().padLeft(2, '0');
                          final minutes =
                              time.minute.toString().padLeft(2, '0');
                          final fhours = ftime.hour.toString().padLeft(2, '0');
                          final fminutes =
                              ftime.minute.toString().padLeft(2, '0');
                          DocumentReference users = FirebaseFirestore.instance
                              .collection('RFR-Transactions')
                              .doc(Renterkaemail);
                          users.set({
                            'Actual-Duration-Of-Time': "$ridehours Hours",
                            'Minimum-Fuel-Flag': "False",
                            'Paid-Amount': "${cashController.text}-Rs",
                            'RFR-ID': RFRID,
                            'Reduced-Amount': "0-Rs",
                            'Rent Amount': "$rent-Rs",
                            'Renter-Acceptance': "True",
                            'Renter-Email-ID': Renterkaemail,
                            'Requested-Duration-Of-Time': "$ridehours Hours",
                            'Ride-End-Date-And-Time':
                                "Date:-$tripdaterider Time:-$rideendtime",
                            'Ride-Start-Date-And-Time':
                                "Date:-$tripdaterider Time:-$ridestarttime",
                            'Rider-Email-ID': globalUseremail,
                            'Rider-Bike-Collected': "True",
                            'Renter-Side-Bike-Taken': "True",
                            'Trip-Status': "Trip-Closed"
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.done,
                                  size: 32,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                    child: Text(
                                        "Thank you for the payment. We hope you enjoyed the trip, and let's meet soon.",
                                        style: TextStyle(
                                          fontSize: 20,
                                        )))
                              ],
                            ),
                            backgroundColor: Colors.green,
                            duration: const Duration(seconds: 3),
                            shape: const StadiumBorder(),
                            margin: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 12),
                            behavior: SnackBarBehavior.floating,
                            elevation: 0,
                          ));
                          Navigator.pushNamed(context, 'Customer.id');
                        } else {
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
                                    child: Text(
                                        'The trip amount and rent amount are not matching.',
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
                                Icons.done,
                                size: 32,
                                color: Colors.white,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                  child: Text(
                                      'Enter the trip amount for confirmation!',
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
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
