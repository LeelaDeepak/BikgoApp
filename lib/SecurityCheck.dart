import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SecurityCheck extends StatefulWidget {
  const SecurityCheck({Key? key}) : super(key: key);

  @override
  State<SecurityCheck> createState() => _SecurityCheckState();
}

class _SecurityCheckState extends State<SecurityCheck> {
  final q1Controller = TextEditingController();
  final q2Controller = TextEditingController();
  final bikgomail = TextEditingController();
  bool userisallowed = false;
  String useremail = "";

  @override
  void initState() {
    super.initState();
  }

  void fetchdataofuser() async {
    DocumentSnapshot imageref = await FirebaseFirestore.instance
        .collection("SignUpDetails")
        .doc("${bikgomail.text.trim()}@Bikgo.com")
        .get();
    print(imageref['Q1-BornCity']);
    print(imageref['Q2-Firstjobplace']);
    print(imageref['Personal-Email']);

    if (q1Controller.text.toLowerCase() == imageref['Q1-BornCity'] &&
        (q2Controller.text.toLowerCase() == imageref['Q2-Firstjobplace'])) {
      print("User Allowed to view Recovery Mail ID");
      setState(() {
        userisallowed = true;
        useremail = imageref['Personal-Email'];
      });
    } else {
      print("User Not Allowed to view Recovery Mail ID");
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
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: IconButton(
                alignment: Alignment.centerLeft,
                color: Colors.white,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushNamed(context, 'ForgetPassword.id');
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: 370,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Bikgo-ID',
                      suffixText: "@Bikgo.com",
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    controller: bikgomail,
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ),
            ),
            const Text(
              "Answer The Security Questions",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 370,
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'What city were you born in?',
                            prefixIcon: Icon(
                              Icons.location_city,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          controller: q1Controller,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 370,
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'In what city was your first job?',
                            prefixIcon: Icon(
                              Icons.work,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                          ),
                          controller: q2Controller,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            (userisallowed)
                ? Text(
                    "Recovery-Mail = " + useremail,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold),
                  )
                : const Text("Not Verified",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold))
          ],
        )),
        bottomSheet: Container(
          decoration: const BoxDecoration(),
          height: 90,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.black26;
                  }
                  return Colors.black87;
                }),
              ),
              onPressed: () {
                if (bikgomail.text != "" &&
                    q1Controller.text.toLowerCase() != "" &&
                    q2Controller.text.toLowerCase() != "") {
                  print("Okay");
                  fetchdataofuser();
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
                            child: Text('Enter Details to Verify',
                                style: TextStyle(
                                  fontSize: 20,
                                )))
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
                "Verify-Owner",
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
