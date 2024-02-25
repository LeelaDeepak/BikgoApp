import 'dart:async';

import 'package:bigkoapp/Google_Maps/map_key.dart';
import 'package:bigkoapp/globaldetails.dart';
import 'package:bigkoapp/progress_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class StartConnecttoRiderfromRenter extends StatefulWidget {
  const StartConnecttoRiderfromRenter({Key? key}) : super(key: key);

  @override
  State<StartConnecttoRiderfromRenter> createState() =>
      _StartConnecttoRiderfromRenterState();
}

class _StartConnecttoRiderfromRenterState
    extends State<StartConnecttoRiderfromRenter> {
  GoogleMapController? newGoogleMapController;
  final Completer<GoogleMapController> _controllerGoogleMap =
      Completer<GoogleMapController>();
  Position? userCurrentPosition;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  final Set<Marker> markers = {}; //markers for google map
  var geolocator = Geolocator();
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;
  GlobalKey<ScaffoldState> sKey = GlobalKey<ScaffoldState>();
  DateTime date = DateTime.now();
  @override
  void initState() {
    addCustomIcon();
    locateuserpositionfornextpage(context);
    fetchRFRDocData();
    polylinePoints = PolylinePoints();
    super.initState();
  }

  fetchRFRDocData() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('RFR-Transactions');
    final snapshot =
        await users.doc("RFR${date.day}${date.month}${date.year}0").get();
    final data = snapshot.data() as Map<String, dynamic>;
    rfridofrental = data['RFRID'];
    rentalUndertakingacceptedbyrider = data['Rider-Undertaking'];
    print("rfridforrental=$rfridofrental");
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

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/bike-Online.png")
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (myriderchater == "Freoz Shah") {
      myriderchatroomId = "ChatAsFreozRenter";
      phonenumberofrentertocall = "9494570865";
      phonenumberofrentertocall = "6281456707";
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
      phonenumberofrentertocall = "9494570865";
    } else if (myriderchater == "Rajesh Bhat") {
      myriderchatroomId = "ChatAsRajeshRenter";
      phonenumberofrentertocall = "8498966821";
      phonenumberofrentertocall = "9494570865";
      LatLng destinationLocation = LatLng(17.42151052925056, 78.65159905874602);
      finaldestination = destinationLocation;
      sourceLocation = LatLng(renterlatitude, renterlongitude);
    } else if (myriderchater == "Vinod Sharma") {
      myriderchatroomId = "ChatAsVinodRenter";
      sourceLocation = LatLng(renterlatitude, renterlongitude);
      phonenumberofrentertocall = "9494570865";
      phonenumberofrentertocall = "8498966821";
      LatLng destinationLocation =
          LatLng(17.401103590662142, 78.55919265507468);
      finaldestination = destinationLocation; //position of marker

    }
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        key: sKey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Share Location to Rider",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
          ),
          backgroundColor: Colors.blue.shade900,
          actions: [
            IconButton(
                onPressed: () {
                  print("Calling Rider");

                  _makingPhoneCall();
                },
                icon: const Icon(
                  Icons.call,
                  size: 30,
                  color: Colors.yellow,
                ))
          ],
        ),
        backgroundColor: Colors.blue.shade900,
        body: Stack(children: [
          GoogleMap(
              polylines: _polylines,
              markers: getmarkers(), //markers to show on map
              mapType: MapType.normal,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              initialCameraPosition: cameraPositionofuser1!,
              onMapCreated: ((GoogleMapController controller) {
                _controllerGoogleMap.complete(controller);
                newGoogleMapController = controller;
                BlackThemeGoogleMap();
                setPolylines();
              })),
        ]),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        print("Location Sent To Rider");
                        print(myriderchater);

                        DocumentReference users = FirebaseFirestore.instance
                            .collection('RFR-Transactions')
                            .doc(
                                "RFR${date.day}${date.month}${date.year}$doclengthofRFR");
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
                                      'Your Location Has Been Shared To Rider!',
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
                      },

                      //Write location to firestore

                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow),
                      icon: const Icon(
                        Icons.navigation_outlined,
                        color: Colors.black,
                      ),
                      label: const Text(
                        "Share Location",
                        style: TextStyle(color: Colors.black),
                      )),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton.icon(
                      onPressed: () {
                        print("Rider Reached");
                        print(myriderchater);

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

                        //Write location to firestore
                        Navigator.pushNamed(
                            context, 'RenterAcceptUndertaking.id');
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow),
                      icon: const Icon(
                        Icons.thumb_up_alt_outlined,
                        color: Colors.black,
                      ),
                      label: const Text(
                        "Rider Reached",
                        style: TextStyle(color: Colors.black),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BlackThemeGoogleMap() {
//for black theme google map
    newGoogleMapController!.setMapStyle('''
                    [
                      {
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#242f3e"
                          }
                        ]
                      },
                      {
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#746855"
                          }
                        ]
                      },
                      {
                        "elementType": "labels.text.stroke",
                        "stylers": [
                          {
                            "color": "#242f3e"
                          }
                        ]
                      },
                      {
                        "featureType": "administrative.locality",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#d59563"
                          }
                        ]
                      },
                      {
                        "featureType": "poi",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#d59563"
                          }
                        ]
                      },
                      {
                        "featureType": "poi.park",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#263c3f"
                          }
                        ]
                      },
                      {
                        "featureType": "poi.park",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#6b9a76"
                          }
                        ]
                      },
                      {
                        "featureType": "road",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#38414e"
                          }
                        ]
                      },
                      {
                        "featureType": "road",
                        "elementType": "geometry.stroke",
                        "stylers": [
                          {
                            "color": "#212a37"
                          }
                        ]
                      },
                      {
                        "featureType": "road",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#9ca5b3"
                          }
                        ]
                      },
                      {
                        "featureType": "road.highway",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#746855"
                          }
                        ]
                      },
                      {
                        "featureType": "road.highway",
                        "elementType": "geometry.stroke",
                        "stylers": [
                          {
                            "color": "#1f2835"
                          }
                        ]
                      },
                      {
                        "featureType": "road.highway",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#f3d19c"
                          }
                        ]
                      },
                      {
                        "featureType": "transit",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#2f3948"
                          }
                        ]
                      },
                      {
                        "featureType": "transit.station",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#d59563"
                          }
                        ]
                      },
                      {
                        "featureType": "water",
                        "elementType": "geometry",
                        "stylers": [
                          {
                            "color": "#17263c"
                          }
                        ]
                      },
                      {
                        "featureType": "water",
                        "elementType": "labels.text.fill",
                        "stylers": [
                          {
                            "color": "#515c6d"
                          }
                        ]
                      },
                      {
                        "featureType": "water",
                        "elementType": "labels.text.stroke",
                        "stylers": [
                          {
                            "color": "#17263c"
                          }
                        ]
                      }
                    ]
                ''');
  }

  _makingPhoneCall() async {
    var url = Uri.parse("tel:9494570865");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void setPolylines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        mapKey,
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(finaldestination.latitude, finaldestination.longitude));
    print("result-status=${result.status}");
    if (result.status == 'OK') {
      print(result.toString());
      print("Result");
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }

      setState(() {
        _polylines.add(Polyline(
            polylineId: const PolylineId('polyLine'),
            width: 5,
            color: Colors.yellow,
            points: polylineCoordinates));
      });
    }
  }

  Set<Marker> getmarkers() {
    setState(() {
      if (myriderchater == "Freoz Shah") {
        myriderchatroomId = "ChatAsFreozRenter"; //marker4
        LatLng destinationLocation =
            LatLng(17.420100293738205, 78.65533103787412);

        finaldestination = destinationLocation;
        markers.add(Marker(
          onTap: () {
            print("MyMarker4");
            //Navigator.pushNamed(context, 'MarkerFourScreen.id');
          },
          //add third marker
          markerId: MarkerId("MyMarker4"),
          position: LatLng(
              17.420100293738205, 78.65533103787412), //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: myriderchater,
          ),
          icon: markerIcon, //Icon for Marker
        ));
      } else if (myriderchater == "Pradeep Rawat") {
        myriderchatroomId = "ChatAsPradeepRenter";
        LatLng destinationLocation =
            LatLng(17.428871354197867, 78.64754520291244);
        finaldestination = destinationLocation;
        markers.add(Marker(
          onTap: () {
            print("MyMarker5");
            //Navigator.pushNamed(context, 'MarkerFiveScreen.id');
          },
          //add third marker
          markerId: MarkerId("MyMarker5"),
          position: LatLng(
              17.428871354197867, 78.64754520291244), //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: myriderchater,
          ),
          icon: markerIcon, //Icon for Marker
        ));
      } else if (myriderchater == "Rajesh Bhat") {
        myriderchatroomId = "ChatAsRajeshRenter";
        LatLng destinationLocation =
            LatLng(17.42151052925056, 78.65159905874602);
        finaldestination = destinationLocation;
        markers.add(Marker(
          onTap: () {
            print("MyMarker6");
            // Navigator.pushNamed(context, 'MarkerSixScreen.id');
          },
          //add third marker
          markerId: MarkerId("MyMarker6"),
          position:
              LatLng(17.42151052925056, 78.65159905874602), //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: myriderchater,
          ),
          icon: markerIcon, //Icon for Marker
        ));
      } else if (myriderchater == "Vinod Sharma") {
        myriderchatroomId = "ChatAsVinodRenter";
        LatLng destinationLocation =
            LatLng(17.401103590662142, 78.55919265507468); //marker3
        finaldestination = destinationLocation; //position of marker

        markers.add(Marker(
          onTap: () {
            print("MyMarker3");
            //Navigator.pushNamed(context, 'MarkerThreeScreen.id');
          },
          //add third marker
          markerId: MarkerId("MyMarker3"),
          position: LatLng(
              17.401103590662142, 78.55919265507468), //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: myriderchater,
          ),
          icon: markerIcon, //Icon for Marker
        ));
      }
    });

    return markers;
  }
}
