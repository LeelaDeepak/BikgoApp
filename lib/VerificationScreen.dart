import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              const SizedBox(
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Your Details are under verification, we will let you know within few hours.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.yellow),
                ),
              ),
              Container(
                child: Lottie.asset('assets/updatedpendingverification.json'),
              ),
              SizedBox(
                height: 70,
                width: 300,
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.thumb_up,
                    color: Colors.yellow,
                    size: 30,
                  ),
                  label: const Text(
                    "Done",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.black;
                      }
                      return Colors.black;
                    }),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'Customer.id');
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
