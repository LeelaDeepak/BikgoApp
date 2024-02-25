import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:slide_to_act/slide_to_act.dart';

class Rentbikenow extends StatefulWidget {
  const Rentbikenow({Key? key}) : super(key: key);

  @override
  State<Rentbikenow> createState() => _RentbikenowState();
}

class _RentbikenowState extends State<Rentbikenow> {
  @override
  void initState() {
    getbikeonlinedata();
    getbikestatus();
    super.initState();
  }

  bool accepted1 = false;
  bool accepted2 = false;

  getbikestatus() async {
    DocumentSnapshot variable = await FirebaseFirestore.instance
        .collection('Renter-details')
        .doc(globalUseremail)
        .get();
    print("Bike-Status:-" + variable['Bike-Status'].toString());
  }

  getbikeonlinedata() async {
    DocumentSnapshot variable = await FirebaseFirestore.instance
        .collection('Renter-details')
        .doc(globalUseremail)
        .get();

    setState(() {
      bikestatus = variable['Bike-Status'];
      Renterkanaam = variable['Renter-Name'];
      Renterkaphone = variable['Renter-PhoneNumber'];
      Renterkaaddress = variable['Renter-Address'];
      Renterkaage = variable['Renter-Age'];
      RenterkaRegnumber = variable['Renter-BikeRegNumber'];
      Renterkachasisnumber = variable['Renter-ChasisNumber'];
      Renterkabikemodel = variable['Renter-BikeModel'];
      RenterkabikeNumber = variable['Renter-BikeNumber'];
      urenter2 = variable['Renter-Bike-Insurance'];
      urenter3 = variable['Renter-Pollution-Certificate'];
      Renterkaselfie = variable['Renter-Selfie'];
      RenterBikekaphoto = variable['Renter-Bike-Photo'];
      urenter1 = variable['Renter-Bike-RC'];
      RenterkaBikephotofilename = variable['Renter-Bike-Photo-FileName'];
      RenterkaSelfiefilename = variable['Renter-Selfie-FileName'];
      RenterkaRCfilename = variable['Renter-RC-FileName'];
      RenterkaInsurancefilename = variable['Renter-Bike-Insurance-FileName'];
      RenterkaPollutionfilename =
          variable['Renter-Pollution-Certificate-FileName'];
      IsRiderVerifiedBool = variable['IsVerified'];
    });
    profileimagepath = Renterkaselfie;
    renterbikeimg = RenterBikekaphoto;
  }

  bool bikestatus = false;
  String? profileimagepath = "";
  bool bikestatustorent = false;
  String? renterbikeimg = "";

  @override
  Widget build(BuildContext context) {
    final image = NetworkImage(profileimagepath.toString(), scale: 1.0);
    final bikeimage = NetworkImage(renterbikeimg.toString(), scale: 1.0);
    return Scaffold(
        backgroundColor: Colors.blue.shade900,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Bikgo-Renter-ID",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: Card(
                    shadowColor: Colors.amber,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: Colors.blue.shade900,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.verified,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Verified",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Text(
                              "Bikgo-Renter",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            ClipOval(
                              child: Ink.image(
                                  image: image,
                                  width: 150,
                                  height: 150,
                                  child: InkWell(
                                    onTap: () {},
                                  ),
                                  onImageError: (exception, stackTrace) {}),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      Renterkanaam,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.yellow),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      Renterkaaddress,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: Colors.yellow, fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ListTile(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Phone-Number",
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                Renterkaphone,
                                style: const TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Age",
                                style: TextStyle(
                                    color: Colors.yellow, fontSize: 18),
                              ),
                              Text(
                                Renterkaage,
                                style: const TextStyle(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          trailing: Image.asset(
                            'assets/Bikgo-Icon.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.yellow;
                          }
                          return Colors.yellow;
                        }),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, 'RenterViewUserDetails.id');
                      },
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.black,
                        size: 40,
                      ),
                      label: const Text(
                        "View-File",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 60,
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.yellow;
                                }
                                return Colors.yellow;
                              }),
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.yellow,
                                      title: const Text(
                                        'Confirm To Update',
                                        textAlign: TextAlign.center,
                                      ),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const [
                                            Text(
                                                "Upon confirming the existing Selfie will be deleted.",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                "The Renter must Upload the Selfie immediately, if not the Renter will be deleted from the Bikgo-App.",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: const Text('Accept',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            accepted1 = true;

                                            if (accepted1 == true) {
                                              deletephotosfromfirestoreofrenter();
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Deleted Previous Photos");
                                              Navigator.pushNamed(context,
                                                  'RenterUpdateUserPhotos.id');
                                            } else {
                                              Navigator.of(context).pop();
                                            }
                                          },
                                        ),
                                        TextButton(
                                          child: const Text('Deny',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            icon: const Icon(
                              Icons.photo_filter,
                              color: Colors.black,
                              size: 40,
                            ),
                            label: const Text(
                              "Update Selfie",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 60,
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.yellow;
                                }
                                return Colors.yellow;
                              }),
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.yellow,
                                      title: const Text(
                                        'Confirm To Update',
                                        textAlign: TextAlign.center,
                                      ),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const [
                                            Text(
                                                "Upon confirming the existing Details will be deleted.",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                "The Renter must Provide the Details immediately, if not the Renter will be deleted from the Bikgo-App.",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: const Text('Accept',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            accepted2 = true;
                                            if (accepted2 == true) {
                                              deletedetailsfromfirestoreofrenter();
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Deleted Previous Details!!");
                                              Navigator.pushNamed(context,
                                                  'RenterUpdateUserDetails.id');
                                            } else {
                                              Navigator.of(context).pop();
                                            }
                                          },
                                        ),
                                        TextButton(
                                          child: const Text('Deny',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            icon: const Icon(
                              Icons.description,
                              color: Colors.black,
                              size: 40,
                            ),
                            label: const Text(
                              "Update Details",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.black,
                thickness: 4.0,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Bikgo-Renter-Bike-ID",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  child: Card(
                    shadowColor: Colors.amber,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: Colors.blue.shade900,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.verified,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Verified",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              "Renter-Bike-ID",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Ink.image(
                            image: bikeimage,
                            width: 250,
                            height: 250,
                            child: InkWell(
                              onTap: () {},
                            ),
                            onImageError: (exception, stackTrace) {}),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Vehicle-Model",
                                          style: TextStyle(
                                              color: Colors.yellow,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          Renterkabikemodel,
                                          style: const TextStyle(
                                              color: Colors.yellow,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Vehicle-Number",
                                          style: TextStyle(
                                              color: Colors.yellow,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          RenterkabikeNumber,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.yellow,
                                              fontSize: 18),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.blue.shade900,
                                    child: Ink.image(
                                        image: image,
                                        width: 150,
                                        height: 150,
                                        child: InkWell(
                                          onTap: () {},
                                        ),
                                        onImageError:
                                            (exception, stackTrace) {}),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  "Rents",
                                  style: TextStyle(
                                      color: Colors.yellow, fontSize: 18),
                                ),
                                Text(
                                  "10",
                                  style: TextStyle(
                                      color: Colors.yellow,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Bike-Owner",
                                  style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  Renterkanaam,
                                  style: const TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            trailing: Image.asset(
                              'assets/Bikgo-Icon.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 60,
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.yellow;
                          }
                          return Colors.yellow;
                        }),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, 'RenterViewBikeDetails.id');
                      },
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.black,
                        size: 40,
                      ),
                      label: const Text(
                        "View-File",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 60,
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.yellow;
                                }
                                return Colors.yellow;
                              }),
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.yellow,
                                      title: const Text(
                                        'Confirm To Update',
                                        textAlign: TextAlign.center,
                                      ),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const [
                                            Text(
                                                "Upon confirming the existing photos will be deleted.",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                "The Renter must Upload the Photo and PDFs immediately, if not the Renter will be deleted from the Bikgo-App.",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: const Text('Accept',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            accepted1 = true;

                                            if (accepted1 == true) {
                                              deletephotosfromfirestoreofrenterbike();
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Deleted Previous Photos");
                                              Navigator.pushNamed(context,
                                                  'RenterUpdateBikePhotos.id');
                                            } else {
                                              Navigator.of(context).pop();
                                            }
                                          },
                                        ),
                                        TextButton(
                                          child: const Text('Deny',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            icon: const Icon(
                              Icons.file_present,
                              color: Colors.black,
                              size: 40,
                            ),
                            label: const Text(
                              "Update Files",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 60,
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Colors.yellow;
                                }
                                return Colors.yellow;
                              }),
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.yellow,
                                      title: const Text(
                                        'Confirm To Update',
                                        textAlign: TextAlign.center,
                                      ),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: const [
                                            Text(
                                                "Upon confirming the existing Details will be deleted.",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                "The Renter must Provide the Details immediately, if not the Renter will be deleted from the Bikgo-App.",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: const Text('Accept',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            accepted2 = true;
                                            if (accepted2 == true) {
                                              deletedetailsfromfirestoreofrenterbike();
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Deleted Previous Details!!");
                                              Navigator.pushNamed(context,
                                                  'RenterUpdateBikeDetails.id');
                                            } else {
                                              Navigator.of(context).pop();
                                            }
                                          },
                                        ),
                                        TextButton(
                                          child: const Text('Deny',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                            icon: const Icon(
                              Icons.description,
                              color: Colors.black,
                              size: 40,
                            ),
                            label: const Text(
                              "Update Details",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.black,
                thickness: 4.0,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Rent-Status",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    color: const Color(0xFFffcd3c),
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: SizedBox(
                      child: Column(children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                              "Slide The Rent-ON/OFF button to go Online or Offline",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SlideAction(
                                borderRadius: 12,
                                elevation: 0,
                                innerColor: Colors.yellow,
                                outerColor: Colors.blue.shade900,
                                sliderButtonIcon: const Icon(
                                  Icons.directions_bike,
                                  color: Colors.black,
                                  size: 28,
                                ),
                                sliderRotate: false,
                                text: (bikestatus)
                                    ? 'Slide To Rent-OFF'
                                    : 'Slide To Rent-ON',
                                textStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow),
                                onSubmit: () {
                                  bikestatustorent = !bikestatus;
                                  print(bikestatustorent);
                                  DocumentReference users = FirebaseFirestore
                                      .instance
                                      .collection('Renter-details')
                                      .doc(globalUseremail);
                                  users.set({
                                    'Renter-Name': Renterkanaam,
                                    'Renter-PhoneNumber': Renterkaphone,
                                    'Renter-Address': Renterkaaddress,
                                    'Renter-Age': Renterkaage,
                                    'Renter-BikeModel': Renterkabikemodel,
                                    'Renter-BikeNumber': RenterkabikeNumber,
                                    'Email': globalUseremail,
                                    'Renter-Bike-Insurance': urenter2,
                                    'Renter-ChasisNumber': Renterkachasisnumber,
                                    'Renter-BikeRegNumber': RenterkaRegnumber,
                                    'Renter-Pollution-Certificate': urenter3,
                                    'Renter-Selfie': Renterkaselfie,
                                    'Renter-Bike-Photo': RenterBikekaphoto,
                                    'Renter-Bike-RC': urenter1,
                                    'Renter-Bike-Photo-FileName':
                                        RenterkaBikephotofilename,
                                    'Renter-Selfie-FileName':
                                        RenterkaSelfiefilename,
                                    'Renter-RC-FileName': RenterkaRCfilename,
                                    'Renter-Bike-Insurance-FileName':
                                        RenterkaInsurancefilename,
                                    'Renter-Pollution-Certificate-FileName':
                                        RenterkaPollutionfilename,
                                    'IsVerified': "True",
                                    'Bike-Status': bikestatustorent,
                                    'Renter-Longitude':
                                        (bikestatustorent == true)
                                            ? renterlongitude
                                            : "Longitude-Off",
                                    'Renter-Latitude':
                                        (bikestatustorent == true)
                                            ? renterlatitude
                                            : "Latitude-Off",
                                  });

                                  if (bikestatus == true) {
                                    DocumentReference rents = FirebaseFirestore
                                        .instance
                                        .collection('Available-Online-Rents')
                                        .doc(globalUseremail);
                                    rents.delete();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.location_off,
                                            size: 32,
                                            color: Colors.black,
                                          ),
                                          SizedBox(width: 16),
                                          Expanded(
                                              child: Text(
                                                  'Bike-Offline-To-Relax',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black)))
                                        ],
                                      ),
                                      backgroundColor: Colors.red,
                                      duration: const Duration(seconds: 4),
                                      shape: const StadiumBorder(),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 12),
                                      behavior: SnackBarBehavior.floating,
                                      elevation: 0,
                                    ));
                                  } else {
                                    DocumentReference rents = FirebaseFirestore
                                        .instance
                                        .collection('Available-Online-Rents')
                                        .doc(globalUseremail);
                                    rents.set({
                                      'Online-Renter': globalUseremail,
                                      'Renter-Longitude': renterlongitude,
                                      'Renter-Latitude': renterlatitude,
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.location_on,
                                            size: 32,
                                            color: Colors.black,
                                          ),
                                          SizedBox(width: 16),
                                          Expanded(
                                              child: Text('Bike-Online-To-Rent',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black)))
                                        ],
                                      ),
                                      backgroundColor: Colors.green,
                                      duration: const Duration(seconds: 4),
                                      shape: const StadiumBorder(),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 12),
                                      behavior: SnackBarBehavior.floating,
                                      elevation: 0,
                                    ));
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                  )),
            ],
          ),
        ));
  }

  deletedetailsfromfirestoreofrenter() async {
    DocumentReference users = FirebaseFirestore.instance
        .collection('Renter-details')
        .doc(globalUseremail);
    await users.set({
      'Bike-Status': bikestatus,
      'Renter-Name': Renterkanaam,
      'Renter-PhoneNumber': "",
      'Renter-Address': "",
      'Renter-Age': Renterkaage,
      'Renter-BikeModel': Renterkabikemodel,
      'Renter-BikeNumber': RenterkabikeNumber,
      'Email': globalUseremail,
      'Renter-ChasisNumber': Renterkachasisnumber,
      'Renter-BikeRegNumber': RenterkaRegnumber,
      'Renter-Bike-Insurance': urenter2,
      'Renter-Pollution-Certificate': urenter3,
      'Renter-Selfie': Renterkaselfie,
      'Renter-Bike-Photo': RenterBikekaphoto,
      'Renter-Bike-RC': urenter1,
      'IsVerified': IsRiderVerifiedBool,
      'Renter-Bike-Photo-FileName': RenterkaBikephotofilename,
      'Renter-Selfie-FileName': RenterkaSelfiefilename,
      'Renter-RC-FileName': RenterkaRCfilename,
      'Renter-Bike-Insurance-FileName': RenterkaInsurancefilename,
      'Renter-Pollution-Certificate-FileName': RenterkaPollutionfilename
    });
  }

  deletephotosfromfirestoreofrenter() async {
    DocumentReference users = FirebaseFirestore.instance
        .collection('Renter-details')
        .doc(globalUseremail);
    await users.set({
      'Bike-Status': bikestatus,
      'Renter-Name': Renterkanaam,
      'Renter-PhoneNumber': Renterkaphone,
      'Renter-Address': Renterkaaddress,
      'Renter-Age': Renterkaage,
      'Renter-BikeModel': Renterkabikemodel,
      'Renter-BikeNumber': RenterkabikeNumber,
      'Email': globalUseremail,
      'Renter-ChasisNumber': Renterkachasisnumber,
      'Renter-BikeRegNumber': RenterkaRegnumber,
      'Renter-Bike-Insurance': urenter2,
      'Renter-Pollution-Certificate': urenter3,
      'Renter-Selfie': "",
      'Renter-Bike-Photo': RenterBikekaphoto,
      'Renter-Bike-RC': urenter1,
      'IsVerified': IsRiderVerifiedBool,
      'Renter-Bike-Photo-FileName': RenterkaBikephotofilename,
      'Renter-Selfie-FileName': "",
      'Renter-RC-FileName': RenterkaRCfilename,
      'Renter-Bike-Insurance-FileName': RenterkaInsurancefilename,
      'Renter-Pollution-Certificate-FileName': RenterkaPollutionfilename
    });
  }

  deletephotosfromfirestoreofrenterbike() async {
    DocumentReference users = FirebaseFirestore.instance
        .collection('Renter-details')
        .doc(globalUseremail);
    await users.set({
      'Bike-Status': bikestatus,
      'Renter-Name': Renterkanaam,
      'Renter-PhoneNumber': Renterkaphone,
      'Renter-Address': Renterkaaddress,
      'Renter-Age': Renterkaage,
      'Renter-BikeModel': Renterkabikemodel,
      'Renter-BikeNumber': RenterkabikeNumber,
      'Email': globalUseremail,
      'Renter-ChasisNumber': Renterkachasisnumber,
      'Renter-BikeRegNumber': RenterkaRegnumber,
      'Renter-Bike-Insurance': "",
      'Renter-Pollution-Certificate': "",
      'Renter-Selfie': Renterkaselfie,
      'Renter-Bike-Photo': "",
      'Renter-Bike-RC': "",
      'IsVerified': IsRiderVerifiedBool,
      'Renter-Bike-Photo-FileName': "",
      'Renter-Selfie-FileName': RenterkaSelfiefilename,
      'Renter-RC-FileName': "",
      'Renter-Bike-Insurance-FileName': "",
      'Renter-Pollution-Certificate-FileName': ""
    });
  }

  deletedetailsfromfirestoreofrenterbike() async {
    DocumentReference users = FirebaseFirestore.instance
        .collection('Renter-details')
        .doc(globalUseremail);
    await users.set({
      'Bike-Status': bikestatus,
      'Renter-Name': Renterkanaam,
      'Renter-PhoneNumber': Renterkaphone,
      'Renter-Address': Renterkaaddress,
      'Renter-Age': Renterkaage,
      'Renter-BikeModel': "",
      'Renter-BikeNumber': "",
      'Email': globalUseremail,
      'Renter-ChasisNumber': "",
      'Renter-BikeRegNumber': "",
      'Renter-Bike-Insurance': urenter2,
      'Renter-Pollution-Certificate': urenter3,
      'Renter-Selfie': Renterkaselfie,
      'Renter-Bike-Photo': RenterBikekaphoto,
      'Renter-Bike-RC': urenter1,
      'IsVerified': IsRiderVerifiedBool,
      'Renter-Bike-Photo-FileName': RenterkaBikephotofilename,
      'Renter-Selfie-FileName': RenterkaSelfiefilename,
      'Renter-RC-FileName': RenterkaRCfilename,
      'Renter-Bike-Insurance-FileName': RenterkaInsurancefilename,
      'Renter-Pollution-Certificate-FileName': RenterkaPollutionfilename
    });
  }
}
