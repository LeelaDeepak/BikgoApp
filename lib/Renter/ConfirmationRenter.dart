import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ConfirmRenterWithInstructions extends StatefulWidget {
  const ConfirmRenterWithInstructions({Key? key}) : super(key: key);

  @override
  State<ConfirmRenterWithInstructions> createState() =>
      _ConfirmRenterWithInstructionsState();
}

class _ConfirmRenterWithInstructionsState
    extends State<ConfirmRenterWithInstructions> {
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
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: IconButton(
                    alignment: Alignment.centerLeft,
                    color: Colors.white,
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, 'UploadRenterInstructions.id');
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    " Let's Start",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.yellow),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    " The Registration",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.yellow),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    " For Renter!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.yellow),
                  ),
                ),
                SizedBox(
                  height: 350,
                  width: 350,
                  child: Lottie.asset('assets/StartRegistration.json'),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 90,
                  width: 300,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.black;
                          }
                          return Colors.black;
                        }),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'RenterBike.id');
                      },
                      child: const Text(
                        "Start-Registration",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.yellow),
                      )),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
