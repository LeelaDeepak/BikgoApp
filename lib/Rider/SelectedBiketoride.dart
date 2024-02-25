import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

import 'package:url_launcher/url_launcher.dart';
import 'package:bigkoapp/globaldetails.dart';
import 'package:flutter/material.dart';

class SelectedBikeToRide extends StatefulWidget {
  const SelectedBikeToRide({Key? key}) : super(key: key);

  @override
  State<SelectedBikeToRide> createState() => _SelectedBikeToRideState();
}

class _SelectedBikeToRideState extends State<SelectedBikeToRide> {
  // late AndroidNotificationChannel channel;
  // late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  @override
  void initState() {
    super.initState();
    // requestPermission();
    // loadFCM();
    // listenFCM();
    getToken();
  }

  void getToken() async {
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging.getToken().then((token) {
      print("token is $token");
      gtoken = token;
    });
  }

  // void requestPermission() async {
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;
  //   NotificationSettings settings = await messaging.requestPermission(
  //       alert: true,
  //       announcement: false,
  //       badge: true,
  //       carPlay: false,
  //       criticalAlert: false,
  //       provisional: false,
  //       sound: true);
  //   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //     print('User granted Perssmisson');
  //   } else if (settings.authorizationStatus ==
  //       AuthorizationStatus.provisional) {
  //     print('User granted provisional permission');
  //   } else {
  //     print("User declined or has not accepted permission");
  //   }
  // }

  // void listenFCM() async {
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     RemoteNotification? notification = message.notification;
  //     AndroidNotification? android = message.notification?.android;
  //     if (notification != null && android != null && !kIsWeb) {
  //       flutterLocalNotificationsPlugin.show(
  //         notification.hashCode,
  //         notification.title,
  //         notification.body,
  //         NotificationDetails(
  //           android: AndroidNotificationDetails(
  //             channel.id,
  //             channel.name,
  //             importance: Importance.high,

  //             // TODO add a proper drawable resource to android, for now using
  //             //      one that already exists in example app.
  //             icon: 'launch_background',
  //           ),
  //         ),
  //       );
  //       print("channel-ID:${channel.id.toString()}");
  //     }
  //   });
  // }

  // void loadFCM() async {
  //   if (!kIsWeb) {
  //     channel = const AndroidNotificationChannel(
  //         'high_importance_channel', 'High Importance Notifications',
  //         importance: Importance.high, playSound: true, enableVibration: true);
  //     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  //     await flutterLocalNotificationsPlugin
  //         .resolvePlatformSpecificImplementation<
  //             AndroidFlutterLocalNotificationsPlugin>()
  //         ?.createNotificationChannel(channel);
  //     await FirebaseMessaging.instance
  //         .setForegroundNotificationPresentationOptions(
  //             alert: true, badge: true, sound: true);
  //   }
  // }

  void saveToken(String token) async {
    await FirebaseFirestore.instance
        .collection("Rider-Tokens")
        .doc(globalUseremail)
        .set({
      'phone-token': token,
      'email': globalUseremail,
    });
    print("saved in firestore with $token");
  }

  // void sendnotification() async {
  //   try {
  //     await http.post(
  //       Uri.parse('https://fcm.googleapis.com/fcm/send'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/java',
  //         'Authorization':
  //             'key=AAAA54Xg6rs:APA91bHhRX67XeUmbaLiGuy6cpF1ir4xltM8rfKlSZ-fcy7emtcFtOda6OD5uhz13quhV0KunYBAIXU-lkjWhELM5zMCrucvepAlSodI4DSGY_w1o0BhIgT6dt3QEmBuvMtii5J1qMwl'
  //       },
  //       body: jsonEncode(
  //         <String, dynamic>{
  //           'notification': <String, dynamic>{
  //             'body': 'Test',
  //             'title': 'Test title',
  //           },
  //           'priority': 'high',
  //           'data': <String, dynamic>{
  //             'click_action': 'FLUTTER_NOTIFICATION_CLICK',
  //             'id': '1',
  //             'status': 'done'
  //           },
  //           "to":
  //               "dS_NPn8eSjmQoMnFaDTbxo:APA91bGrMgVMe-nPjut4Vqe2U5RSOjd8WIML8AQMGF-O3v4JgOLQdJjHGhff5wdK7CgMKxH_oDuDxLoPD_PpVjSYbiNpnnmMqCf4qTGl5-AD37Hd-Zz2LG7E4mGRG6faguHhHCno5HdZ",
  //         },
  //       ),
  //     );
  //   } catch (e) {
  //     print("error push notification");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                }),
            title: const Text(
              "Selected Bike To Ride",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue.shade900),
        backgroundColor: Colors.blue.shade900,
        body: SingleChildScrollView(
          child: Center(
            child: Container(
                padding: const EdgeInsets.all(8),
                child: Card(
                  color: const Color(0xFFffcd3c),
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: SizedBox(
                      width: 370,
                      height: 770,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Model:- $RenterBikeNaam",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Material(
                            elevation: 4.0,
                            clipBehavior: Clip.hardEdge,
                            color: const Color(0xFFffcd3c),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 4, color: Colors.blue.shade900),
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                              onTap: () {
                                print("object");
                                Navigator.pushNamed(
                                    context, 'Clearbikeview.id');
                              }, // Handle your callback.
                              splashColor:
                                  const Color(0xFFffcd3c).withOpacity(0.5),
                              child: Ink(
                                height: 250,
                                width: 350,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(RenterBikekaphoto),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ListTile(
                            tileColor: Colors.blue.shade900,
                            leading: InkWell(
                              onTap: () {
                                print("view");
                              },
                              splashColor:
                                  const Color(0xFFffcd3c).withOpacity(0.5),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.yellow,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(26.5)),
                                child: CircleAvatar(
                                  radius: 28.5,
                                  backgroundColor: Colors.yellow,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  backgroundImage: NetworkImage(
                                    Renterkaselfie,
                                  ),
                                ),
                              ),
                            ),
                            title: Text("Renter-Name:- $Renterkanaam",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.yellow,
                                )),
                            subtitle: Text("Renter-Address:- $Renterkaaddress",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.yellow)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.call,
                                      size: 40,
                                    ),
                                    onPressed: () {
                                      print("call Renter");
                                      _makingPhoneCall(context);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.message,
                                      size: 40,
                                    ),
                                    onPressed: () {
                                      print("message Renter");
                                      launchWhatsApp(context);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.star,
                                      size: 40,
                                    ),
                                    onPressed: () {
                                      print("Starred-Bike");
                                    },
                                  ),
                                ),
                              ]),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 75,
                            width: 300,
                            child: ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.black)),
                              icon: const Icon(
                                Icons.motorcycle_outlined,
                                size: 40,
                                color: Colors.yellow,
                              ),
                              label: const Text(
                                "Book-Ride",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow),
                              ),
                              onPressed: () async {
                                if (globalUseremail != "") {
                                  DocumentReference users = FirebaseFirestore
                                      .instance
                                      .collection('RFR-Transactions')
                                      .doc(globalUseremail);
                                  await users.set({
                                    'Actual-Duration-Of-Time': "",
                                    'Minimum-Fuel-Flag': "True",
                                    'Paid-Amount': "",
                                    'RFR-ID': "",
                                    'Chat-Ended': "True",
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
                                  print("Added to Firestore");
                                  print("Now Fetching Data");
                                  DocumentSnapshot s = await FirebaseFirestore
                                      .instance
                                      .collection('RFR-Transactions')
                                      .doc(globalUseremail)
                                      .get();
                                  print(gtoken);
                                  saveToken(gtoken!);
                                  List<String> tokenlist = [];
                                  tokenlist.add(gtoken!);
                                  print(tokenlist);
                                  //sendnotification();
                                  bikeconfirm(context, s);
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          )
                        ],
                      )),
                )),
          ),
        ),
      ),
    );
  }

  bikeconfirm(context, s) async {
    String textmsg = "Hi $Renterkanaam, I want to rent your bike.";
    var renterchat =
        Uri.parse("whatsapp://send?phone=$Renterkaphone&text=$textmsg");

    if (await canLaunchUrl(renterchat)) {
      print(s.data()['Rider-Email-ID']);
      print(s.data()['Renter-Acceptance']);
      print(s.data()['Chat-Ended']);
      chatstatus = s.data()['Chat-Ended'];
      confirmmsgfromrenter = s.data()['Renter-Acceptance'];
      print("confirmmsgfromrenter:$confirmmsgfromrenter");
      print("Chat-status:$chatstatus");
      if (confirmmsgfromrenter == "True") {
        await launchUrl(renterchat);
        Navigator.pushNamed(context, 'chatstatus.id');
      } else {
        print("Not-Available");
        // Navigator.pushNamed(context, 'Pleasewait.id');
      }
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
                child: Text('Sorry, Cannot connect to Renter',
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
      throw 'Allow permission';
    }
  }

  _makingPhoneCall(context) async {
    var url = Uri.parse("tel:$Renterkaphone");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
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
                child: Text('Sorry, Cannot call the Renter',
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
      throw 'Could not launch $url';
    }
  }

  launchWhatsApp(context) async {
    var url = Uri.parse("whatsapp://send?phone=$Renterkaphone&text=Hi-Renter");
    await canLaunchUrl(url)
        ? launchUrl(url)
        : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.error,
                  size: 32,
                ),
                SizedBox(width: 16),
                Expanded(
                    child: Text('Sorry, Cannot whatsapp the Renter',
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
    ;
  }
}
