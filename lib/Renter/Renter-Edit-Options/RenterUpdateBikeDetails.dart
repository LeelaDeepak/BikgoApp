import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class RenterUpdateBikeDetails extends StatefulWidget {
  const RenterUpdateBikeDetails({Key? key}) : super(key: key);

  @override
  State<RenterUpdateBikeDetails> createState() =>
      _RenterUpdateBikeDetailsState();
}

class _RenterUpdateBikeDetailsState extends State<RenterUpdateBikeDetails> {
  final renterbikemodel = TextEditingController();
  final renterbikenum = TextEditingController();
  final renterbikechasisnum = TextEditingController();
  final renterbikeregnum = TextEditingController();
  bool senddata = false;
  String renteradd = "";
  String renterph = "";
  String rentername = "";
  String renterage = "";
  String renterbikemod = "";
  String renterbiknum = "";
  String renteremail = "";
  String renterchasis = "";
  String renterregnum = "";
  String renterinsur = "";
  String renterpc = "";
  String renterself = "";
  String renterbikeph = "";
  String renterrcph = "";
  String renterbikephfile = "";
  String renterselffile = "";
  String renterrcfile = "";
  String renterbikeinsurfile = "";
  String renterpollcertifile = "";
  String isverif = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Update Bike Details",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.yellow),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Lottie.asset('assets/updaterenterbikedetails.json'),
            const SizedBox(
              height: 10,
            ),
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
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 370,
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Bike-Model',
                            hintText: 'Give Bike-Model/Name',
                            prefixIcon: Icon(
                              Icons.motorcycle,
                              color: Colors.black,
                              size: 40,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          controller: renterbikemodel,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 370,
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Vehicle-Number',
                            hintText: 'Give Vehicle Number',
                            prefixIcon: Icon(
                              Icons.numbers,
                              color: Colors.black,
                              size: 40,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          controller: renterbikenum,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 370,
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Chasis-Number',
                            hintText: 'Last 5 Digits of Chassis No',
                            prefixIcon: Icon(
                              Icons.security,
                              color: Colors.black,
                              size: 40,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          controller: renterbikechasisnum,
                          keyboardType: TextInputType.phone,
                          maxLength: 5,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 370,
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Registration-Number',
                            hintText: 'Give Registration Number',
                            prefixIcon: Icon(
                              Icons.app_registration,
                              color: Colors.black,
                              size: 40,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          controller: renterbikeregnum,
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
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.black;
                                }
                                return Colors.black;
                              }),
                            ),
                            onPressed: () {
                              if (renterbikeregnum.text != "" &&
                                  renterbikechasisnum.text != "" &&
                                  renterbikemodel.text != "" &&
                                  renterbikenum.text != "") {
                                validateForm();
                                print("Renter-bikmodel: " +
                                    renterbikemodel.text.trim());
                                print("Renter-bikenum: " +
                                    renterbikenum.text.toUpperCase().trim());
                                print("Renter-bikeregnum: " +
                                    renterbikeregnum.text.toUpperCase().trim());
                                print("Renter-chasisnum: " +
                                    renterbikechasisnum.text.trim());

                                setState(() {
                                  renterbikemod = renterbikemodel.text.trim();
                                  renterregnum = renterbikeregnum.text
                                      .toUpperCase()
                                      .trim();
                                  renterchasis =
                                      renterbikechasisnum.text.trim();
                                  renterbiknum =
                                      renterbikenum.text.toUpperCase().trim();
                                });
                                if (senddata == true) {
                                  updaterenterbikedetails();
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "Enter Valid Details");
                                }
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }

  updaterenterbikedetails() async {
    DocumentReference users = FirebaseFirestore.instance
        .collection('Renter-details')
        .doc(globalUseremail);
    await users.set({
      'Bike-Status': false,
      'Renter-Name': rentername,
      'Renter-PhoneNumber': renterph,
      'Renter-Address': renteradd,
      'Renter-Age': renterage,
      'Renter-BikeModel': renterbikemod,
      'Renter-BikeNumber': renterbiknum,
      'Email': renteremail,
      'Renter-ChasisNumber': renterchasis,
      'Renter-BikeRegNumber': renterregnum,
      'Renter-Bike-Insurance': renterinsur,
      'Renter-Pollution-Certificate': renterpc,
      'Renter-Selfie': renterself,
      'Renter-Bike-Photo': renterbikeph,
      'Renter-Bike-RC': renterrcph,
      'IsVerified': "True",
      'Renter-Bike-Photo-FileName': renterbikephfile,
      'Renter-Selfie-FileName': renterselffile,
      'Renter-RC-FileName': renterrcfile,
      'Renter-Bike-Insurance-FileName': renterbikeinsurfile,
      'Renter-Pollution-Certificate-FileName': renterpollcertifile
    });
    Fluttertoast.showToast(msg: "Details Updated Successfully!!");
    Navigator.pushNamed(context, 'RenterTabs.id');
  }

  validateForm() {
    if (renterbikemodel.text.length < 3) {
      Fluttertoast.showToast(msg: "Invalid Bike Model");
    } else if (renterbikenum.text.length < 4) {
      Fluttertoast.showToast(msg: "Invalid Vehicle Number");
    } else if (renterbikechasisnum.text.length < 5) {
      Fluttertoast.showToast(msg: "Invalid Chasis Number");
    } else if (renterbikeregnum.text.length < 5) {
      Fluttertoast.showToast(msg: "Invalid Registration Number");
    } else {
      Fluttertoast.showToast(msg: "Details Saved");
      setState(() {
        senddata = true;
      });
    }
  }

  getRenterUserdetails() async {
    DocumentSnapshot dataref = await FirebaseFirestore.instance
        .collection("Renter-details")
        .doc(globalUseremail)
        .get();

    setState(() {
      rentername = dataref['Renter-Name'];
      renterph = dataref['Renter-PhoneNumber'];
      renteradd = dataref['Renter-Address'];
      renterage = dataref['Renter-Age'];
      renteremail = dataref['Email'];
      renterregnum = dataref['Renter-BikeRegNumber'];
      renterchasis = dataref['Renter-ChasisNumber'];
      renterbikemod = dataref['Renter-BikeModel'];
      renterbiknum = dataref['Renter-BikeNumber'];
      renterinsur = dataref['Renter-Bike-Insurance'];
      renterpc = dataref['Renter-Pollution-Certificate'];
      renterself = dataref['Renter-Selfie'];
      renterbikeph = dataref['Renter-Bike-Photo'];
      renterrcph = dataref['Renter-Bike-RC'];
      renterbikephfile = dataref['Renter-Bike-Photo-FileName'];
      renterselffile = dataref['Renter-Selfie-FileName'];
      renterrcfile = dataref['Renter-RC-FileName'];
      renterbikeinsurfile = dataref['Renter-Bike-Insurance-FileName'];
      renterpollcertifile = dataref['Renter-Pollution-Certificate-FileName'];
      isverif = dataref['IsVerified'];
    });
  }

  @override
  void initState() {
    getRenterUserdetails();
    super.initState();
  }
}
