import 'package:bigkoapp/globaldetails.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RideBikeUser extends StatefulWidget {
  const RideBikeUser({Key? key}) : super(key: key);

  @override
  State<RideBikeUser> createState() => _RideBikeUserState();
}

class _RideBikeUserState extends State<RideBikeUser>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final ridername = TextEditingController();
  final riderAge = TextEditingController();
  final riderphoneNumber = TextEditingController();
  final riderAddress = TextEditingController();
  final riderLicenseNo = TextEditingController();
  bool isCompleted = false;
  String DOB = "";
  DateTime date = DateTime.now();
  int currentStep = 0;
  bool onbtnclicked = false;
  bool userisallowed = false;
  bool senddata = false;

  validateForm() {
    if (ridername.text.length < 3) {
      Fluttertoast.showToast(msg: "Name must be atleast 3 Characters");
    } else if (riderphoneNumber.text.length < 10) {
      Fluttertoast.showToast(msg: "Phone Number is incorrect");
    } else if (riderAddress.text.length < 3) {
      Fluttertoast.showToast(msg: "Invalid Address");
    } else if (riderLicenseNo.text.length < 3) {
      Fluttertoast.showToast(msg: "License No is Invalid");
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
                    "Sign Up As A Rider",
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
                                hintText: 'As per Your License',
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                border: OutlineInputBorder(),
                              ),
                              controller: ridername,
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
                          const Text(
                            "(As Per Your Driving License)",
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
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.black),
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
                            height: 80,
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
                                      riderkasaal != "" &&
                                      ridername.text != "" &&
                                      riderphoneNumber.text != "") {
                                    validateForm();
                                    print(
                                        "Rider-Name: " + ridername.text.trim());
                                    print("Rider-License-No:" +
                                        riderLicenseNo.text);
                                    print("Rider-Address: " +
                                        riderAddress.text.trim());
                                    print("Rider-PhoneNumber: " +
                                        riderphoneNumber.text.trim());
                                    setState(() {
                                      RiderNametoShow = ridername.text.trim();
                                      ridernaam = ridername.text.trim();
                                      riderkaphonenp =
                                          "+91" + riderphoneNumber.text.trim();
                                      rideradda = riderAddress.text.trim();
                                      riderkaLicenseNo = riderLicenseNo.text
                                          .toUpperCase()
                                          .trim();
                                    });
                                    if (senddata == true) {
                                      Navigator.pushNamed(
                                          context, 'ReviewRiderUpload.id');
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Enter Valid Details");
                                    }
                                  } else {
                                    print("Fill details");

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
                                                  'To proceed, enter and upload the required information.',
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
                                  "Save & Next",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
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
      print("Rider is allowed to Register");
      setState(() {
        riderkasaal = age.toString();
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
      print("Rider is not allowed to Register");
    }
  }
}
