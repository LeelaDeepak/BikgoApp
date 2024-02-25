import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Takebiketoride extends StatefulWidget {
  const Takebiketoride({Key? key}) : super(key: key);

  @override
  State<Takebiketoride> createState() => _TakebiketorideState();
}

class _TakebiketorideState extends State<Takebiketoride> {
  bool value = false;

  void checkBikestatus() async {
    DocumentSnapshot s = await FirebaseFirestore.instance
        .collection('RFR-Transactions')
        .doc(globalUseremail)
        .get();

    ridertakebike = ((s.data() as dynamic)['Rider-Bike-Collected']).toString();
    confirmridertakebike =
        ((s.data() as dynamic)['Renter-Side-Bike-Taken']).toString();
    print("rider-take-bike:$ridertakebike");
    print("Confirm-Bike-Taken-From-Renter:$confirmridertakebike");
    if (ridertakebike == confirmridertakebike) {
      print("Bike with rider from renter hence proved");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.done,
              size: 32,
            ),
            SizedBox(width: 16),
            Expanded(
                child: Text('Gave bike to ride!',
                    style: TextStyle(
                      fontSize: 20,
                    )))
          ],
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
        shape: const StadiumBorder(),
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.error,
              size: 32,
            ),
            SizedBox(width: 16),
            Expanded(
                child: Text('Waiting for Confirmation about the  bike!',
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
  }

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Lottie.asset('assets/start-ride.json'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Confirm Taking",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.yellow),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Bike From Renter!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.yellow),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Bike Given",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "To Rider!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              buildSwitch(),
              SizedBox(
                  height: 85,
                  width: 300,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    icon: const Icon(
                      Icons.thumb_up,
                      size: 40,
                      color: Colors.yellow,
                    ),
                    label: const Text(
                      "Given-Bike!",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow),
                    ),
                    onPressed: () {
                      if (value == true) {
                        print("Renter Side Bike-Taken switch");
                        checkBikestatus();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.done,
                                size: 32,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                  child:
                                      Text('Confirmed that bike is with Rider!',
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
                        Navigator.pushNamed(context, 'starttrip.id');
                      } else {
                        print("Renter Side Bike-Not-Taken switch");
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.error,
                                size: 32,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                  child: Text(
                                      'Not confirmed that Bike is with Rider!',
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
                  )),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSwitch() => Transform.scale(
        scale: 2,
        child: SizedBox(
          width: 75,
          child: Switch(
              trackColor: MaterialStateProperty.all(Colors.black),
              activeColor: Colors.green,
              inactiveThumbColor: Colors.red,
              activeThumbImage: const AssetImage('assets/acceptIcon.png'),
              inactiveThumbImage: const AssetImage('assets/rejecticon.png'),
              value: value,
              onChanged: (value) {
                setState(() {
                  this.value = value;
                  print("value=$value");
                });
              }),
        ),
      );
}
