import 'package:bigkoapp/globaldetails.dart';
import 'package:flutter/material.dart';

class Clearbikeview extends StatefulWidget {
  const Clearbikeview({Key? key}) : super(key: key);

  @override
  State<Clearbikeview> createState() => _ClearbikeviewState();
}

class _ClearbikeviewState extends State<Clearbikeview> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("View-Bike"),
          backgroundColor: Colors.blue.shade900,
          centerTitle: true,
        ),
        backgroundColor: const Color(0xFFffcd3c),
        body: InteractiveViewer(
          clipBehavior: Clip.none,
          child: Center(
            child: Ink(
              height: 260,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(RenterBikekaphoto),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
