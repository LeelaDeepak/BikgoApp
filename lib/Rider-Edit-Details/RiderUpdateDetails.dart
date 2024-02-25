import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class RiderUpdateDetails extends StatefulWidget {
  const RiderUpdateDetails({Key? key}) : super(key: key);

  @override
  State<RiderUpdateDetails> createState() => _RiderUpdateDetailsState();
}

class _RiderUpdateDetailsState extends State<RiderUpdateDetails> {
  String? profileimagepath = "";
  final riderphoneNumber = TextEditingController();
  final riderAddress = TextEditingController();
  final riderLicenseNo = TextEditingController();
  String username = "";
  String rideradd = "";
  String riderage = "";
  String riderlic = "";
  String riderph = "";
  String riderem = "";

  String riderbacklicfilename = "";
  String riderfrontlicfilename = "";
  String riderselfiefilename = "";
  String riderfrontlic = "";
  String riderbacklic = "";
  String riderselfie = "";
  bool senddata = false;

  @override
  void initState() {
    getUserprofileimage();
    super.initState();
  }

  validateForm() {
    if (riderAddress.text.length < 3) {
      Fluttertoast.showToast(msg: "Invalid Address");
    } else if (riderLicenseNo.text.length < 3) {
      Fluttertoast.showToast(msg: "License No is Invalid");
    } else if (riderphoneNumber.text.length < 10) {
      Fluttertoast.showToast(msg: "Phone Number is incorrect");
    } else {
      Fluttertoast.showToast(msg: "Details Saved");
      setState(() {
        senddata = true;
      });
    }
  }

  getUserprofileimage() async {
    DocumentSnapshot imageref = await FirebaseFirestore.instance
        .collection("Rider-details")
        .doc(globalUseremail)
        .get();
    print(imageref['Rider-Selfie']);
    print(imageref['Rider-Name']);
    print(imageref['Rider-Address']);
    print(imageref['Rider-Age']);
    print(imageref['Email']);
    print(imageref['License-No']);
    print(imageref['Rider-PhoneNumber']);
    setState(() {
      profileimagepath = imageref['Rider-Selfie'];
      username = imageref['Rider-Name'];
      rideradd = imageref['Rider-Address'];
      riderage = imageref['Rider-Age'];
      riderem = imageref['Email'];
      riderlic = imageref['License-No'];
      riderph = imageref['Rider-PhoneNumber'];
      riderbacklic = imageref['Rider-License-Back'];
      riderfrontlic = imageref['Rider-License-Front'];
      riderselfie = imageref['Rider-Selfie'];
      riderbacklicfilename = imageref['Rider-Back-License-FileName'];
      riderfrontlicfilename = imageref['Rider-Front-License-FileName'];
      riderselfiefilename = imageref['Rider-Selfie-FileName'];
    });

    print("User Profile Image URL = $profileimagepath");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.blue.shade900,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: const Text(
                    "Update Rider Details",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.yellow),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Lottie.asset('assets/updaterenterdetails.json'),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Personal-Details",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                backgroundColor: Colors.yellow,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            width: 370,
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'Current-Address',
                                hintText:
                                    'Give the address where you live as of now...(It can be changed later if needed )',
                                hintMaxLines: 3,
                                prefixIcon: Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                border: OutlineInputBorder(),
                              ),
                              controller: riderAddress,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            width: 370,
                            child: TextField(
                              decoration: const InputDecoration(
                                prefixText: "+91",
                                labelText: 'Phone-Number',
                                hintText: 'To connect with Renter',
                                prefixIcon: Icon(
                                  Icons.call,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                border: OutlineInputBorder(),
                              ),
                              controller: riderphoneNumber,
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            color: Colors.black,
                            thickness: 4.0,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "License-Details",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors.yellow,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            width: 370,
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'License No',
                                hintText: 'License No For Verification',
                                prefixIcon: Icon(
                                  Icons.motorcycle,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                border: OutlineInputBorder(),
                              ),
                              controller: riderLicenseNo,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 70,
                            width: 300,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return Colors.black;
                                    }
                                    return Colors.black;
                                  }),
                                ),
                                onPressed: () {
                                  if (riderAddress.text != "" &&
                                      riderLicenseNo.text != "" &&
                                      riderphoneNumber.text != "") {
                                    validateForm();
                                    print("Rider-License-No:" +
                                        riderLicenseNo.text.trim());
                                    print("Rider-PhoneNumber: " +
                                        riderphoneNumber.text.trim());
                                    print("Rider-Address: " +
                                        riderAddress.text.trim());

                                    setState(() {
                                      rideradd = riderAddress.text.trim();
                                      riderlic = riderLicenseNo.text
                                          .trim()
                                          .toUpperCase();
                                      riderph =
                                          "+91" + riderphoneNumber.text.trim();
                                    });
                                    if (senddata == true) {
                                      updateriderdetails();
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Enter Valid Details");
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.error_outline,
                                            size: 32,
                                          ),
                                          SizedBox(width: 16),
                                          Expanded(
                                              child: Text(
                                                  'Enter the details to update , if not your Account will be deleted from Bikgo-App',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black)))
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
                                  "Save",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        onWillPop: () async {
          return false;
        });
  }

  updateriderdetails() async {
    DocumentReference users = FirebaseFirestore.instance
        .collection('Rider-details')
        .doc(globalUseremail);
    await users.set({
      'Rider-Name': username,
      'Rider-PhoneNumber': riderph,
      'Rider-Address': rideradd,
      'Rider-Age': riderage,
      'IsVerified': "True",
      'License-No': riderlic,
      'Email': globalUseremail,
      'Rider-License-Back': riderbacklic,
      'Rider-License-Front': riderfrontlic,
      'Rider-Selfie': riderselfie,
      'Rider-Front-License-FileName': riderfrontlicfilename,
      'Rider-Back-License-FileName': riderbacklicfilename,
      'Rider-Selfie-FileName': riderselfiefilename
    });
    Fluttertoast.showToast(msg: "Details Updated Successfully!!");
    Navigator.pushNamed(context, 'RiderTabs.id');
  }
}
