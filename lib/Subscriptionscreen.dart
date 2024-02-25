import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
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
                height: 30,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: IconButton(
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushNamed(context, 'Customer.id');
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Available Subscriptions",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: Card(
                    shadowColor: Colors.white,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(16)),
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text("Plus-Subscription",
                            style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 30,
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
                              "Active",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Text(
                              "Bikgo-Plus (+)",
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Colors.white)),
                              child: Image.asset("assets/Bikgo-Plus.png")),
                        ),
                        Column(
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "Benefits Of Bikgo-Plus",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.yellow,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ListTile(
                                  leading: MyBullet(),
                                  title: const Text(
                                    "3 limited Rides per Month",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(1, 0, 9, 0),
                                ),
                                ListTile(
                                  leading: MyBullet(),
                                  title: const Text(
                                    "3 limited Rents per Month",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(1, 0, 9, 0),
                                )
                              ],
                            ),
                            const Text(
                              "PLUS-Price: 300Rs/-",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.yellow,
                              ),
                            ),
                            const Text(
                              "(Per Month)",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.yellow,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 80,
                          width: 350,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return Colors.yellow;
                                    }
                                    return Colors.yellow;
                                  }),
                                ),
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.done,
                                          color: Colors.yellow,
                                          size: 32,
                                        ),
                                        SizedBox(width: 16),
                                        Expanded(
                                            child: Text(
                                                'Subscription-Request Sent',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.yellow)))
                                      ],
                                    ),
                                    backgroundColor: Colors.blue.shade900,
                                    duration: const Duration(seconds: 2),
                                    shape: const StadiumBorder(),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 12),
                                    behavior: SnackBarBehavior.floating,
                                    elevation: 0,
                                  ));
                                },
                                child: const Text(
                                  "Subscribe To PLUS",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                )),
                          ),
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
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: Card(
                      shadowColor: Colors.white,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(16)),
                      color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text("Star-Subscription",
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: const [
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Best",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              Text(
                                "Bikgo-Star (★)",
                                style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2, color: Colors.white)),
                                child: Image.asset("assets/Bikgo-Star.png")),
                          ),
                          Column(
                            children: [
                              Column(
                                children: [
                                  const Text(
                                    "Benefits Of Bikgo-STAR",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ListTile(
                                    leading: MyBullet(),
                                    title: const Text(
                                      "Unlimited Rides per Month",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(1, 0, 9, 0),
                                  ),
                                  ListTile(
                                    leading: MyBullet(),
                                    title: const Text(
                                      "Unlimited Rents per Month",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                    contentPadding:
                                        const EdgeInsets.fromLTRB(1, 0, 9, 0),
                                  )
                                ],
                              ),
                              const Text(
                                "STAR-Price: 800Rs/-",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.yellow,
                                ),
                              ),
                              const Text(
                                "(Per Month)",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.yellow,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 80,
                            width: 350,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith<
                                            Color>((Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.pressed)) {
                                        return Colors.yellow;
                                      }
                                      return Colors.yellow;
                                    }),
                                  ),
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.done,
                                            color: Colors.yellow,
                                            size: 32,
                                          ),
                                          SizedBox(width: 16),
                                          Expanded(
                                              child: Text(
                                                  'Subscription-Request Sent',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.yellow)))
                                        ],
                                      ),
                                      backgroundColor: Colors.blue.shade900,
                                      duration: const Duration(seconds: 2),
                                      shape: const StadiumBorder(),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 12),
                                      behavior: SnackBarBehavior.floating,
                                      elevation: 0,
                                    ));
                                  },
                                  child: const Text(
                                    "Subscribe To STAR",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              const SizedBox(
                height: 20,
              )
            ],
          ))),
    );
  }

  Widget MyBullet() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
      child: Container(
        height: 13.0,
        width: 13.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
