import 'dart:io';

import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class RenterBikeInsuranceUpdate extends StatefulWidget {
  const RenterBikeInsuranceUpdate({Key? key}) : super(key: key);

  @override
  State<RenterBikeInsuranceUpdate> createState() =>
      _RenterBikeInsuranceUpdateState();
}

class _RenterBikeInsuranceUpdateState extends State<RenterBikeInsuranceUpdate> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future uploadFile(context) async {
    if (pickedFile != null) {
      final path = "Renter/Bike-Insurance/$globalUseremail/${pickedFile!.name}";
      final file = File(pickedFile!.path!);
      RenterkaInsurancefilename = pickedFile!.name;
      print(Renterkanaam);

      final ref = FirebaseStorage.instance.ref().child(path);

      setState(() {
        uploadTask = ref.putFile(file);
      });

      final snapshot = await uploadTask!.whenComplete(() {});

      final urlDownload = await snapshot.ref.getDownloadURL();
      print("Download Link: $urlDownload");

      urenter2 = urlDownload;

      DocumentReference users = FirebaseFirestore.instance
          .collection('Renter-details')
          .doc(globalUseremail);
      await users.set({
        'Renter-Name': Renterkanaam,
        'Bike-Status': false,
        'Renter-PhoneNumber': Renterkaphone,
        'Renter-Address': Renterkaaddress,
        'Renter-Age': Renterkaage,
        'Renter-BikeModel': Renterkabikemodel,
        'Renter-BikeNumber': RenterkabikeNumber,
        'Renter-Bike-Photo-FileName': RenterkaBikephotofilename,
        'Renter-Selfie-FileName': RenterkaSelfiefilename,
        'Email': globalUseremail,
        'Renter-ChasisNumber': Renterkachasisnumber,
        'Renter-BikeRegNumber': RenterkaRegnumber,
        'Renter-Bike-Insurance': urenter2,
        'Renter-Pollution-Certificate': urenter3,
        'Renter-Selfie': Renterkaselfie,
        'Renter-Bike-Photo': RenterBikekaphoto,
        'Renter-Bike-RC': urenter1,
        'IsVerified': "False",
        'Renter-RC-FileName': RenterkaRCfilename,
        'Renter-Bike-Insurance-FileName': RenterkaInsurancefilename,
        'Renter-Pollution-Certificate-FileName': RenterkaPollutionfilename
      });
      print("Link Added to Firestore");

      setState(() {
        uploadTask = null;
        isrenterbikeinsuranceuploaded = 1;
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
                child: Text(
                    'The Bike Insurance-PDF has been uploaded successfully.',
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
                child: Text('Please select the PDF and then click on upload. ',
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

  Future selectFile() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
      RenterkaInsurancefilename = pickedFile!.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Update",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.yellow),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  " Your Bike ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.yellow),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  " Insurance!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.yellow),
                ),
              ),
              const SizedBox(height: 32),
              if (pickedFile != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      color: Colors.white,
                      child: Text(
                        "Selected PDF-Name:" + pickedFile!.name,
                        style: const TextStyle(color: Colors.black),
                      )),
                ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: 340,
                height: 80,
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.image,
                    size: 40,
                  ),
                  label: const Text(
                    ' Select PDF',
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
                    selectFile();
                  },
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 340,
                height: 80,
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.upload,
                    size: 40,
                  ),
                  label: const Text(
                    ' Upload PDF',
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
                      if (isrenterbikeinsuranceuploaded == 1) {
                        setState(() {
                          onbtnrenterenabled2 = false;
                          uploadrentervalueoftwo += 1;
                        });
                        Navigator.pushNamed(
                            context, 'RenterUpdateBikePhotos.id');
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
                                      'Please Upload The PDF to Proceed Further. ',
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
                      "Continue",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow),
                    )),
              ),
              const SizedBox(
                height: 30,
              )
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
