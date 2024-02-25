import 'package:bigkoapp/Google_Maps/map_key.dart';
import 'package:bigkoapp/globaldetails.dart';
import 'package:bigkoapp/progress_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RideTypeByUser extends StatefulWidget {
  const RideTypeByUser({Key? key}) : super(key: key);

  @override
  State<RideTypeByUser> createState() => _RideTypeByUserState();
}

class _RideTypeByUserState extends State<RideTypeByUser> {
  Position? userCurrentPosition;
  locateuserpositionfornextpage() async {
    Position cPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    userCurrentPosition = cPosition;
    //Converting position to longitude and latitude
    LatLng latLngPosition =
        LatLng(userCurrentPosition!.latitude, userCurrentPosition!.longitude);
    print("Longitude = ${userCurrentPosition!.longitude}");
    print("Latitude = ${userCurrentPosition!.latitude}");

    setState(() {
      currentriderloclati = userCurrentPosition!.latitude;
      currentriderloclong = userCurrentPosition!.longitude;
    });

    List<Placemark> placemarks = await placemarkFromCoordinates(
        currentriderloclati, currentriderloclong);
    presentAddressofuser =
        "${placemarks[0].street}, ${placemarks[2].name}, ${placemarks[3].street}, ${placemarks[0].subLocality}, ${placemarks[0].locality}, ${placemarks[0].administrativeArea}-${placemarks[0].postalCode}, ${placemarks[0].country}";
    //Adjusting camera position in case of user motion

    cameraPositionofuser = CameraPosition(target: latLngPosition, zoom: 14);

    print("Address:- $presentAddressofuser");
  }

  @override
  void initState() {
    locateuserpositionfornextpage();

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: IconButton(
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushNamed(context, 'Customer.id');
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Choose Your',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.yellow),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Ride',
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
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: ((context) {
                        return ProgressDialog(
                          message: "Processing Location..",
                        );
                      }));
                  print("Ride-Now");
                  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
                      .collection("Renter-details")
                      .get();

                  for (int i = 0; i < querySnapshot.docs.length; i++) {
                    var a = querySnapshot.docs[i];
                    print(a['Renter-Bike-Photo']);
                    RenterBikeLinks = a['Renter-Bike-Photo'];
                    print("RenterBikeLinks: ${RenterBikeLinks}");
                  }

                  Future.delayed(const Duration(milliseconds: 2000));
                  Navigator.pushNamed(context, 'RiderTabs.id');
                }, // Handle your callback.
                splashColor: Colors.brown.withOpacity(0.5),
                child: Ink(
                  height: 250,
                  width: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Ride-now.png'),
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
                  Future.delayed(const Duration(milliseconds: 2000));
                  print("Slot Book");
                  Navigator.pushNamed(context, 'slotride.id');
                }, // Handle your callback.
                splashColor: Colors.brown.withOpacity(0.5),
                child: Ink(
                  height: 250,
                  width: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Ride-slot.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
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
