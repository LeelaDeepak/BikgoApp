import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../globaldetails.dart';

class Starttrip extends StatefulWidget {
  const Starttrip({Key? key}) : super(key: key);

  @override
  State<Starttrip> createState() => _StarttripState();
}

class _StarttripState extends State<Starttrip> {
  TimeOfDay time = TimeOfDay.now();
  TimeOfDay ftime = TimeOfDay.now();
  int btnvalue1 = 0;
  int btnvalue2 = 0;
  final hoursController = TextEditingController();

  void checkminimumpetrol() async {
    DocumentSnapshot s = await FirebaseFirestore.instance
        .collection('RFR-Transactions')
        .doc(Renterkaemail)
        .get();
    print("Minimum-Fuel: " +
        ((s.data() as dynamic)['Minimum-Fuel-Flag']).toString());
    minimum = ((s.data() as dynamic)['Minimum-Fuel-Flag']).toString();
    if (minimum != "True") {
      // rentafterfuel = rent - 50;
      print("Rent with minimum Fuel: $rentafterfuel");
      finaltripamount = rent - 50;
      print(finaltripamount);
      rentamount = finaltripamount.toString();
      var currentdate = DateTime.now();
      final hours = time.hour.toString().padLeft(2, '0');
      final minutes = time.minute.toString().padLeft(2, '0');
      final fhours = ftime.hour.toString().padLeft(2, '0');
      final fminutes = ftime.minute.toString().padLeft(2, '0');
      DocumentReference users = FirebaseFirestore.instance
          .collection('RFR-Transactions')
          .doc(Renterkaemail);
      users.set({
        'Actual-Duration-Of-Time': "",
        'Minimum-Fuel-Flag': "False",
        'Paid-Amount': "",
        'RFR-ID': RFRID,
        'Reduced-Amount': "$reducedamount-Rs",
        'Rent Amount': "$rentamount-Rs",
        'Renter-Acceptance': "True",
        'Renter-Email-ID': Renterkaemail,
        'Requested-Duration-Of-Time': "$ridehours Hours",
        'Ride-End-Date-And-Time': "Date:-$tripdaterider Time:-$rideendtime",
        'Ride-Start-Date-And-Time': "Date:-$tripdaterider Time:-$ridestarttime",
        'Rider-Email-ID': globalUseremail,
        'Rider-Bike-Collected': "True",
        'Renter-Side-Bike-Taken': "True",
        'Trip-Status': "Start-Trip"
      });
      Navigator.pushNamed(context, 'whiletripwithbike.id');
    } else {
      print("Rent will be same");
      print("Rent Amount=$rent");
      int nodiscount = 0;
      print("no-discount:$nodiscount");
      DocumentReference users = FirebaseFirestore.instance
          .collection('RFR-Transactions')
          .doc(Renterkaemail);
      users.set({
        'Actual-Duration-Of-Time': "",
        'Minimum-Fuel-Flag': "True",
        'Paid-Amount': "",
        'RFR-ID': RFRID,
        'Reduced-Amount': "$nodiscount-Rs",
        'Rent Amount': "$rent-Rs",
        'Renter-Acceptance': "True",
        'Renter-Email-ID': Renterkaemail,
        'Requested-Duration-Of-Time': "$ridehours Hours",
        'Ride-End-Date-And-Time': "Date:-$tripdaterider Time:-$rideendtime",
        'Ride-Start-Date-And-Time': "Date:-$tripdaterider Time:-$ridestarttime",
        'Rider-Email-ID': globalUseremail,
        'Rider-Bike-Collected': "True",
        'Renter-Side-Bike-Taken': "True",
        'Trip-Status': "Start-Trip"
      });
      Navigator.pushNamed(context, 'whiletripwithfuel.id');
    }
  }

  @override
  Widget build(BuildContext context) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    final fhours = ftime.hour.toString().padLeft(2, '0');
    final fminutes = ftime.minute.toString().padLeft(2, '0');

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
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Set-Trip!",
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
                  "Choose The Trip ",
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
                  "Start-Time:",
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
              SizedBox(
                height: 80,
                width: 300,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    btnvalue1 = 1;
                    TimeOfDay? newTime = await showTimePicker(
                        context: context, initialTime: time);
                    print(newTime.toString());
                    print("btnvalue:$btnvalue1");
                    if (newTime == null) return;

                    setState(() {
                      time = newTime;
                    });
                    print("Start-time: ($hours:$minutes)");
                  },
                  icon: const Icon(
                    Icons.alarm,
                    size: 40,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Start-Time',
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Start-time: ($hours:$minutes)',
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Choose The Trip ",
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
                  "End-Time:",
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
              SizedBox(
                height: 80,
                width: 300,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    btnvalue2 = 2;
                    TimeOfDay? newTime = await showTimePicker(
                        context: context, initialTime: ftime);
                    print(newTime.toString());

                    if (newTime == null) return;

                    setState(() {
                      ftime = newTime;
                    });
                    print("End-time: ($fhours:$fminutes)");
                    print("btnvalue:$btnvalue2");
                  },
                  icon: const Icon(
                    Icons.alarm,
                    size: 40,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'End-Time',
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'End-time: ($fhours:$fminutes)',
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
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
                      labelText: 'Trip-Hours',
                      hintText: 'Enter your Trip Hours',
                      prefixIcon: Icon(
                        Icons.lock_clock,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    controller: hoursController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'The Trip-Hours must be atleast of 1 Hour',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 85,
                  width: 300,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black)),
                    icon: const Icon(
                      Icons.directions_bike_rounded,
                      size: 40,
                      color: Colors.yellow,
                    ),
                    label: const Text(
                      "Start-Trip!",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow),
                    ),
                    onPressed: () {
                      if (btnvalue1 == 1 &&
                          btnvalue2 == 2 &&
                          hoursController.text != "") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.key,
                                size: 32,
                                color: Colors.white,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                  child: Text('The Ride is Started!',
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
                        ridestarttime = "$hours:$minutes";
                        rideendtime = "$fhours:$fminutes";
                        int ridecostperhour = 70;
                        var ridetime = hoursController.text;
                        ridehours = int.parse(ridetime);
                        print(
                            "Total-trip cost: ${ridecostperhour * ridehours}");
                        rent = ridecostperhour * ridehours;
                        actualrentamount = rent.toString();
                        var currentdate = DateTime.now();
                        print(currentdate.year);
                        print(currentdate.month);
                        print(currentdate.day);
                        print(
                            "Trip-Date:${currentdate.day}/${currentdate.month}/${currentdate.year}");

                        tripdaterider =
                            "${currentdate.day}/${currentdate.month}/${currentdate.year}";
                        print("Write data to Firestore");
                        RFRID =
                            "RFR${currentdate.day}${currentdate.month}${currentdate.year}id1";
                        checkminimumpetrol();
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
                                      'Choose Start Time and End Time with Trip Hours to proceed further!',
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
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
