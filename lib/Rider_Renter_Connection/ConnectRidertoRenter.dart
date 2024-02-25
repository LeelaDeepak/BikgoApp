import 'package:bigkoapp/Google_Maps/map_key.dart';
import 'package:bigkoapp/Rider_Renter_Connection/Googlewalknavigation.dart';
import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';

class ConnetRidertoRenter extends StatefulWidget {
  const ConnetRidertoRenter({Key? key}) : super(key: key);

  @override
  State<ConnetRidertoRenter> createState() => _ConnetRidertoRenterState();
}

class _ConnetRidertoRenterState extends State<ConnetRidertoRenter> {
  Position? userCurrentPosition;
  @override
  void initState() {
    fetchRFRDocData();
    locateuserpositionfornextpage(context);
    super.initState();
  }

  fetchRFRDocData() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('RFR-Transactions');
    final snapshot =
        await users.doc("RFR${date.day}${date.month}${date.year}0").get();
    final data = snapshot.data() as Map<String, dynamic>;
    rfridofrental = data['RFRID'];
    Sharelocflag = true;
    print("rfridforrental=$rfridofrental");
    print("Sharelocflag=$Sharelocflag");
  }

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

  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    if (myriderchater == "Freoz Shah") {
      myriderchatroomId = "ChatAsFreozRenter";
      phonenumberofrentertocall = "9494570865";
      phonenumberofridertocall = "6281456707";
      sourceLocation = LatLng(renterlatitude, renterlongitude);
      LatLng destinationLocation =
          LatLng(17.420100293738205, 78.65533103787412);
      finaldestination = destinationLocation;
    } else if (myriderchater == "Pradeep Rawat") {
      myriderchatroomId = "ChatAsPradeepRenter";
      LatLng destinationLocation =
          LatLng(17.428871354197867, 78.64754520291244);
      finaldestination = destinationLocation;
      sourceLocation = LatLng(renterlatitude, renterlongitude);
      phonenumberofrentertocall = "6281456707";
      phonenumberofridertocall = "9494570865";
    } else if (myriderchater == "Rajesh Bhat") {
      myriderchatroomId = "ChatAsRajeshRenter";
      phonenumberofrentertocall = "8498966821";
      phonenumberofridertocall = "9494570865";
      LatLng destinationLocation = LatLng(17.42151052925056, 78.65159905874602);
      finaldestination = destinationLocation;
      sourceLocation = LatLng(renterlatitude, renterlongitude);
    } else if (myriderchater == "Vinod Sharma") {
      myriderchatroomId = "ChatAsVinodRenter";
      sourceLocation = LatLng(renterlatitude, renterlongitude);
      phonenumberofrentertocall = "9494570865";
      phonenumberofridertocall = "8498966821";
      LatLng destinationLocation =
          LatLng(17.401103590662142, 78.55919265507468);
      finaldestination = destinationLocation; //position of marker

    }
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleTextStyle: const TextStyle(
              color: Colors.yellow, fontSize: 18, fontWeight: FontWeight.bold),
          backgroundColor: Colors.blue.shade900,
          title: const Text("Getting Renter Location"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                height: 250,
                width: 250,
                child: Lottie.asset('assets/waitingforrenterlocation.json'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                "Please Click on Start Navigation, To Get The Renter Location Directions.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold),
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 70,
                  width: 330,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: (Sharelocflag == true)
                            ? Colors.yellow
                            : Colors.grey),
                    onPressed: () {
                      if (Sharelocflag == true) {
                        print("Pollylines from rider to renter");
                        if (myriderchater == "Freoz Shah") {
                          myriderchatroomId = "ChatAsFreozRenter";
                          print(myriderchater + " as" + " Rider");
                          DocumentReference users = FirebaseFirestore.instance
                              .collection('RFR-Transactions')
                              .doc("RFR${date.day}${date.month}${date.year}0");
                          users.set({
                            'RFRDocLength': doclengthofRFR,
                            'ShareRenterLocationtoRider': true,
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
                          MapUtils.openMap(
                              17.420100293738205, 78.65533103787412);
                        } else if (myriderchater == "Pradeep Rawat") {
                          myriderchatroomId = "ChatAsPradeepRenter";
                          print(myriderchater + " as" + " Rider");
                          DocumentReference users = FirebaseFirestore.instance
                              .collection('RFR-Transactions')
                              .doc("RFR${date.day}${date.month}${date.year}0");
                          users.set({
                            'RFRDocLength': doclengthofRFR,
                            'ShareRenterLocationtoRider': true,
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
                          MapUtils.openMap(
                              17.428871354197867, 78.64754520291244);
                        } else if (myriderchater == "Rajesh Bhat") {
                          myriderchatroomId = "ChatAsRajeshRenter";
                          print(myriderchater + " as" + " Rider");
                          DocumentReference users = FirebaseFirestore.instance
                              .collection('RFR-Transactions')
                              .doc("RFR${date.day}${date.month}${date.year}0");
                          users.set({
                            'RFRDocLength': doclengthofRFR,
                            'ShareRenterLocationtoRider': true,
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
                          MapUtils.openMap(
                              17.42151052925056, 78.65159905874602);
                        } else if (myriderchater == "Vinod Sharma") {
                          myriderchatroomId = "ChatAsVinodRenter";
                          print(myriderchater + " as" + " Rider");
                          DocumentReference users = FirebaseFirestore.instance
                              .collection('RFR-Transactions')
                              .doc("RFR${date.day}${date.month}${date.year}0");
                          users.set({
                            'RFRDocLength': doclengthofRFR,
                            'ShareRenterLocationtoRider': true,
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
                          //position of marker
                          MapUtils.openMap(
                              17.401103590662142, 78.55919265507468);
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.navigation,
                                size: 32,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                  child: Text(
                                      'Please Wait to To Get The Renter Location!',
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
                      }
                    },
                    icon: const Icon(
                      Icons.navigation,
                      size: 40,
                      color: Colors.black,
                    ),
                    label: const Text(
                      "Start-Navigation",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  height: 70,
                  width: 330,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: (Sharelocflag == true)
                            ? Colors.yellow
                            : Colors.yellow),
                    onPressed: () {
                      if (Sharelocflag == true) {
                        print("Rider Reached Renter");
                        DocumentReference users = FirebaseFirestore.instance
                            .collection('RFR-Transactions')
                            .doc("RFR${date.day}${date.month}${date.year}0");
                        users.set({
                          'RFRDocLength': doclengthofRFR,
                          'RFRID': "RFR${date.day}${date.month}${date.year}0",
                          'Trip-Date':
                              "${date.day} / ${date.month} / ${date.year}",
                          'ShareRenterLocationtoRider': true,
                          'Renter-Address': presentAddressofuser,
                          'Rental-Status': "Started",
                          'Renter-Location': sourceLocation.toString(),
                          'Rider-Location': finaldestination.toString(),
                          'Renter-PhoneNumber': phonenumberofrentertocall,
                          'Rider-PhoneNumber': phonenumberofridertocall,
                          'RiderReachedToRenter': true,
                          'RenterVerifiedRiderReached': true,
                          'Rider-Undertaking': false,
                          'Renter-Undertaking': false,
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
                        Navigator.pushNamed(context, 'RiderUndertaking.id');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.navigation,
                                size: 32,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                  child: Text(
                                      'Please Wait to Update the Rider Location!',
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
                      }
                    },
                    icon: const Icon(
                      Icons.location_on_outlined,
                      size: 40,
                      color: Colors.black,
                    ),
                    label: const Text(
                      "Reached-To-Renter",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        )),
      ),
    );
  }
}
