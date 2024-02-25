import 'package:bigkoapp/Google_Maps/map_key.dart';
import 'package:bigkoapp/globaldetails.dart';
import 'package:bigkoapp/progress_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChooseRentType extends StatefulWidget {
  const ChooseRentType({Key? key}) : super(key: key);

  @override
  State<ChooseRentType> createState() => _ChooseRentTypeState();
}

class _ChooseRentTypeState extends State<ChooseRentType> {
  Position? userCurrentPosition;
  locateuserpositionfornextpage(BuildContext context) async {
    Position cPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    userCurrentPosition = cPosition;
    //Converting position to longitude and latitude
    LatLng latLngPosition =
        LatLng(userCurrentPosition!.latitude, userCurrentPosition!.longitude);
    print("Longitude = ${userCurrentPosition!.longitude}");
    print("Latitude = ${userCurrentPosition!.latitude}");

    setState(() {
      renterlongitude = userCurrentPosition!.longitude;
      renterlatitude = userCurrentPosition!.latitude;
    });

    List<Placemark> placemarks =
        await placemarkFromCoordinates(renterlatitude, renterlongitude);
    presentAddressofuser =
        "${placemarks[0].street}, ${placemarks[2].name}, ${placemarks[3].street}, ${placemarks[0].subLocality}, ${placemarks[0].locality}, ${placemarks[0].administrativeArea}-${placemarks[0].postalCode}, ${placemarks[0].country}";
    //Adjusting camera position in case of user motion

    cameraPositionofuser1 = CameraPosition(target: latLngPosition, zoom: 14);

    print("Address:- $presentAddressofuser");
  }

  @override
  void initState() {
    locateuserpositionfornextpage(context);

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
                  'Rent',
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
                  print("Rent-Now");
                  DocumentSnapshot variable = await FirebaseFirestore.instance
                      .collection('Renter-details')
                      .doc(globalUseremail)
                      .get();

                  print(variable['Renter-BikeModel']);
                  print(variable['Renter-Name']);
                  print(variable['Renter-Address']);
                  print(variable['Renter-Bike-Photo']);
                  Renterkabikemodel = variable['Renter-BikeModel'];
                  RenterBikekaphoto = variable['Renter-Bike-Photo'];
                  Renterkanaam = variable['Renter-Name'];
                  Renterkaaddress = variable['Renter-Address'];
                  Renterkaselfie = variable['Renter-Selfie'];
                  Renterkaphone = variable['Renter-PhoneNumber'];
                  Renterkaemail = variable['Email'];
                  Renterkaage = variable['Renter-Age'];
                  RenterkabikeNumber = variable['Renter-BikeNumber'];
                  Renterkaphone = variable['Renter-PhoneNumber'];
                  urenter2 = variable['Renter-Bike-Insurance'];
                  urenter1 = variable['Renter-Bike-RC'];
                  urenter3 = variable['Renter-Pollution-Certificate'];
                  IsRiderVerifiedBool = variable['IsVerified'];
                  print(Renterkaage);
                  print(RenterkabikeNumber);
                  print(urenter1);
                  print(urenter2);
                  print(urenter3);
                  print(RenterBikekaphoto);
                  print(Renterkaselfie);
                  Future.delayed(const Duration(milliseconds: 2000));
                  Navigator.pushNamed(context, 'RenterTabs.id');
                }, // Handle your callback.
                splashColor: Colors.brown.withOpacity(0.5),
                child: Ink(
                  height: 250,
                  width: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Rent-now.png'),
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
                  print("Slot Book");
                  Future.delayed(const Duration(milliseconds: 2000));
                  Navigator.pushNamed(context, 'slotrent.id');
                }, // Handle your callback.
                splashColor: Colors.brown.withOpacity(0.5),
                child: Ink(
                  height: 250,
                  width: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Rent-slot.png'),
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
