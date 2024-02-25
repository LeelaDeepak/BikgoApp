import 'dart:io';

import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Checkfuelbill extends StatefulWidget {
  const Checkfuelbill({Key? key}) : super(key: key);

  @override
  State<Checkfuelbill> createState() => _CheckfuelbillState();
}

class _CheckfuelbillState extends State<Checkfuelbill> {
  TextEditingController fuelController = TextEditingController();
  TextEditingController payController = TextEditingController();
  TextEditingController repairController = TextEditingController();
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  int doclength = 0;
  int w1 = 0;
  int w2 = 0;
  int w3 = 0;

  Future uploadFile(context) async {
    if (pickedFile != null) {
      final path =
          "Rider/Renter_Fuel_Receipts/$globalUseremail/${pickedFile!.name}";
      final file = File(pickedFile!.path!);
      RiderFuelRecipt = pickedFile!.name;
      final ref = FirebaseStorage.instance.ref().child(path);

      setState(() {
        uploadTask = ref.putFile(file);
      });

      final snapshot = await uploadTask!.whenComplete(() {});

      final urlDownload = await snapshot.ref.getDownloadURL();
      print("Download Link: $urlDownload");
      recipturl = urlDownload;

      setState(() {
        uploadTask = null;
        w1 = 1;
      });
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
                child: Text('The Recipt has been uploaded successfully.',
                    style: TextStyle(
                      fontSize: 20,
                    )))
          ],
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 3),
        shape: const StadiumBorder(),
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
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
                child:
                    Text('Please select the image and then click on upload. ',
                        style: TextStyle(
                          fontSize: 20,
                        )))
          ],
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        shape: const StadiumBorder(),
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ));
    }
  }

  @override
  void initState() {
    fetchdoclength();
    super.initState();
  }

  void fetchdoclength() async {
    int count = await FirebaseFirestore.instance
        .collection('Rider-Transactions')
        .doc(globalUseremail)
        .collection("Transactions-While-Trip")
        .get()
        .then((value) => doclength = value.size);
    print(doclength);
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
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
            mainAxisAlignment: MainAxisAlignment.center,
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
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Enter Details!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.yellow),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 300,
                  width: 350,
                  child: Image.asset("assets/fuelfill.png"),
                ),
              ),
              Card(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: 350,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Repair-Description',
                      hintText: 'Repairs-while-Trip',
                      prefixIcon: Icon(
                        Icons.settings,
                        size: 30,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    controller: repairController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: 350,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Fuel-Qantity',
                      hintText: 'The Fuel Quantity You Filled',
                      prefixIcon: Icon(
                        Icons.water_drop_rounded,
                        size: 30,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    controller: fuelController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  width: 350,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Amount-Paid',
                      hintText: 'Fuel Station/Repair Garage',
                      prefixIcon: Icon(
                        Icons.payment,
                        size: 30,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    controller: payController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Upload the Screenshot Or Photo of the Fuel Receipt/Bike-Repair",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (pickedFile != null)
                SizedBox(
                    width: 330,
                    child: Container(
                      color: Colors.white,
                      child: Image.file(
                        File(pickedFile!.path!),
                        fit: BoxFit.cover,
                      ),
                    )),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: 330,
                height: 80,
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.image,
                    size: 40,
                  ),
                  label: const Text(
                    ' Select Photo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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
                    w2 = 1;
                    selectFile();
                  },
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 330,
                height: 80,
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.upload,
                    size: 40,
                  ),
                  label: const Text(
                    ' Upload Photo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
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
                    w3 = 1;
                    uploadFile(context);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              buildProgress(),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: ElevatedButton.icon(
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
                      if (w1 != 0 &&
                          w2 != 0 &&
                          w3 != 0 &&
                          payController.text != "") {
                        if (fuelController.text != "" &&
                            repairController.text != "") {
                          doclength = doclength + 1;
                          DocumentReference users = FirebaseFirestore.instance
                              .collection('Rider-Transactions')
                              .doc(globalUseremail)
                              .collection("Transactions-While-Trip")
                              .doc("RFR_Repair_$doclength");
                          users.set({
                            'Fuel-Quanity': fuelController.text,
                            'Fuel/Repair-Recipt': recipturl,
                            'Repair-Description': repairController.text,
                            'Paid-Amount': payController.text,
                            'Fuel/Repair-Recipt-Filename': RiderFuelRecipt,
                            'Bike-Owner-Name': myriderchater,
                            'Rider-Email-ID': globalUseremail,
                          });
                          print("Added to Firestore");
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
                                    child: Text('Saved the details!',
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
                        } else if (fuelController.text == "" ||
                            repairController.text == "") {
                          doclength = doclength + 1;
                          DocumentReference users = FirebaseFirestore.instance
                              .collection('Rider-Transactions')
                              .doc(globalUseremail)
                              .collection("Transactions-While-Trip")
                              .doc("RFR_Repair_$doclength");
                          users.set({
                            'Fuel-Quanity': (fuelController.text == "")
                                ? "No-Fuel Added"
                                : fuelController.text,
                            'Fuel/Repair-Recipt': recipturl,
                            'Fuel/Repair-Recipt-Filename': RiderFuelRecipt,
                            'Repair-Description': (repairController.text == "")
                                ? "No-Repairs Added"
                                : repairController.text,
                            'Paid-Amount': payController.text,
                            'Bike-Owner-Name': myriderchater,
                            'Rider-Email-ID': globalUseremail,
                          });
                          print("Added to Firestore");
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
                                    child: Text('Saved the details!',
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
                        }

                        Navigator.pushNamed(context, 'RiderDrivingScreen.id');
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
                                  child: Text(
                                      'Please ensure that you have provided the required details!',
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
                    icon: const Icon(
                      Icons.play_circle_fill_sharp,
                      color: Colors.yellow,
                      size: 40,
                    ),
                    label: const Text(
                      "Resume-Trip",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          double progress = data.bytesTransferred / data.totalBytes;
          return SizedBox(
            height: 50,
            child: Stack(
              fit: StackFit.expand,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.blue.shade900,
                  color: Colors.white,
                ),
                Center(
                  child: Text(
                    "${(100 * progress).roundToDouble()}% - Uploaded Successfully",
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox(
            height: 50,
          );
        }
      }));
}
