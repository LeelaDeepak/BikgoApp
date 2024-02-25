import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RiderUpdatePhotos extends StatefulWidget {
  const RiderUpdatePhotos({Key? key}) : super(key: key);

  @override
  State<RiderUpdatePhotos> createState() => _RiderUpdatePhotosState();
}

class _RiderUpdatePhotosState extends State<RiderUpdatePhotos> {
  @override
  void initState() {
    getRiderDetails();
    super.initState();
  }

  getRiderDetails() async {
    DocumentSnapshot dataref = await FirebaseFirestore.instance
        .collection("Rider-details")
        .doc(globalUseremail)
        .get();
    setState(() {
      ridernaam = dataref['Rider-Name'];
      FrontSideLicense = dataref['Rider-Front-License-FileName'];
      BackSideLicense = dataref['Rider-Back-License-FileName'];
      urider1 = dataref['Rider-License-Back'];
      urider2 = dataref['Rider-License-Front'];
      urider3 = dataref['Rider-Selfie'];
      riderkasaal = dataref['Rider-Age'];
      rideradda = dataref['Rider-Address'];
      riderkaphonenp = dataref['Rider-PhoneNumber'];
      riderkaLicenseNo = dataref['License-No'];
      FrontSideLicense = dataref['Rider-Front-License-FileName'];
      BackSideLicense = dataref['Rider-Back-License-FileName'];
      RiderSelfie = dataref['Rider-Selfie-FileName'];
    });
  }

  int currentStep = 0;
  bool onbtnclicked = false;
  bool isCompleted = false;
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
                height: 40,
              ),
              const Center(
                child: Text(
                  "Update The Required Photos",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.yellow),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Upload-Photos",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.yellow,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Stepper(
                            physics: const ClampingScrollPhysics(),
                            type: StepperType.vertical,
                            steps: getSteps(),
                            currentStep: currentStep,
                            onStepContinue: () {
                              final isLastStep =
                                  currentStep == getSteps().length - 1;
                              if (isLastStep) {
                                setState(() {
                                  isCompleted = true;
                                });
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
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
                                              'Photos Uploaded Successfully',
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
                                //send data to server
                              } else {
                                setState(() => currentStep += 1);
                              }
                            },
                            onStepCancel: () {
                              currentStep == 0
                                  ? null
                                  : setState(() => currentStep -= 1);
                            },
                            controlsBuilder: (BuildContext context,
                                ControlsDetails controls) {
                              final isLastStep =
                                  currentStep == getSteps().length - 1;
                              return Container(
                                margin: const EdgeInsets.only(top: 50),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: controls.onStepContinue,
                                        child:
                                            Text(isLastStep ? 'DONE' : 'NEXT'),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    if (currentStep != 0)
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: controls.onStepCancel,
                                          child: const Text('BACK'),
                                        ),
                                      )
                                  ],
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ),
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
                      if (uploadvalueofirst != 0 &&
                          uploadvalueofsecond != 0 &&
                          uploadvalueofthird != 0) {
                        Fluttertoast.showToast(
                            msg: "Photos Updated Successfully!!");
                        Navigator.pushNamed(context, 'RiderTabs.id');

                        setState(() {
                          uploadvalueofirst = 0;
                          uploadvalueofsecond = 0;
                          uploadvalueofthird = 0;
                        });
                      } else {
                        print("Fill details");

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.error_outline,
                                size: 32,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                  child: Text(
                                      'To proceed, enter and upload the required information.',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black)))
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
                      "Save",
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

  List<Step> getSteps() => [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            title: const Text(
              "Upload The License's Front Side",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            content: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: (uploadvalueofirst == 0)
                      ? Column(
                          children: [
                            const Icon(
                              Icons.cloud_upload,
                              size: 100,
                              color: Colors.black,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: (uploadvalueofirst == 0)
                                        ? () {
                                            if (onbtnenabled1) {
                                              print("First time upload");
                                              Navigator.pushNamed(context,
                                                  'RiderUpdateFrontLicense.id');
                                            } else {
                                              setState(() {
                                                onbtnenabled1 = false;
                                              });
                                              print("Not allowed to upload");
                                            }
                                          }
                                        : null,
                                    child: const Text('Upload-File'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : const Icon(
                          Icons.cloud_done,
                          size: 100,
                          color: Colors.black,
                        ),
                )
              ],
            ),
            isActive: currentStep >= 0),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            title: const Text(
              "Upload The License's Back Side",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            content: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: (uploadvalueofsecond == 0)
                      ? Column(
                          children: [
                            const Icon(
                              Icons.cloud_upload,
                              size: 100,
                              color: Colors.black,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: (uploadvalueofsecond == 0)
                                        ? () {
                                            if (onbtnenabled2) {
                                              print("First time upload");
                                              Navigator.pushNamed(context,
                                                  'RiderUpdateBackLicense.id');
                                            } else {
                                              setState(() {
                                                onbtnenabled2 = false;
                                              });
                                              print("Not allowed to upload");
                                            }
                                          }
                                        : null,
                                    child: const Text('Upload-File'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : const Icon(
                          Icons.cloud_done,
                          size: 100,
                          color: Colors.black,
                        ),
                )
              ],
            ),
            isActive: currentStep >= 1),
        Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            title: const Text(
              'Upload Rider Clear Selfie',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            content: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: (uploadvalueofthird == 0)
                      ? Column(
                          children: [
                            const Icon(
                              Icons.cloud_upload,
                              size: 100,
                              color: Colors.black,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: (uploadvalueofthird == 0)
                                        ? () {
                                            if (onbtnenabled3) {
                                              print("First time upload");
                                              Navigator.pushNamed(context,
                                                  'RiderUpdateSelfie.id');
                                            } else {
                                              setState(() {
                                                onbtnenabled3 = false;
                                              });
                                              print("Not allowed to upload");
                                            }
                                          }
                                        : null,
                                    child: const Text('Upload-File'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : const Icon(
                          Icons.cloud_done,
                          size: 100,
                          color: Colors.black,
                        ),
                )
              ],
            ),
            isActive: currentStep >= 2)
      ];
}
