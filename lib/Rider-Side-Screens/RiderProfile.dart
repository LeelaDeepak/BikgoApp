import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RiderProfileTab extends StatefulWidget {
  const RiderProfileTab({Key? key}) : super(key: key);

  @override
  State<RiderProfileTab> createState() => _RiderProfileTabState();
}

class _RiderProfileTabState extends State<RiderProfileTab> {
  String? profileimagepath = "";
  String username = "";
  String rideradd = "";
  String riderage = "";
  String riderlic = "";
  String riderph = "";
  String riderem = "";
  bool accepted1 = false;
  bool accepted2 = false;
  String riderbacklicfilename = "";
  String riderfrontlicfilename = "";
  String riderselfiefilename = "";
  String riderfrontlic = "";
  String riderbacklic = "";
  String riderselfie = "";

  @override
  void initState() {
    getUserprofileimage();
    super.initState();
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
    final image = NetworkImage(profileimagepath.toString(), scale: 1.0);
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
                "Bikgo-Rider-ID",
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
                            "Bikgo-Rider",
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
                                    username,
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
                                    rideradd,
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
                              riderph,
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
                              style:
                                  TextStyle(color: Colors.yellow, fontSize: 18),
                            ),
                            Text(
                              riderage,
                              style: const TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
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
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.yellow;
                        }
                        return Colors.yellow;
                      }),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'RiderViewDetails.id');
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                              "The Rider must Upload the Photos immediately, if not the Rider will be deleted from the Bikgo-App.",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: const Text(
                                          'Accept',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () {
                                          accepted1 = true;

                                          if (accepted1 == true) {
                                            deletephotosfromfirestore();
                                            Fluttertoast.showToast(
                                                msg: "Deleted Previous Photos");
                                            Navigator.pushNamed(context,
                                                'RiderUpdatePhotos.id');
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
                            Icons.photo,
                            color: Colors.black,
                            size: 40,
                          ),
                          label: const Text(
                            "Update Photos",
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
                                    title: const Text('Confirm To Update'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: const [
                                          Text(
                                              "Upon confirming the existing Details will be deleted.",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              "The Rider must Provide the Details immediately, if not the Rider will be deleted from the Bikgo-App.",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
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
                                            deletedetailsfromfirestore();
                                            Fluttertoast.showToast(
                                                msg:
                                                    "Deleted Previous Details!!");
                                            Navigator.pushNamed(context,
                                                'RiderUpdateDetails.id');
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
          ],
        ),
      ),
    );
  }

  deletedetailsfromfirestore() async {
    DocumentReference users = FirebaseFirestore.instance
        .collection('Rider-details')
        .doc(globalUseremail);
    await users.set({
      'Rider-Name': username,
      'Rider-PhoneNumber': "",
      'Rider-Address': "",
      'Rider-Age': riderage,
      'IsVerified': "True",
      'License-No': "",
      'Email': globalUseremail,
      'Rider-License-Back': riderbacklic,
      'Rider-License-Front': riderfrontlic,
      'Rider-Selfie': riderselfie,
      'Rider-Front-License-FileName': riderfrontlicfilename,
      'Rider-Back-License-FileName': riderbacklicfilename,
      'Rider-Selfie-FileName': riderselfiefilename
    });
  }

  deletephotosfromfirestore() async {
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
      'Rider-License-Back': "",
      'Rider-License-Front': "",
      'Rider-Selfie': "",
      'Rider-Front-License-FileName': "",
      'Rider-Back-License-FileName': "",
      'Rider-Selfie-FileName': ""
    });
  }
}
