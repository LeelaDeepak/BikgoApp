import 'package:bigkoapp/globaldetails.dart';
import 'package:flutter/material.dart';

class TripBillforisfuel extends StatefulWidget {
  const TripBillforisfuel({Key? key}) : super(key: key);

  @override
  State<TripBillforisfuel> createState() => _TripBillforisfuelState();
}

class _TripBillforisfuelState extends State<TripBillforisfuel> {
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
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "Final-Trip-Bill",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Colors.yellow),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 50,
                      child: Card(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Transaction-ID :- $RFRID",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: Card(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Generated Trip-Amount :- $rent Rs",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
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
                        "Select Payment Method",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.yellow),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildScreenIcon1(Icons.money),
                        const SizedBox(
                          width: 40,
                        ),
                        buildScreenIcon2(Icons.payment),
                        const SizedBox(
                          width: 40,
                        ),
                        buildScreenIcon3(Icons.mobile_friendly),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ]),
            )));
  }

  Widget buildScreenIcon1(IconData iconData) => Column(
        children: [
          CircleAvatar(
              radius: 35,
              child: Center(
                child: IconButton(
                  icon: Icon(iconData),
                  iconSize: 32,
                  color: Colors.yellow,
                  onPressed: () {
                    Navigator.pushNamed(
                        context, 'cashpaymentbyriderwithfuel.id');
                  },
                ),
              )),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "CASH",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
                fontSize: 18),
          )
        ],
      );

  Widget buildScreenIcon2(IconData iconData) => Column(
        children: [
          CircleAvatar(
              radius: 35,
              child: Center(
                child: IconButton(
                  icon: Icon(iconData),
                  iconSize: 32,
                  color: Colors.yellow,
                  onPressed: () {},
                ),
              )),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "CARD",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
                fontSize: 18),
          )
        ],
      );

  Widget buildScreenIcon3(IconData iconData) => Column(
        children: [
          CircleAvatar(
              radius: 35,
              child: Center(
                child: IconButton(
                  icon: Icon(iconData),
                  color: Colors.yellow,
                  iconSize: 32,
                  onPressed: () {},
                ),
              )),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "UPI",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
                fontSize: 18),
          )
        ],
      );
}
