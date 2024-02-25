import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../globaldetails.dart';

class RentBikeProvider extends StatefulWidget {
  const RentBikeProvider({Key? key}) : super(key: key);

  @override
  State<RentBikeProvider> createState() => _RentBikeProviderState();
}

class _RentBikeProviderState extends State<RentBikeProvider>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final rentername = TextEditingController();
  final renterage = TextEditingController();
  final renterphone = TextEditingController();
  final renteraddress = TextEditingController();
  final renterBikeModel = TextEditingController();
  final renterBikeNumber = TextEditingController();
  final renterchasisnumber = TextEditingController();
  final renterbikeregistrationnumber = TextEditingController();
  String DOB = "";
  bool isCompleted = false;
  bool isCompleted1 = false;
  DateTime date = DateTime.now();
  bool onbtnclicked = false;
  bool userisallowed = false;
  int currentStep = 0;
  int currentStep1 = 0;
  bool senddata = false;

  validateForm() {
    if (rentername.text.length < 3) {
      Fluttertoast.showToast(msg: "Name must be atleast 3 Characters");
    } else if (renterphone.text.length < 10) {
      Fluttertoast.showToast(msg: "Phone Number is incorrect");
    } else if (renteraddress.text.length < 3) {
      Fluttertoast.showToast(msg: "Invalid Address");
    } else if (renterBikeModel.text.length < 3) {
      Fluttertoast.showToast(msg: "Bike Model is Invalid");
    } else if (renterBikeNumber.text.length < 2) {
      Fluttertoast.showToast(msg: "Bike Number is Invalid");
    } else if (renterchasisnumber.text.length < 2) {
      Fluttertoast.showToast(msg: "Invalid Chasis Number");
    } else if (renterbikeregistrationnumber.text.length < 3) {
      Fluttertoast.showToast(msg: "Invalid RC-Number");
    } else if (DOB == "") {
      Fluttertoast.showToast(msg: "Invalid Date of Birth");
    } else {
      Fluttertoast.showToast(msg: "Details Saved");
      setState(() {
        senddata = true;
      });
    }
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
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: const Text(
                  "Sign Up As A Renter",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.yellow),
                ),
              ),
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
                            labelText: 'Full-Name',
                            hintText: 'As per Your Bike-RC',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 40,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          controller: rentername,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 370,
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Current-Address',
                            hintText:
                                'Give The Address where you live as of now...(It can be changed later if needed)',
                            hintMaxLines: 3,
                            prefixIcon: Icon(
                              Icons.location_on,
                              color: Colors.black,
                              size: 40,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          maxLines: null,
                          controller: renteraddress,
                          keyboardType: TextInputType.multiline,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 370,
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Phone-Number',
                            prefixText: "+91",
                            hintText: 'To connect with Rider',
                            prefixIcon: Icon(
                              Icons.call,
                              color: Colors.black,
                              size: 40,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          controller: renterphone,
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
                        height: 20,
                      ),
                      const Text(
                        "Registration-Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            backgroundColor: Colors.yellow,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "(As Per Your Bike-RC)",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 60,
                        child: ElevatedButton.icon(
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                  context: context,
                                  initialDate: date,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));
                              //if 'CANCEL'==>null
                              if (newDate != null) {
                                setState(() => date = newDate);
                                DOB =
                                    '${date.day} / ${date.month} / ${date.year}';
                                print(DOB);
                                calculateAge(date);
                              }
                            },
                            icon: const Icon(
                              Icons.calendar_month,
                              color: Colors.black,
                              size: 40,
                            ),
                            label: const Text(
                              "Date-Of-Birth",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (userisallowed)
                        Row(
                          children: const [
                            SizedBox(
                              width: 90,
                            ),
                            Icon(
                              Icons.thumb_up,
                              color: Colors.green,
                            ),
                            Text("Allowed to register",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green)),
                          ],
                        )
                      else
                        Row(
                          children: const [
                            SizedBox(
                              width: 75,
                            ),
                            Icon(
                              Icons.thumb_down,
                              color: Colors.red,
                            ),
                            Text("Not Allowed to register",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red)),
                          ],
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 370,
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Bike-Registration-No',
                            hintText: "Enter Bike's Registration-No ",
                            prefixIcon: Icon(
                              Icons.book,
                              color: Colors.black,
                              size: 40,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          controller: renterbikeregistrationnumber,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 370,
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Bike-Chassis-No',
                            hintText: "Last 5 Digits of Chassis No",
                            prefixIcon: Icon(
                              Icons.confirmation_number,
                              color: Colors.black,
                              size: 40,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          controller: renterchasisnumber,
                          maxLength: 5,
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
                        height: 20,
                      ),
                      const Text(
                        "Bike-Details",
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
                            labelText: 'Bike-Model',
                            hintText: "Enter your bike's name or model",
                            prefixIcon: Icon(
                              Icons.motorcycle_rounded,
                              color: Colors.black,
                              size: 40,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          controller: renterBikeModel,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 370,
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Vehicle-Number',
                            hintText: "Enter your vehicle number.",
                            prefixIcon: Icon(
                              Icons.directions_bike,
                              color: Colors.black,
                              size: 40,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          controller: renterBikeNumber,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 80,
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
                              if (renteraddress.text != "" &&
                                  DOB != "" &&
                                  rentername.text != "" &&
                                  renterphone.text != "" &&
                                  renterBikeModel.text != "" &&
                                  renterbikeregistrationnumber.text != "" &&
                                  renterchasisnumber.text != "" &&
                                  renterBikeNumber.text != "") {
                                validateForm();
                                RenterNameforUpload = rentername.text;
                                print("Renter-Name: " + rentername.text);
                                print("Renter-Address: " + renteraddress.text);
                                print(
                                    "Renter-PhoneNumber: " + renterphone.text);
                                print("Bike-Model: " + renterBikeModel.text);
                                print("Bike-Number: " + renterBikeNumber.text);
                                setState(() {
                                  Renterkanaam = rentername.text.trim();
                                  RenterNametoShow = rentername.text.trim();
                                  Renterkaaddress = renteraddress.text.trim();
                                  Renterkaphone =
                                      "+91" + renterphone.text.trim();
                                  RenterkabikeNumber = renterBikeNumber.text
                                      .toUpperCase()
                                      .trim();
                                  Renterkabikemodel =
                                      renterBikeModel.text.trim();
                                  RenterkaRegnumber =
                                      renterbikeregistrationnumber.text
                                          .toUpperCase()
                                          .trim();
                                  Renterkachasisnumber =
                                      renterchasisnumber.text.trim();
                                  if (senddata == true) {
                                    Navigator.pushNamed(
                                        context, 'ReviewRenterUpload.id');
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Enter Valid Details");
                                  }
                                });
                              } else {
                                print("Fill details");
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
                                              'To proceed, enter all the required information.',
                                              style: TextStyle(fontSize: 20)))
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
                              "Save & Next",
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
              )),
            ],
          ),
        ),
      ),
    );
  }

  calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    if (age >= 18) {
      print("Renter is allowed to Register");
      setState(() {
        Renterkaage = age.toString();
      });

      setState(() {
        userisallowed = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.done,
              size: 32,
            ),
            SizedBox(width: 16),
            Expanded(
                child: Text('Allowed to Register for Verification',
                    style: TextStyle(
                      fontSize: 20,
                    )))
          ],
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
        shape: const StadiumBorder(),
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ));
    } else {
      setState(() {
        userisallowed = false;
      });
      print("Renter is not allowed to Register");
    }
  }
}
