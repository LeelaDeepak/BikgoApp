import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
        body: SingleChildScrollView(
            child: Column(children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              'About The App',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.yellow),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 250,
            width: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: SizedBox.fromSize(
                size: const Size.fromRadius(48),
                child: Image.asset(
                  "assets/Bikgo-Icon.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              'Main Idea:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Container(
                  alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.all(2),
                    child: Text(
                      "The main idea is to provide a mobile platform for people who want to rent a bike and ride a bike at their convenience. The Users of this App are the renter and the rider.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              'Role Of Renter:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Container(
                  alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "A renter is a person who can utilize the parking time of a bike to make money. The renter will receive the rental requests from the riders, which the renter can accept or reject. When it is accepted, the renter can have an online conversation about the ride details. On acceptance of the request, handover the bike for the ride. After completion of the ride, collect the bike and the rental amount.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              'Role Of Rider:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Container(
                  alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "A rider is a person who wants a bike for a longer ride to have an amusing trip by covering desired places. The rider can find a nearby bike and request a ride. It will be connected to the renter to have an online conversation about the ride details. Then the rider can collect the bike and go for a ride. After completing the trip, the rider makes the payment and hands over the bike.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              '360° value of Bikgo:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Container(
                  alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.all(8.5),
                    child: Text(
                      "1)The bike renters can earn money during their unused time.\n2)The bike riders can have an amusing ride by having a trip of their choice.\n3)The idea provides a convenient platform for renters and riders to meet their objectives.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              'Benefits of Bikgo:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Container(
                  alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.all(8.5),
                    child: Text(
                      "This App is used to provide a platform for the following:-\n1)The bike owners who want to earn money by renting their bikes during their unused time.\n2)People who do not have bikes but want to go for a ride on a rental basis.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              'Uniqueness of Bikgo:',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Container(
                  alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.all(8.5),
                    child: Text(
                      "1)The renter can earn extra income during the bike's unused time.\n2)The rider can have a comfortable and friendly ride.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Ink(
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: const BorderSide(color: Colors.white)),
                  color: Colors.blue.shade900,
                  elevation: 38,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "For Any Queries, Contact by: developerdeepak123@gmail.com",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Open Sans',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            color: Colors.blue.shade900,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(color: Colors.white)),
            elevation: 38,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ListTile(
                  leading: Icon(
                    Icons.person_pin,
                    size: 50,
                    color: Colors.yellow,
                  ),
                  title: Text('Designed and Developed By:',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0)),
                  subtitle: Text(
                    'Leela Deepak',
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            color: Colors.blue.shade900,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(color: Colors.white)),
            elevation: 38,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: const [
                      Text(
                        "Managed By:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.yellow, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Kamalnath",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.design_services_outlined,
                        color: Colors.yellow,
                        size: 50,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: const [
                      Text(
                        "Idea By:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.yellow, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Ajay Chandra",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.light_rounded,
                        color: Colors.yellow,
                        size: 50,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ])),
      ),
    );
  }
}
