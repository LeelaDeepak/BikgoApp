import 'dart:async';

import 'package:bigkoapp/Google_Maps/map_key.dart';
import 'package:bigkoapp/Rider_Renter_Connection/Googlewalknavigation.dart';
import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackTheRiderWhileTrip extends StatefulWidget {
  const TrackTheRiderWhileTrip({Key? key}) : super(key: key);

  @override
  State<TrackTheRiderWhileTrip> createState() => _TrackTheRiderWhileTripState();
}

class _TrackTheRiderWhileTripState extends State<TrackTheRiderWhileTrip> {
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
    fetchRFRDocData();
    polylinePoints = PolylinePoints();
    super.initState();
  }

  fetchRFRDocData() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection('RFR-Transactions');
    final snapshot = await users
        .doc("RFR${date.day}${date.month}${date.year}$doclengthofRFR")
        .get();
    final data = snapshot.data() as Map<String, dynamic>;
    rfridofrental = data['RFRID'];
    rentalUndertakingacceptedbyrider = data['Rider-Undertaking'];
    print("rfridforrental=$rfridofrental");
  }

  LatLng sourceLocation = LatLng(renterlatitude, renterlongitude);

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
      LatLng destinationLocation = LatLng(17.42631119139179, 78.64724164370263);
      finaldestination = destinationLocation;
    } else if (myriderchater == "Pradeep Rawat") {
      myriderchatroomId = "ChatAsPradeepRenter";
      LatLng destinationLocation =
          LatLng(17.423409961030007, 78.64228683612511);
      finaldestination = destinationLocation;
    } else if (myriderchater == "Rajesh Bhat") {
      myriderchatroomId = "ChatAsRajeshRenter";
      LatLng destinationLocation = LatLng(17.42685538428892, 78.64878082249945);
      finaldestination = destinationLocation;
    } else if (myriderchater == "Vinod Sharma") {
      myriderchatroomId = "ChatAsVinodRenter";
      LatLng destinationLocation =
          LatLng(17.425031344794196, 78.64504829764057);
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
              "Tracking Bike Location",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
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
                          print("Trip Ended");
                          print(myriderchater);

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
                            'Check-Bike-To-Rent-By-Rider': true,
                            'Bike-Receieved-To-Start-Trip': true,
                            'End-Trip-By-Rider': false,
                            'End-Trip-By-Renter': false,
                            'Start-Trip-By-Rider': true,
                            'Start-Trip-By-Renter': true,
                            'Vehicle-Name': gaadiname,
                            'Renter-Name': globalUseremail,
                            'Rider-Name': myriderchater,
                            'Vehicle-No': gaadinumber,
                            'Rental-Amount': rentalamount,
                            'Rental-Ratings': "",
                            'Check-Bike-After-Rental-Renter': false,
                            'Rider-Paid-Amount': false,
                            'Payment-Done': false,
                          });
                          Navigator.pushNamed(
                              context, 'BillGeneratedByRenter.id');

                          //Write location to firestore
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow),
                        icon: const Icon(
                          Icons.stop_circle,
                          color: Colors.black,
                          size: 40,
                        ),
                        label: const Text(
                          "Trip Ended",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          print("Location Sent To Rider");
                          print(myriderchater);
                          if (myriderchater == "Freoz Shah") {
                            myriderchatroomId = "ChatAsFreozRenter";

                            MapUtils.openMap(
                                17.42631119139179, 78.64724164370263);
                          } else if (myriderchater == "Pradeep Rawat") {
                            myriderchatroomId = "ChatAsPradeepRenter";

                            MapUtils.openMap(
                                17.423409961030007, 78.64228683612511);
                          } else if (myriderchater == "Rajesh Bhat") {
                            myriderchatroomId = "ChatAsRajeshRenter";

                            MapUtils.openMap(
                                17.42685538428892, 78.64878082249945);
                          } else if (myriderchater == "Vinod Sharma") {
                            myriderchatroomId = "ChatAsVinodRenter";

                            //position of marker
                            MapUtils.openMap(
                                17.425031344794196, 78.64504829764057);
                          }
                          //Write location to firestore
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow),
                        icon: const Icon(
                          Icons.navigation_outlined,
                          color: Colors.black,
                          size: 40,
                        ),
                        label: const Text(
                          "Navigate Rider",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ));
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
            LatLng(17.42631119139179, 78.64724164370263);

        finaldestination = destinationLocation;
        markers.add(Marker(
          onTap: () {
            print("MyMarker4");
            //Navigator.pushNamed(context, 'MarkerFourScreen.id');
          },
          //add third marker
          markerId: MarkerId("MyMarker4"),
          position:
              LatLng(17.42631119139179, 78.64724164370263), //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: globalUseremail,
          ),
          icon: markerIcon, //Icon for Marker
        ));
      } else if (myriderchater == "Pradeep Rawat") {
        myriderchatroomId = "ChatAsPradeepRenter";
        LatLng destinationLocation =
            LatLng(17.423409961030007, 78.64228683612511);
        finaldestination = destinationLocation;
        markers.add(Marker(
          onTap: () {
            print("MyMarker5");
            //Navigator.pushNamed(context, 'MarkerFiveScreen.id');
          },
          //add third marker
          markerId: MarkerId("MyMarker5"),
          position: LatLng(
              17.423409961030007, 78.64228683612511), //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: globalUseremail,
          ),
          icon: markerIcon, //Icon for Marker
        ));
      } else if (myriderchater == "Rajesh Bhat") {
        myriderchatroomId = "ChatAsRajeshRenter";
        LatLng destinationLocation =
            LatLng(17.42685538428892, 78.64878082249945);
        finaldestination = destinationLocation;
        markers.add(Marker(
          onTap: () {
            print("MyMarker6");
            // Navigator.pushNamed(context, 'MarkerSixScreen.id');
          },
          //add third marker
          markerId: MarkerId("MyMarker6"),
          position:
              LatLng(17.42685538428892, 78.64878082249945), //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: globalUseremail,
          ),
          icon: markerIcon, //Icon for Marker
        ));
      } else if (myriderchater == "Vinod Sharma") {
        myriderchatroomId = "ChatAsVinodRenter";
        LatLng destinationLocation =
            LatLng(17.425031344794196, 78.64504829764057); //marker3
        finaldestination = destinationLocation; //position of marker

        markers.add(Marker(
          onTap: () {
            print("MyMarker3");
            //Navigator.pushNamed(context, 'MarkerThreeScreen.id');
          },
          //add third marker
          markerId: MarkerId("MyMarker3"),
          position: LatLng(
              17.425031344794196, 78.64504829764057), //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: globalUseremail,
          ),
          icon: markerIcon, //Icon for Marker
        ));
      }
    });

    return markers;
  }
}
