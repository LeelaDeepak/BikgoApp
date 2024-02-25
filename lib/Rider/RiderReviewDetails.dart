import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../globaldetails.dart';

class RiderReview extends StatefulWidget {
  const RiderReview({Key? key}) : super(key: key);

  @override
  State<RiderReview> createState() => _RiderReviewState();
}

class _RiderReviewState extends State<RiderReview> {
  bool value = false;
  Future<Widget> _getImagefront(BuildContext context, String imageName) async {
    late Image image;
    await FireStoreForFrontLicense.loadImage(context, imageName)
        .then((value) => {
              image = Image.network(
                value.toString(),
                fit: BoxFit.cover,
              )
            });
    return image;
  }

  Future<Widget> _getImageback(BuildContext context, String imageName) async {
    late Image image;
    await FireStoreForBackLicense.loadImage(context, imageName)
        .then((value) => {
              image = Image.network(
                value.toString(),
                fit: BoxFit.cover,
              )
            });
    return image;
  }

  Future<Widget> _getSelfie(BuildContext context, String imageName) async {
    late Image image;
    await FireStoreForSelfie.loadImage(context, imageName).then((value) => {
          image = Image.network(
            value.toString(),
            fit: BoxFit.cover,
          )
        });
    return image;
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
                alignment: Alignment.center,
                child: const Text(
                  "Review Your",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.yellow),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Details!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.yellow),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Card(
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Table(
                                  columnWidths: const {
                                    0: FixedColumnWidth(
                                        120.0), // fixed to 100 width
                                    1: FlexColumnWidth(200.0),
                                    //fixed to 100 width
                                  },
                                  border: TableBorder.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 3),
                                  children: [
                                    TableRow(children: [
                                      Column(children: const [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            'Name',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ]),
                                      Column(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(ridernaam,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        )
                                      ]),
                                    ]),
                                    TableRow(children: [
                                      Column(children: const [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('Age',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        )
                                      ]),
                                      Column(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(riderkasaal,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        )
                                      ]),
                                    ]),
                                    TableRow(children: [
                                      Column(children: const [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('Address',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        )
                                      ]),
                                      Column(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(rideradda,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        )
                                      ]),
                                    ]),
                                    TableRow(children: [
                                      Column(children: const [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('Phone Number',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        )
                                      ]),
                                      Column(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(riderkaphonenp,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        )
                                      ]),
                                    ]),
                                    TableRow(children: [
                                      Column(children: const [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('License Number',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        )
                                      ]),
                                      Column(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(riderkaLicenseNo,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        )
                                      ]),
                                    ]),
                                  ]),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              color: Colors.black,
                              thickness: 4.0,
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(
                                    width: 4,
                                    color: Colors.black,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: const Text(
                                "Rider-License-Front-Side",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                ),
                                child: FutureBuilder(
                                  future:
                                      _getImagefront(context, FrontSideLicense),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return SizedBox(
                                          width: 330,
                                          child: Container(
                                              padding: const EdgeInsets.all(10),
                                              color: Colors.white,
                                              child: Container(
                                                child: snapshot.data as Widget,
                                              )));
                                    }
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const SizedBox(
                                          child: CircularProgressIndicator(
                                              color: Colors.black));
                                    } else {
                                      return SizedBox(
                                          width: 330,
                                          child: Container(
                                            color: Colors.white,
                                            child: const Text(
                                              'No Image',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 40,
                                                  color: Colors.black),
                                            ),
                                          ));
                                    }
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              color: Colors.black,
                              thickness: 4.0,
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(
                                    width: 4,
                                    color: Colors.black,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: const Text(
                                "Rider-License-Back-Side",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                ),
                                child: FutureBuilder(
                                  future:
                                      _getImageback(context, BackSideLicense),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return SizedBox(
                                          width: 330,
                                          child: Container(
                                              padding: const EdgeInsets.all(10),
                                              color: Colors.white,
                                              child: Container(
                                                child: snapshot.data as Widget,
                                              )));
                                    }
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const SizedBox(
                                          child: CircularProgressIndicator(
                                              color: Colors.black));
                                    } else {
                                      return SizedBox(
                                          width: 330,
                                          child: Container(
                                            color: Colors.white,
                                            child: const Text(
                                              'No Photo',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 40,
                                                  color: Colors.black),
                                            ),
                                          ));
                                    }
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              color: Colors.black,
                              thickness: 4.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(
                                    width: 4,
                                    color: Colors.black,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))),
                              child: const Text(
                                "Rider-Selfie",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                ),
                                child: FutureBuilder(
                                  future: _getSelfie(context, RiderSelfie),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return SizedBox(
                                          width: 330,
                                          child: Container(
                                              padding: const EdgeInsets.all(10),
                                              color: Colors.white,
                                              child: Container(
                                                child: snapshot.data as Widget,
                                              )));
                                    }
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return SizedBox(
                                          child: Container(
                                              color: Colors.white,
                                              child:
                                                  const CircularProgressIndicator(
                                                      color: Colors.black)));
                                    } else {
                                      return SizedBox(
                                          width: 330,
                                          child: Container(
                                            color: Colors.white,
                                            child: const Text(
                                              'No Image',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 40,
                                                  color: Colors.black),
                                            ),
                                          ));
                                    }
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(
                              color: Colors.black,
                              thickness: 4.0,
                            ),
                            const Text(
                              "Declaration from Rider",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                              child: const Text(
                                "I hereby declare that, the above submitted information is true and correct to the best of my knowledge. Toggle the switch in order to accept the declaration.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    backgroundColor: Colors.yellow,
                                    color: Colors.black),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            buildSwitch(),
                            const Divider(
                              color: Colors.black,
                              thickness: 4.0,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 80,
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return Colors.black;
                                      }
                                      return Colors.black;
                                    }),
                                  ),
                                  onPressed: () {
                                    if (value == true) {
                                      print("Switch=${value.toString()}");
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.done,
                                              size: 32,
                                              color: Colors.black,
                                            ),
                                            SizedBox(width: 16),
                                            Expanded(
                                                child: Text(
                                                    'Registration Completed',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white)))
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
                                      SendDatatoFirestore();
                                      Navigator.pushNamed(
                                          context, 'ThankYouUserforDetails.id');
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.error,
                                              size: 32,
                                            ),
                                            SizedBox(width: 16),
                                            Expanded(
                                                child: Text(
                                                    'Please toggle the switch in form of declaration.',
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
                                  child: const Text(
                                    "Submit-Registration",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellow),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SendDatatoFirestore() async {
    DocumentReference users = FirebaseFirestore.instance
        .collection('Rider-details')
        .doc(globalUseremail);
    await users.set({
      'Rider-Name': ridernaam,
      'Rider-PhoneNumber': riderkaphonenp,
      'Rider-Address': rideradda,
      'Rider-Age': riderkasaal,
      'IsVerified': IsRiderVerifiedBool,
      'License-No': riderkaLicenseNo,
      'Email': globalUseremail,
      'Rider-License-Back': urider1,
      'Rider-License-Front': urider2,
      'Rider-Selfie': urider3,
      'Rider-Front-License-FileName': FrontSideLicense,
      'Rider-Back-License-FileName': BackSideLicense,
      'Rider-Selfie-FileName': RiderSelfie
    });
    print("Added to Firestore");
    print(ridernaam);
    print(riderkaphonenp);
    print(rideradda);
    print(riderkasaal);
    print(urider1);
    print(urider2);
    print(urider3);
  }

  Widget buildSwitch() => Transform.scale(
        scale: 2,
        child: SizedBox(
          width: 75,
          child: Switch(
              trackColor: MaterialStateProperty.all(Colors.black),
              activeColor: Colors.green,
              inactiveThumbColor: Colors.red,
              activeThumbImage: const AssetImage('assets/acceptIcon.png'),
              inactiveThumbImage: const AssetImage('assets/rejecticon.png'),
              value: value,
              onChanged: (value) {
                setState(() {
                  this.value = value;
                  print("value=$value");
                });
              }),
        ),
      );
}

class FireStoreForFrontLicense extends ChangeNotifier {
  FireStoreForFrontLicense();
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance
        .ref()
        .child(
            "Rider/Vechile-License/$globalUseremail/Front_Rider_License/$FrontSideLicense")
        .getDownloadURL();
  }
}

class FireStoreForBackLicense extends ChangeNotifier {
  FireStoreForBackLicense();
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance
        .ref()
        .child(
            "Rider/Vechile-License/$globalUseremail/Back_Rider_License/$BackSideLicense")
        .getDownloadURL();
  }
}

class FireStoreForSelfie extends ChangeNotifier {
  FireStoreForSelfie();
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance
        .ref()
        .child("Rider/Selfies/$globalUseremail/Rider_Selfie/$RiderSelfie")
        .getDownloadURL();
  }
}
