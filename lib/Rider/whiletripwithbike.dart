import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:location/location.dart';

class Whiletripwithbike extends StatefulWidget {
  const Whiletripwithbike({Key? key}) : super(key: key);

  @override
  State<Whiletripwithbike> createState() => _WhiletripwithbikeState();
}

class _WhiletripwithbikeState extends State<Whiletripwithbike> {
  String Locationofrider = "";
  TimeOfDay time = TimeOfDay.now();
  TimeOfDay ftime = TimeOfDay.now();
  @override
  void initState() {
    super.initState();
    _initLocationService();
  }

  Future _initLocationService() async {
    var location = Location();

    if (!await location.serviceEnabled()) {
      if (!await location.requestService()) {
        return;
      }
    }

    var permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission != PermissionStatus.granted) {
        return;
      }
    }

    var loc = await location.getLocation();
    print("${loc.latitude} ${loc.longitude}");
    location.onLocationChanged.listen((LocationData loc) {
      print("changing location :${loc.latitude} ${loc.longitude}");
      Locationofrider =
          loc.latitude.toString() + "," + loc.longitude.toString();
    });
  }

  void getriderlocation() async {
    var location = Location();
    var loc = await location.getLocation();
    String riderlocation =
        "https://www.google.com/maps/search/?api=1&query=${loc.latitude},${loc.longitude}";
    print("riderlocation:${loc.latitude},${loc.longitude}");
    var url = Uri.parse(
        "whatsapp://send?phone=$Renterkaphone&text=My current location is $riderlocation");
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
                    child:
                        Text('Sorry, Cannot Share location to the Renter now',
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
    var url =
        Uri.parse("whatsapp://send?phone=$Renterkaphone&text=I want your help");
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                "Rider Driving",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.yellow),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                "Section!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.yellow),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 300,
                width: 300,
                child: Lottie.asset('assets/whiletrip.json'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildScreenIcon1(Icons.call),
                const SizedBox(
                  width: 12,
                ),
                buildScreenIcon2(Icons.message),
                const SizedBox(
                  width: 12,
                ),
                buildScreenIcon3(Icons.location_on),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 85,
                width: 300,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  icon: const Icon(
                    Icons.water_drop_rounded,
                    size: 40,
                    color: Colors.yellow,
                  ),
                  label: const Text(
                    "Fill-Fuel",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'checkfuelbill.id');
                  },
                )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 85,
                width: 300,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  icon: const Icon(
                    Icons.done,
                    size: 40,
                    color: Colors.yellow,
                  ),
                  label: const Text(
                    "Trip-Completed",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow),
                  ),
                  onPressed: () {
                    var currentdate = DateTime.now();
                    final hours = time.hour.toString().padLeft(2, '0');
                    final minutes = time.minute.toString().padLeft(2, '0');
                    final fhours = ftime.hour.toString().padLeft(2, '0');
                    final fminutes = ftime.minute.toString().padLeft(2, '0');
                    DocumentReference users = FirebaseFirestore.instance
                        .collection('RFR-Transactions')
                        .doc(Renterkaemail);
                    users.set({
                      'Actual-Duration-Of-Time': "$ridehours Hours",
                      'Minimum-Fuel-Flag': "False",
                      'Paid-Amount': "",
                      'RFR-ID': RFRID,
                      'Reduced-Amount': "$reducedamount-Rs",
                      'Rent Amount': "$rentamount-Rs",
                      'Renter-Acceptance': "True",
                      'Renter-Email-ID': Renterkaemail,
                      'Requested-Duration-Of-Time': "$ridehours Hours",
                      'Ride-End-Date-And-Time':
                          "Date:-$tripdaterider Time:-$rideendtime",
                      'Ride-Start-Date-And-Time':
                          "Date:-$tripdaterider Time:-$ridestarttime",
                      'Rider-Email-ID': globalUseremail,
                      'Rider-Bike-Collected': "True",
                      'Renter-Side-Bike-Taken': "True",
                      'Trip-Status': "Trip-Ended"
                    });
                    print("Updated to firestore");
                    print("Generating Bill");
                    Navigator.pushNamed(context, 'Billtorider.id');
                  },
                )),
            const SizedBox(
              height: 30,
            )
          ],
        )),
      ),
    );
  }

  Widget buildScreenIcon1(IconData iconData) => CircleAvatar(
      radius: 35,
      child: Center(
        child: IconButton(
          icon: Icon(iconData),
          iconSize: 32,
          onPressed: () {
            _makingPhoneCall(context);
          },
        ),
      ));

  Widget buildScreenIcon2(IconData iconData) => CircleAvatar(
      radius: 35,
      child: Center(
        child: IconButton(
          icon: Icon(iconData),
          iconSize: 32,
          onPressed: () {
            launchWhatsApp(context);
          },
        ),
      ));

  Widget buildScreenIcon3(IconData iconData) => CircleAvatar(
      radius: 35,
      child: Center(
        child: IconButton(
          icon: Icon(iconData),
          iconSize: 32,
          onPressed: () {
            print("Sharing Location");
            print(Locationofrider);
            getriderlocation();
          },
        ),
      ));
}
