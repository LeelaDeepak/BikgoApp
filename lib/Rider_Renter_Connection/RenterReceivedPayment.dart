import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RenterGotPaid extends StatefulWidget {
  const RenterGotPaid({Key? key}) : super(key: key);

  @override
  State<RenterGotPaid> createState() => _RenterGotPaidState();
}

class _RenterGotPaidState extends State<RenterGotPaid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        title: const Text("Rental-Amount-Received"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.yellow, fontSize: 20),
        backgroundColor: Colors.blue.shade900,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Lottie.asset('assets/CashPaid.json'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
