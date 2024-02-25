import 'package:bigkoapp/Google_Maps/map_key.dart';
import 'package:bigkoapp/globaldetails.dart';
import 'package:bigkoapp/progress_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class RenterChatRoom extends StatelessWidget {
  final TextEditingController message = TextEditingController();

  RenterChatRoom({Key? key}) : super(key: key);
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var u;
  Position? userCurrentPosition;
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    if (myriderchater == "Freoz Shah") {
      myriderchatroomId = "ChatAsFreozRenter";
    } else if (myriderchater == "Pradeep Rawat") {
      myriderchatroomId = "ChatAsPradeepRenter";
    } else if (myriderchater == "Rajesh Bhat") {
      myriderchatroomId = "ChatAsRajeshRenter";
    } else if (myriderchater == "Rohit Kumar") {
      myriderchatroomId = "ChatAsRohitRenter";
    } else if (myriderchater == "Sandeep Reddy") {
      myriderchatroomId = "ChatAsSandeepRenter";
    } else if (myriderchater == "Vinod Sharma") {
      myriderchatroomId = "ChatAsVinodRenter";
    }
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Text(myriderchater),
              const Text(
                "Online",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    backgroundColor: Colors.green),
              )
            ],
          ),
          titleTextStyle: const TextStyle(
              color: Colors.yellow, fontSize: 18, fontWeight: FontWeight.bold),
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, 'RenterTabs.id');
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.25,
                width: MediaQuery.of(context).size.width,
                child: StreamBuilder<QuerySnapshot>(
                  builder: ((BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      print(myriderchater + " " + "Chat-Room");
                      print(snapshot.data?.docs.length);

                      u = snapshot.data?.docs.length;
                      if (u == 0) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: SizedBox(
                                height: 250,
                                width: 250,
                                child: Lottie.asset('assets/First_chat.json'),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                "It seems like this is your first time Chatting with this Rider, Get Started to know more",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 70,
                              width: 300,
                              child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black),
                                  onPressed: () {
                                    print("Hi Renter");
                                    onSendWelcomeMessage();

                                    DocumentReference users = FirebaseFirestore
                                        .instance
                                        .collection('RFR-Transactions')
                                        .doc(
                                            "RFR${date.day}${date.month}${date.year}0");
                                    users.set({
                                      'RFRID':
                                          "RFR${date.day}${date.month}${date.year}0",
                                      'Trip-Date':
                                          "${date.day} / ${date.month} / ${date.year}",
                                      'Renter-Address': presentAddressofuser,
                                      'Rental-Status': "Going To Start",
                                      'Renter-Location': "",
                                      'ShareRenterLocationtoRider': true,
                                      'Rider-Location': "",
                                      'Renter-PhoneNumber': "",
                                      'Rider-PhoneNumber': "",
                                      'RiderReachedToRenter': false,
                                      'RenterVerifiedRiderReached': false,
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
                                      'Renter-Name': "",
                                      'Rider-Name': "",
                                      'Vehicle-No': "",
                                      'Rental-Amount': "",
                                      'Rental-Ratings': "",
                                      'Check-Bike-After-Rental-Renter': false,
                                      'Rider-Paid-Amount': false,
                                      'Payment-Done': false,
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.chat,
                                    color: Colors.yellow,
                                  ),
                                  label: const Text(
                                    "Get-Started",
                                    style: TextStyle(
                                        color: Colors.yellow,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  reverse: true,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: ((context, index) {
                                    Map<String, dynamic>? map =
                                        snapshot.data!.docs[index].data()
                                            as Map<String, dynamic>?;
                                    return messages(context, map!);
                                  })),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              height: MediaQuery.of(context).size.height / 7,
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height / 11,
                                width: MediaQuery.of(context).size.width / 1.1,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              12,
                                      width: MediaQuery.of(context).size.width /
                                          1.2,
                                      child: TextField(
                                        controller: message,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        cursorColor: Colors.white,
                                        decoration: InputDecoration(
                                            disabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color:
                                                            Color(0xfff7b733))),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 3,
                                                        color: Colors.yellow)),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8))),
                                      ),
                                    ),
                                    Expanded(
                                      child: IconButton(
                                          onPressed: onSendMessage,
                                          icon: const Icon(
                                            Icons.send,
                                            color: Colors.yellow,
                                            size: 33,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Card(
                                color: Colors.black,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Contact Rider",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.yellow,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ListTile(
                                        title: Row(
                                          children: <Widget>[
                                            Expanded(
                                                child: SizedBox(
                                              height: 80,
                                              child: ElevatedButton.icon(
                                                onPressed: () {
                                                  _makingPhoneCall();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.yellow),
                                                icon: const Icon(
                                                  Icons.call,
                                                  size: 40,
                                                  color: Colors.black,
                                                ),
                                                label: const Text(
                                                  "Call Rider",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            )),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                                child: SizedBox(
                                              height: 80,
                                              child: ElevatedButton.icon(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.yellow),
                                                icon: const Icon(
                                                  Icons.card_membership,
                                                  size: 40,
                                                  color: Colors.black,
                                                ),
                                                onPressed: () {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                    content: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Icon(
                                                          Icons.card_membership,
                                                          size: 32,
                                                        ),
                                                        SizedBox(width: 16),
                                                        Expanded(
                                                            child: Text(
                                                                'Shared Successfully!!',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .black)))
                                                      ],
                                                    ),
                                                    backgroundColor:
                                                        Colors.yellow,
                                                    duration: const Duration(
                                                        seconds: 3),
                                                    shape:
                                                        const StadiumBorder(),
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 16,
                                                        horizontal: 12),
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    elevation: 0,
                                                  ));
                                                },
                                                label: const Text(
                                                  "Share Renter ID",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                              height: 55,
                                              width: 330,
                                              child: ElevatedButton.icon(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.yellow),
                                                onPressed: () {
                                                  print(
                                                      "Pollylines from rider to renter");
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        backgroundColor:
                                                            Colors.yellow,
                                                        title: const Text(
                                                          'Confirm To Start',
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        content:
                                                            SingleChildScrollView(
                                                          child: ListBody(
                                                            children: [
                                                              Container(
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          width:
                                                                              3,
                                                                          color: Colors
                                                                              .black)),
                                                                  child: Lottie
                                                                      .asset(
                                                                          "assets/StartNavi.json")),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                "Upon starting the rental,",
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Text(
                                                                  "The Rider will be able to Reach Your Place by the the Navigation in Google-Maps.",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold))
                                                            ],
                                                          ),
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            child: const Text(
                                                              'Confirm',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              Position
                                                                  cPosition =
                                                                  await Geolocator.getCurrentPosition(
                                                                      desiredAccuracy:
                                                                          LocationAccuracy
                                                                              .bestForNavigation);
                                                              userCurrentPosition =
                                                                  cPosition;
                                                              //Converting position to longitude and latitude
                                                              LatLng latLngPosition = LatLng(
                                                                  userCurrentPosition!
                                                                      .latitude,
                                                                  userCurrentPosition!
                                                                      .longitude);
                                                              print(
                                                                  "Longitude = ${userCurrentPosition!.longitude}");
                                                              print(
                                                                  "Latitude = ${userCurrentPosition!.latitude}");

                                                              renterlongitude =
                                                                  userCurrentPosition!
                                                                      .longitude;
                                                              renterlatitude =
                                                                  userCurrentPosition!
                                                                      .latitude;

                                                              List<Placemark>
                                                                  placemarks =
                                                                  await placemarkFromCoordinates(
                                                                      renterlatitude,
                                                                      renterlongitude);
                                                              presentAddressofuser =
                                                                  "${placemarks[0].street}, ${placemarks[2].name}, ${placemarks[3].street}, ${placemarks[0].subLocality}, ${placemarks[0].locality}, ${placemarks[0].administrativeArea}-${placemarks[0].postalCode}, ${placemarks[0].country}";
                                                              //Adjusting camera position in case of user motion

                                                              cameraPositionofuser1 =
                                                                  CameraPosition(
                                                                      target:
                                                                          latLngPosition,
                                                                      zoom: 14);

                                                              showDialog(
                                                                  context:
                                                                      context,
                                                                  barrierDismissible:
                                                                      false,
                                                                  builder:
                                                                      ((context) {
                                                                    return ProgressDialog(
                                                                      message:
                                                                          "Processing Location..",
                                                                    );
                                                                  }));

                                                              print(
                                                                  "Address:- $presentAddressofuser");

                                                              print(
                                                                  doclengthofRFR);

                                                              DocumentReference
                                                                  users =
                                                                  FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          'RFR-Transactions')
                                                                      .doc(
                                                                          "RFR${date.day}${date.month}${date.year}0");
                                                              users.set({
                                                                'RFRDocLength':
                                                                    doclengthofRFR,
                                                                'RFRID':
                                                                    "RFR${date.day}${date.month}${date.year}0",
                                                                'Trip-Date':
                                                                    "${date.day} / ${date.month} / ${date.year}",
                                                                'Renter-Address':
                                                                    presentAddressofuser,
                                                                'Rental-Status':
                                                                    "Going To Start",
                                                                'Renter-Location':
                                                                    "",
                                                                'Rider-Location':
                                                                    "",
                                                                'Renter-PhoneNumber':
                                                                    "",
                                                                'Rider-PhoneNumber':
                                                                    "",
                                                                'RiderReachedToRenter':
                                                                    false,
                                                                'RenterVerifiedRiderReached':
                                                                    false,
                                                                'Rider-Undertaking':
                                                                    false,
                                                                'Renter-Undertaking':
                                                                    false,
                                                                'Rental-Duration':
                                                                    "",
                                                                'Rental-Description':
                                                                    "",
                                                                'Check-Bike-To-Rent-By-Rider':
                                                                    false,
                                                                'Bike-Receieved-To-Start-Trip':
                                                                    false,
                                                                'End-Trip-By-Rider':
                                                                    false,
                                                                'End-Trip-By-Renter':
                                                                    false,
                                                                'Start-Trip-By-Rider':
                                                                    true,
                                                                'Start-Trip-By-Renter':
                                                                    true,
                                                                'Vehicle-Name':
                                                                    "",
                                                                'Renter-Name':
                                                                    "",
                                                                'Rider-Name':
                                                                    "",
                                                                'Vehicle-No':
                                                                    "",
                                                                'Rental-Amount':
                                                                    "",
                                                                'Rental-Ratings':
                                                                    "",
                                                                'Check-Bike-After-Rental-Renter':
                                                                    false,
                                                                'Rider-Paid-Amount':
                                                                    false,
                                                                'Payment-Done':
                                                                    false,
                                                              });
                                                              fetchRFRDocData();
                                                              Navigator.pushNamed(
                                                                  context,
                                                                  'ConnectRentertoRider1.id');
                                                            },
                                                          ),
                                                          TextButton(
                                                            child: const Text(
                                                                'Cancel',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                icon: const Icon(
                                                  Icons.directions_walk,
                                                  size: 40,
                                                  color: Colors.black,
                                                ),
                                                label: const Text(
                                                  "Start-Rental",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )))
                                    ],
                                  ),
                                )),
                          ],
                        );
                      }
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: SizedBox(
                              height: 250,
                              width: 250,
                              child: GestureDetector(
                                child: Lottie.asset(
                                    'assets/Under-maintainence.json'),
                                onTap: () {},
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              "Something went wrong, in the Chat-Section. We are trying to fix it. Thank you for your patience.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
                            )),
                          )
                        ],
                      );
                    }
                  }),
                  stream: _firestore
                      .collection("chatroom")
                      .doc(myriderchatroomId)
                      .collection(myriderchatroomId)
                      .orderBy("time", descending: true)
                      .snapshots(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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

  _makingPhoneCall() async {
    var url = Uri.parse("tel:9494570865");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget messages(BuildContext context, Map<String, dynamic> map) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: map['sendby'] == globalUseremail
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: (map['sendby'] == globalUseremail)
                ? Colors.yellow
                : Colors.white),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 14),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: Text(
          map['message'],
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }

  void onSendMessage() async {
    if (myriderchater == "Freoz Shah") {
      myriderchatroomId = "ChatAsFreozRenter";
    } else if (myriderchater == "Pradeep Rawat") {
      myriderchatroomId = "ChatAsPradeepRenter";
    } else if (myriderchater == "Rajesh Bhat") {
      myriderchatroomId = "ChatAsRajeshRenter";
    } else if (myriderchater == "Rohit Kumar") {
      myriderchatroomId = "ChatAsRohitRenter";
    } else if (myriderchater == "Sandeep Reddy") {
      myriderchatroomId = "ChatAsSandeepRenter";
    } else if (myriderchater == "Vinod Sharma") {
      myriderchatroomId = "ChatAsVinodRenter";
    }

    if (message.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sendby": globalUseremail,
        "message": message.text,
        "time": FieldValue.serverTimestamp()
      };
      await _firestore
          .collection('chatroom')
          .doc(myriderchatroomId)
          .collection(myriderchatroomId)
          .add(messages);
      message.clear();
    } else {
      print("Enter Text");
    }
  }

  void onSendWelcomeMessage() async {
    if (myriderchater == "Freoz Shah") {
      myriderchatroomId = "ChatAsFreozRenter";
    } else if (myriderchater == "Pradeep Rawat") {
      myriderchatroomId = "ChatAsPradeepRenter";
    } else if (myriderchater == "Rajesh Bhat") {
      myriderchatroomId = "ChatAsRajeshRenter";
    } else if (myriderchater == "Rohit Kumar") {
      myriderchatroomId = "ChatAsRohitRenter";
    } else if (myriderchater == "Sandeep Reddy") {
      myriderchatroomId = "ChatAsSandeepRenter";
    } else if (myriderchater == "Vinod Sharma") {
      myriderchatroomId = "ChatAsVinodRenter";
    }

    Map<String, dynamic> messages = {
      "sendby": globalUseremail,
      "message": "Hi $myriderchater, I can Rent My Bike To You",
      "time": FieldValue.serverTimestamp()
    };
    await _firestore
        .collection('chatroom')
        .doc(myriderchatroomId)
        .collection(myriderchatroomId)
        .add(messages);
  }
}
