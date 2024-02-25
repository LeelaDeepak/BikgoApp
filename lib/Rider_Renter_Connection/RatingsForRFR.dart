import 'package:bigkoapp/Google_Maps/map_key.dart';
import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:slide_to_act/slide_to_act.dart';

class RatingsForRide extends StatefulWidget {
  const RatingsForRide({Key? key}) : super(key: key);

  @override
  State<RatingsForRide> createState() => _RatingsForRideState();
}

class _RatingsForRideState extends State<RatingsForRide> {
  double RFRRating = 0.0;
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: AppBar(
          title: const Text("Trip-Rating"),
          centerTitle: true,
          automaticallyImplyLeading: false,
          titleTextStyle: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.yellow, fontSize: 20),
          backgroundColor: Colors.blue.shade900,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Kindly Give the Overall Rating of the Trip Experience with the Bike on The Scale of Five Stars",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold),
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Trip-Rating: $RFRRating",
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              RatingBar.builder(
                  initialRating: RFRRating,
                  minRating: 1,
                  updateOnDrag: true,
                  itemSize: 60,
                  itemBuilder: ((context, _) => const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      )),
                  onRatingUpdate: ((rating) => setState(() {
                        RFRRating = rating;
                      }))),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SlideAction(
                    borderRadius: 12,
                    elevation: 0,
                    innerColor: Colors.yellow,
                    outerColor: Colors.black,
                    sliderButtonIcon: const Icon(
                      Icons.directions_bike_sharp,
                      color: Colors.black,
                      size: 28,
                    ),
                    sliderRotate: false,
                    text: 'Finished-Rating',
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow),
                    onSubmit: () {
                      print("Rental-Started");
                      DocumentReference users = FirebaseFirestore.instance
                          .collection('RFR-Transactions')
                          .doc("RFR${date.day}${date.month}${date.year}0");
                      users.set({
                        'RFRDocLength': doclengthofRFR,
                        'ShareRenterLocationtoRider': true,
                        'RFRID': "RFR${date.day}${date.month}${date.year}0",
                        'Trip-Date':
                            "${date.day} / ${date.month} / ${date.year}",
                        'Renter-Address': presentAddressofuser,
                        'Rental-Status': "Ended",
                        'Renter-Location': sourceLocation.toString(),
                        'Rider-Location': finaldestination.toString(),
                        'Renter-PhoneNumber': phonenumberofrentertocall,
                        'Rider-PhoneNumber': phonenumberofridertocall,
                        'RiderReachedToRenter': true,
                        'RenterVerifiedRiderReached': true,
                        'Rider-Undertaking': true,
                        'Renter-Undertaking': true,
                        'Rental-Duration': rentalduration,
                        'Rental-Description': reasonforrental,
                        'Check-Bike-To-Rent-By-Rider': true,
                        'Bike-Receieved-To-Start-Trip': true,
                        'End-Trip-By-Rider': true,
                        'End-Trip-By-Renter': true,
                        'Start-Trip-By-Rider': true,
                        'Start-Trip-By-Renter': true,
                        'Vehicle-Name': gaadiname,
                        'Renter-Name': globalUseremail,
                        'Rider-Name': myriderchater,
                        'Vehicle-No': gaadinumber,
                        'Rental-Amount': rentalamount,
                        'Rental-Ratings': RFRRating.toString(),
                        'Check-Bike-After-Rental-Renter': true,
                        'Rider-Paid-Amount': true,
                        'Payment-Done': true,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.thumb_up,
                              size: 32,
                              color: Colors.black,
                            ),
                            SizedBox(width: 16),
                            Expanded(
                                child: Text(
                                    'Thank You Rider, Do Use The App whenever Needed,Have a Nice Day!',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    )))
                          ],
                        ),
                        backgroundColor: Colors.yellow,
                        duration: const Duration(seconds: 3),
                        shape: const StadiumBorder(),
                        margin: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 12),
                        behavior: SnackBarBehavior.floating,
                        elevation: 0,
                      ));
                      Navigator.pushNamed(context, 'RiderTabs.id');
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
