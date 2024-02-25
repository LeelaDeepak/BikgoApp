import 'dart:async';
import 'package:bigkoapp/Google_Maps/map_key.dart';
import 'package:bigkoapp/Push-Notification/push_notification_system.dart';
import 'package:bigkoapp/globaldetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class ShowMapsOfBikestoRider extends StatefulWidget {
  const ShowMapsOfBikestoRider({Key? key}) : super(key: key);

  @override
  State<ShowMapsOfBikestoRider> createState() => _ShowMapsOfBikestoRiderState();
}

class _ShowMapsOfBikestoRiderState extends State<ShowMapsOfBikestoRider> {
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

  @override
  void initState() {
    addCustomIcon();
    polylinePoints = PolylinePoints();
    super.initState();
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
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        key: sKey,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  print(presentAddressofuser);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.yellow,
                          title: const Text(
                            'My Location',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Colors.black)),
                                    child:
                                        Image.asset("assets/current_loc.png"),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  presentAddressofuser,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 300,
                                height: 50,
                                child: TextButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                              side: const BorderSide(
                                                  width: 2,
                                                  color: Colors.black)))),
                                  child: const Text(
                                    'Okay',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                },
                icon: const Icon(
                  Icons.location_on,
                  size: 30,
                )),
          ],
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, 'ChooseRidetype.id');
              }),
          automaticallyImplyLeading: false,
          title: const Text(
            "Available Bikes",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue.shade900,
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
              initialCameraPosition: cameraPositionofuser!,
              onMapCreated: ((GoogleMapController controller) {
                _controllerGoogleMap.complete(controller);
                newGoogleMapController = controller;
                BlackThemeGoogleMap();
              }))
        ]),
      ),
    );
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    setState(() {
      markers.add(Marker(
        onTap: () {
          print("MyMarker1");
          Navigator.pushNamed(context, 'MarkerOneScreen.id');
        },
        //add first marker
        markerId: MarkerId("MyMarker1"),

        position: LatLng(17.427620, 78.684190), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'KTM',
          // snippet: 'My Custom Subtitle',
        ),
        icon: markerIcon, //Icon for Marker
      ));

      markers.add(Marker(
        onTap: () {
          print("MyMarker2");
          Navigator.pushNamed(context, 'MarkerTwoScreen.id');
        },
        //add second marker
        markerId: MarkerId("MyMarker2"),
        position: LatLng(17.407970, 78.596360), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Bajaj',
        ),
        icon: markerIcon, //Icon for Marker
      ));

      markers.add(Marker(
        onTap: () {
          print("MyMarker3");
          Navigator.pushNamed(context, 'MarkerThreeScreen.id');
        },
        //add third marker
        markerId: MarkerId("MyMarker3"),
        position:
            LatLng(17.401103590662142, 78.55919265507468), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Pulsar',
        ),
        icon: markerIcon, //Icon for Marker
      ));

      markers.add(Marker(
        onTap: () {
          print("MyMarker4");
          Navigator.pushNamed(context, 'MarkerFourScreen.id');
        },
        //add third marker
        markerId: MarkerId("MyMarker4"),
        position:
            LatLng(17.420100293738205, 78.65533103787412), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Royal Enfield',
        ),
        icon: markerIcon, //Icon for Marker
      ));

      markers.add(Marker(
        onTap: () {
          print("MyMarker5");
          Navigator.pushNamed(context, 'MarkerFiveScreen.id');
        },
        //add third marker
        markerId: MarkerId("MyMarker5"),
        position:
            LatLng(17.428871354197867, 78.64754520291244), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Honda SP',
        ),
        icon: markerIcon, //Icon for Marker
      ));

      markers.add(Marker(
        onTap: () {
          print("MyMarker6");
          Navigator.pushNamed(context, 'MarkerSixScreen.id');
        },
        //add third marker
        markerId: MarkerId("MyMarker6"),
        position:
            LatLng(17.42151052925056, 78.65159905874602), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: 'Hero XPulse',
        ),
        icon: markerIcon, //Icon for Marker
      ));

      //add more markers here
    });

    return markers;
  }
}
