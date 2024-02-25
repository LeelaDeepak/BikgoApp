import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RenterHistory extends StatefulWidget {
  const RenterHistory({Key? key}) : super(key: key);

  @override
  State<RenterHistory> createState() => _RenterHistoryState();
}

class _RenterHistoryState extends State<RenterHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(
          height: 40,
        ),
        Center(
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Rents-History",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              "Renter",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ClipOval(
                              child: Material(
                                color: Colors.white,
                                child: Ink.image(
                                  image: AssetImage("assets/random3.png"),
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                  child: InkWell(onTap: () {}),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              "Rider",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ClipOval(
                              child: Material(
                                color: Colors.white,
                                child: Ink.image(
                                  image: const AssetImage("assets/random2.png"),
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                  child: InkWell(onTap: () {}),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.black)),
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Vehicle-Name \n Pulsar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.black)),
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Vehicle-No \n TS 6675 HN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.black)),
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Rent-Amount \n 850Rs",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.black)),
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Rent-Duration \n  6Hrs",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.black)),
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Any-Problems \n No",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.black)),
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Problem \n Nothing",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Column(
                      children: [
                        Text(
                          "Rating",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "4.0",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    title: Column(
                      children: const [
                        Text(
                          "Rental-Date",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "20/02/2023",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    trailing: Image.asset(
                      'assets/Bikgo-Icon.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            )),
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              "Renter",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ClipOval(
                              child: Material(
                                color: Colors.white,
                                child: Ink.image(
                                  image: AssetImage("assets/random1.jpg"),
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                  child: InkWell(onTap: () {}),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              "Rider",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ClipOval(
                              child: Material(
                                color: Colors.white,
                                child: Ink.image(
                                  image: const AssetImage("assets/random5.png"),
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                  child: InkWell(onTap: () {}),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.black)),
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Vehicle-Name \n Splender",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.black)),
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Vehicle-No \n TS 7630 OF",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.black)),
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Rent-Amount \n 750Rs",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.black)),
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Rent-Duration \n  12Hrs",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.black)),
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Any-Problems \n No",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 3, color: Colors.black)),
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          "Problem \n Nothing",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    leading: Column(
                      children: [
                        Text(
                          "Rating",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "3.0",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    title: Column(
                      children: const [
                        Text(
                          "Rental-Date",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "22/02/2023",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    trailing: Image.asset(
                      'assets/Bikgo-Icon.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ))
      ])),
    );
  }
}
