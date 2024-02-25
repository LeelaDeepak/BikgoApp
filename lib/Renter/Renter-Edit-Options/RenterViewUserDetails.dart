import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RenterViewUserDetails extends StatefulWidget {
  const RenterViewUserDetails({Key? key}) : super(key: key);

  @override
  State<RenterViewUserDetails> createState() => _RenterViewUserDetailsState();
}

class _RenterViewUserDetailsState extends State<RenterViewUserDetails> {
  bool value = true;

  @override
  void initState() {
    getRenterUserDetails();
    super.initState();
  }

  getRenterUserDetails() async {
    DocumentSnapshot dataref = await FirebaseFirestore.instance
        .collection("Renter-details")
        .doc(globalUseremail)
        .get();

    setState(() {
      Renterkanaam = dataref['Renter-Name'];
      Renterkaphone = dataref['Renter-PhoneNumber'];
      Renterkaaddress = dataref['Renter-Address'];
      Renterkaage = dataref['Renter-Age'];
      RenterkaRegnumber = dataref['Renter-BikeRegNumber'];
      Renterkachasisnumber = dataref['Renter-ChasisNumber'];
      Renterkabikemodel = dataref['Renter-BikeModel'];
      RenterkabikeNumber = dataref['Renter-BikeNumber'];
      urenter2 = dataref['Renter-Bike-Insurance'];
      urenter3 = dataref['Renter-Pollution-Certificate'];
      Renterkaselfie = dataref['Renter-Selfie'];
      RenterBikekaphoto = dataref['Renter-Bike-Photo'];
      urenter1 = dataref['Renter-Bike-RC'];
      RenterkaBikephotofilename = dataref['Renter-Bike-Photo-FileName'];
      RenterkaSelfiefilename = dataref['Renter-Selfie-FileName'];
      RenterkaRCfilename = dataref['Renter-RC-FileName'];
      RenterkaInsurancefilename = dataref['Renter-Bike-Insurance-FileName'];
      RenterkaPollutionfilename =
          dataref['Renter-Pollution-Certificate-FileName'];
      IsRiderVerifiedBool = dataref['IsVerified'];
    });
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
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: IconButton(
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "View Your",
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
                                        child: Text(Renterkanaam,
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
                                        child: Text(Renterkaage,
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
                                        child: Text(Renterkaaddress,
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
                                        child: Text(Renterkaphone,
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
                                        child: Text('Renter Selfie Filename',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      )
                                    ]),
                                    Column(children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(RenterkaSelfiefilename,
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
                                        child: Text('Renter Selfie Status',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      )
                                    ]),
                                    Column(children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Verified and Submitted",
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
                          const Text(
                            "Declaration from Renter",
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
                              "I hereby declare that, the above submitted information is true and correct to the best of my knowledge. Toggled the switch in order to accept the declaration.",
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
                        ],
                      ),
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
      },
    );
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
