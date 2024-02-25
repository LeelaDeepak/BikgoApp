import 'dart:ffi';

import 'package:flutter/material.dart';

class SlotRide extends StatefulWidget {
  const SlotRide({Key? key}) : super(key: key);

  @override
  State<SlotRide> createState() => _SlotRideState();
}

class _SlotRideState extends State<SlotRide> {
  DateTime date = DateTime.now();
  String DOS = "";
  String TOS1 = "";
  String TOS2 = "";
  TimeOfDay time = TimeOfDay.now();
  TimeOfDay ftime = TimeOfDay.now();
  int btnvalue1 = 0;
  int btnvalue2 = 0;
  int btnvalue = 0;

  @override
  Widget build(BuildContext context) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    final fhours = ftime.hour.toString().padLeft(2, '0');
    final fminutes = ftime.minute.toString().padLeft(2, '0');
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
                    Navigator.pushNamed(context, 'ChooseRidetype.id');
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Choose Your',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.yellow),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Slot To',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.yellow),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Ride Bike',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.yellow),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Choose Slot Date:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow),
                    onPressed: () async {
                      btnvalue = 1;
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      //if 'CANCEL'==>null
                      if (newDate != null) {
                        setState(() => date = newDate);
                        DOS = '${date.day} / ${date.month} / ${date.year}';
                      }
                      print(DOS);
                    },
                    icon: const Icon(
                      Icons.calendar_month,
                      color: Colors.black,
                      size: 40,
                    ),
                    label: const Text(
                      "Date-Of-Slot",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${date.day} / ${date.month} / ${date.year}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Choose Slot',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Start Time:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                child: ElevatedButton.icon(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  onPressed: () async {
                    btnvalue1 = 1;
                    TimeOfDay? newTime = await showTimePicker(
                        context: context, initialTime: time);
                    print(newTime.toString());

                    if (newTime == null) return;

                    setState(() {
                      time = newTime;
                    });
                    print("Start-time: ($hours:$minutes)");
                    TOS1 = "Start-time: ($hours:$minutes)";
                    print("TOS1:$TOS1");
                  },
                  icon: const Icon(
                    Icons.alarm,
                    size: 40,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Start-Time',
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Start-time: ($hours:$minutes)",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Choose Slot',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'End Time:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                child: ElevatedButton.icon(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  onPressed: () async {
                    btnvalue2 = 1;
                    TimeOfDay? newTime = await showTimePicker(
                        context: context, initialTime: ftime);
                    print(newTime.toString());

                    if (newTime == null) return;

                    setState(() {
                      ftime = newTime;
                    });
                    print("End-time: ($fhours:$fminutes)");
                    TOS2 = "End-time: ($fhours:$fminutes)";
                    print("TOS2:$TOS2");
                  },
                  icon: const Icon(
                    Icons.alarm,
                    size: 40,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'End-Time',
                    style: TextStyle(fontSize: 32, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "End-time: ($fhours:$fminutes)",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 70,
                width: 300,
                child: ElevatedButton(
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
                      if (btnvalue1 == 1 && btnvalue2 == 1 && btnvalue == 1) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.done,
                                size: 32,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                  child: Text('Your Slot Has Been Booked!',
                                      style: TextStyle(
                                        fontSize: 20,
                                      )))
                            ],
                          ),
                          backgroundColor: Colors.green,
                          duration: const Duration(seconds: 3),
                          shape: const StadiumBorder(),
                          margin: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 12),
                          behavior: SnackBarBehavior.floating,
                          elevation: 0,
                        ));
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
                                  child: Text('Enter All the Details of Slot',
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
                      "Book-Slot",
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
    );
  }
}
