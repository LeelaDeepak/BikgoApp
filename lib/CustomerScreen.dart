import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  LocationPermission? _locationPermission;
  @override
  void initState() {
    checkIfLocationPermissionAllowed();
    getuserstatus();
    super.initState();
  }

  checkIfLocationPermissionAllowed() async {
    _locationPermission = await Geolocator.requestPermission();

    if (_locationPermission == LocationPermission.denied) {
      _locationPermission = await Geolocator.requestPermission();
    }
  }

  @override
  getuserstatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    globalUseremail = prefs.getString('email')!;
    print("global username:$globalUseremail");
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
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Welcome,',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.yellow),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'How Can I Help',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.yellow),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'You?',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.yellow),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                getRiderStatus();
              }, // Handle your callback.
              splashColor: Colors.brown.withOpacity(0.5),
              child: Ink(
                height: 250,
                width: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/ride_bike.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                getRenterstatus();

                //Navigator.pushNamed(context, 'ThankYouUserforDetails.id');
              }, // Handle your callback.
              splashColor: Colors.brown.withOpacity(0.5),
              child: Ink(
                height: 250,
                width: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/rent_bike.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        )),
      ),
    );
  }

  Future<void> getRenterstatus() async {
    print("Under Construction");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    globalUseremail = prefs.getString('email')!;
    print("user in app:");
    print(globalUseremail);

    Future<bool> checkIfDocExists(String docId) async {
      try {
        // Get reference to Firestore collection
        var collectionRef =
            FirebaseFirestore.instance.collection('Renter-details');

        var doc = await collectionRef.doc(docId).get();
        return doc.exists;
      } catch (e) {
        rethrow;
      }
    }

    bool docExists = await checkIfDocExists(globalUseremail);
    print("Document exists in Firestore? " + docExists.toString());
    print("globaluseremail:$globalUseremail");

    if (docExists.toString() == "true") {
      DocumentSnapshot variable = await FirebaseFirestore.instance
          .collection('Renter-details')
          .doc(globalUseremail)
          .get();
      Future.delayed(const Duration(milliseconds: 2000));
      print(variable.data().toString());
      print(variable['IsVerified']);
      if (variable['IsVerified'] == "True") {
        print("The Renter is verified");
        Navigator.pushNamed(context, 'ChooseRenttype.id');
      } else {
        print("The Renter is under verification");
        Navigator.pushNamed(context, 'Verification.id');
      }
    } else {
      Navigator.pushNamed(context, 'RenterFlow.id');
    }
  }

  Future<void> getRiderStatus() async {
    print("Under Construction");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    globalUseremail = prefs.getString('email')!;
    print("user in app:");
    print(globalUseremail);
    Future.delayed(const Duration(milliseconds: 2000));

    /// Check If Document Exists
    Future<bool> checkIfDocExists(String docId) async {
      try {
        // Get reference to Firestore collection
        var collectionRef =
            FirebaseFirestore.instance.collection('Rider-details');

        var doc = await collectionRef.doc(docId).get();
        return doc.exists;
      } catch (e) {
        rethrow;
      }
    }

    bool docExists = await checkIfDocExists(globalUseremail);
    print("Document exists in Firestore? " + docExists.toString());
    print("globaluseremail:$globalUseremail");

    if (docExists.toString() == "true") {
      DocumentSnapshot variable = await FirebaseFirestore.instance
          .collection('Rider-details')
          .doc(globalUseremail)
          .get();

      print(variable.data().toString());
      print(variable['IsVerified']);
      if (variable['IsVerified'] == "True") {
        print("The Rider is verified");

        Navigator.pushNamed(context, 'ChooseRidetype.id');
      } else {
        print("The Rider is under verification");
        print("globaluseremail:$globalUseremail");
        Navigator.pushNamed(context, 'Verification.id');
      }
    } else {
      Navigator.pushNamed(context, 'RiderFlow.id');
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();

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
              child: Text("Logout Successfully",
                  style: TextStyle(fontSize: 20, color: Colors.white)))
        ],
      ),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 3),
      shape: const StadiumBorder(),
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    ));
    Future.delayed(const Duration(milliseconds: 2000));
    Navigator.pushNamed(context, 'Home.id');
  }

  @override
  void dispose() {
    getuserstatus();
    super.dispose();
  }
}
