import 'package:bigkoapp/globaldetails.dart';
import 'package:flutter/material.dart';

class RenterUploads extends StatefulWidget {
  const RenterUploads({Key? key}) : super(key: key);

  @override
  State<RenterUploads> createState() => _RenterUploadsState();
}

class _RenterUploadsState extends State<RenterUploads> {
  int currentStep = 0;
  int currentStep1 = 0;
  bool isCompleted = false;
  bool isCompleted1 = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.blue.shade900,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Uploads for Renter Registration",
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
                            height: 20,
                          ),
                          const Text(
                            "Upload-PDFs",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                backgroundColor: Colors.yellow,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.done,
                                          size: 32,
                                        ),
                                        SizedBox(width: 16),
                                        Expanded(
                                            child: Text(
                                                'PDFs Uploaded Successfully',
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
                                          child: Text(
                                              isLastStep ? 'DONE' : 'NEXT'),
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
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(
                            color: Colors.black,
                            thickness: 4.0,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Upload-Photos",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                backgroundColor: Colors.yellow,
                                color: Colors.black),
                          ),
                          Stepper(
                              physics: const ClampingScrollPhysics(),
                              type: StepperType.vertical,
                              steps: getStepsforimages(),
                              currentStep: currentStep1,
                              onStepContinue: () {
                                final isLastStep1 = currentStep1 ==
                                    getStepsforimages().length - 1;
                                if (isLastStep1) {
                                  setState(() {
                                    isCompleted1 = true;
                                  });
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                  setState(() => currentStep1 += 1);
                                }
                              },
                              onStepCancel: () {
                                currentStep1 == 0
                                    ? null
                                    : setState(() => currentStep1 -= 1);
                              },
                              controlsBuilder: (BuildContext context,
                                  ControlsDetails controls1) {
                                final isLastStep1 = currentStep1 ==
                                    getStepsforimages().length - 1;
                                return Container(
                                  margin: const EdgeInsets.only(top: 50),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: controls1.onStepContinue,
                                          child: Text(
                                              isLastStep1 ? 'DONE' : 'NEXT'),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      if (currentStep1 != 0)
                                        Expanded(
                                          child: ElevatedButton(
                                            onPressed: controls1.onStepCancel,
                                            child: const Text('BACK'),
                                          ),
                                        )
                                    ],
                                  ),
                                );
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 80,
                            width: 300,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return Colors.black;
                                    }
                                    return Colors.black;
                                  }),
                                ),
                                onPressed: () {
                                  if (uploadrentervalueoffirst != 0 &&
                                      uploadrentervalueoftwo != 0 &&
                                      uploadrentervalueofthree != 0 &&
                                      uploadrentervalueoffour != 0 &&
                                      uploadrentervalueoffive != 0) {
                                    Navigator.pushNamed(
                                        context, 'ReviewRenter.id');
                                  } else {
                                    print("Fill details");
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.error_outline,
                                            size: 32,
                                          ),
                                          SizedBox(width: 16),
                                          Expanded(
                                              child: Text(
                                                  'To proceed, enter all the required information.',
                                                  style:
                                                      TextStyle(fontSize: 20)))
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
                )
              ],
            ),
          ),
        ),
        onWillPop: () async {
          return false;
        });
  }

  List<Step> getStepsforimages() => [
        Step(
            state: currentStep1 > 0 ? StepState.complete : StepState.indexed,
            title: const Text(
              "Upload The Bike Photo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            content: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: (uploadrentervalueoffour == 0)
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
                                    onPressed: (uploadrentervalueoffour == 0)
                                        ? () {
                                            if (onbtnrenterenabled4) {
                                              print("First time upload");
                                              Navigator.pushNamed(context,
                                                  'RenterBikePhoto.id');
                                            } else {
                                              setState(() {
                                                onbtnrenterenabled4 = false;
                                              });
                                              print("Not allowed to upload");
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(
                                                      Icons.error_outline,
                                                      size: 32,
                                                    ),
                                                    SizedBox(width: 16),
                                                    Expanded(
                                                        child: Text(
                                                            'Not allowed to upload',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .black)))
                                                  ],
                                                ),
                                                backgroundColor: Colors.red,
                                                duration:
                                                    const Duration(seconds: 3),
                                                shape: const StadiumBorder(),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 16,
                                                        horizontal: 12),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                elevation: 0,
                                              ));
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
            isActive: currentStep1 >= 0),
        Step(
            state: currentStep1 > 1 ? StepState.complete : StepState.indexed,
            title: const Text(
              "Upload Renter Clear Selfie",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            content: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: (uploadrentervalueoffive == 0)
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
                                    onPressed: (uploadrentervalueoffive == 0)
                                        ? () {
                                            if (onbtnrenterenabled5) {
                                              print("First time upload");
                                              Navigator.pushNamed(context,
                                                  'RenterSelfieUpload.id');
                                            } else {
                                              setState(() {
                                                onbtnrenterenabled5 = false;
                                              });
                                              print("Not allowed to upload");
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(
                                                      Icons.error_outline,
                                                      size: 32,
                                                    ),
                                                    SizedBox(width: 16),
                                                    Expanded(
                                                        child: Text(
                                                            'Not allowed to upload',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .black)))
                                                  ],
                                                ),
                                                backgroundColor: Colors.red,
                                                duration:
                                                    const Duration(seconds: 3),
                                                shape: const StadiumBorder(),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 16,
                                                        horizontal: 12),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                elevation: 0,
                                              ));
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
            isActive: currentStep1 >= 1),
      ];

  List<Step> getSteps() => [
        Step(
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            title: const Text(
              "Upload The Bike Registration-Certificate",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            content: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: (uploadrentervalueoffirst == 0)
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
                                    onPressed: (uploadrentervalueoffirst == 0)
                                        ? () {
                                            if (onbtnrenterenabled1) {
                                              print("First time upload");
                                              Navigator.pushNamed(context,
                                                  'RenterBikeRCUpload.id');
                                            } else {
                                              setState(() {
                                                onbtnrenterenabled1 = false;
                                              });
                                              print("Not allowed to upload");
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(
                                                      Icons.error_outline,
                                                      size: 32,
                                                    ),
                                                    SizedBox(width: 16),
                                                    Expanded(
                                                        child: Text(
                                                            'Not allowed to upload',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .black)))
                                                  ],
                                                ),
                                                backgroundColor: Colors.red,
                                                duration:
                                                    const Duration(seconds: 3),
                                                shape: const StadiumBorder(),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 16,
                                                        horizontal: 12),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                elevation: 0,
                                              ));
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
              "Upload The Bike-Insurance",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            content: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: (uploadrentervalueoftwo == 0)
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
                                    onPressed: (uploadrentervalueoftwo == 0)
                                        ? () {
                                            if (onbtnrenterenabled2) {
                                              print("First time upload");
                                              Navigator.pushNamed(context,
                                                  'RenterBikeInsurance.id');
                                            } else {
                                              setState(() {
                                                onbtnrenterenabled2 = false;
                                              });
                                              print("Not allowed to upload");
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(
                                                      Icons.error_outline,
                                                      size: 32,
                                                    ),
                                                    SizedBox(width: 16),
                                                    Expanded(
                                                        child: Text(
                                                            'Not allowed to upload',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .black)))
                                                  ],
                                                ),
                                                backgroundColor: Colors.red,
                                                duration:
                                                    const Duration(seconds: 3),
                                                shape: const StadiumBorder(),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 16,
                                                        horizontal: 12),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                elevation: 0,
                                              ));
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
              'Upload Pollution-Certificate',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            content: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: (uploadrentervalueofthree == 0)
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
                                    onPressed: (uploadrentervalueofthree == 0)
                                        ? () {
                                            if (onbtnrenterenabled3) {
                                              print("First time upload");
                                              Navigator.pushNamed(context,
                                                  'RenterPollutionCertificate.id');
                                            } else {
                                              setState(() {
                                                onbtnrenterenabled3 = false;
                                              });
                                              print("Not allowed to upload");
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(
                                                      Icons.error_outline,
                                                      size: 32,
                                                    ),
                                                    SizedBox(width: 16),
                                                    Expanded(
                                                        child: Text(
                                                            'Not allowed to upload',
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .black)))
                                                  ],
                                                ),
                                                backgroundColor: Colors.red,
                                                duration:
                                                    const Duration(seconds: 3),
                                                shape: const StadiumBorder(),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 16,
                                                        horizontal: 12),
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                elevation: 0,
                                              ));
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
