import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Confirmrider extends StatefulWidget {
  const Confirmrider({Key? key}) : super(key: key);

  @override
  State<Confirmrider> createState() => _ConfirmriderState();
}

class _ConfirmriderState extends State<Confirmrider> {
  String ridertakebike = "";
  bool value = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkRider();
  }

  void checkRider() async {
    DocumentSnapshot s = await FirebaseFirestore.instance
        .collection('RFR-Transactions')
        .doc(globalUseremail)
        .get();

    ridertakebike = ((s.data() as dynamic)['Rider-Bike-Collected']).toString();
    print("rider-take-bike:$ridertakebike");
  }

  void checkRiderAboutBike() async {
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
      print("Start the trip!");
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
                child: Text('Renter Gave you bike to ride!',
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
                child: Text('Wait for Renter to Give you the bike!',
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
                height: 350,
                width: 350,
                child: Lottie.asset('assets/Confirm-message.json'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                "Your Bike",
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
                "Is Confirmed,",
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
                "Go to Renter",
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
                "And Collect",
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
                "The Bike!",
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
            Container(
              alignment: Alignment.center,
              child: const Text(
                "Bike Taken",
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
                "From Renter!",
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
              height: 80,
              width: 280,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.black;
                      }
                      return Colors.black;
                    }),
                  ),
                  onPressed: () {
                    print("Collect-Bike");
                    DocumentReference users = FirebaseFirestore.instance
                        .collection('RFR-Transactions')
                        .doc(globalUseremail);
                    users.set({
                      'Actual-Duration-Of-Time': "",
                      'Minimum-Fuel-Flag': "True",
                      'Paid-Amount': "",
                      'RFR-ID': "",
                      'Reduced-Amount': "",
                      'Rent Amount': "",
                      'Renter-Acceptance': "True",
                      'Renter-Email-ID': Renterkaemail,
                      'Requested-Duration-Of-Time': "",
                      'Ride-End-Date-And-Time': "",
                      'Ride-Start-Date-And-Time': "",
                      'Rider-Email-ID': globalUseremail,
                      'Rider-Bike-Collected': "True",
                      'Renter-Side-Bike-Taken': "True",
                      'Trip-Status': ""
                    });
                    if (value == true) {
                      print("Confirmed taken bike from renter");
                      checkRiderAboutBike();
                      Navigator.pushNamed(context, 'takebiketoride.id');
                    } else {
                      print("Not confirmed taken bike from renter");
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
                                    'Turn on the Switch as confirmation to continue further!',
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
                  child: const Text(
                    "Collect-Bike",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow),
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        )),
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
