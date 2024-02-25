import 'package:flutter/material.dart';

class UploadInstructions extends StatefulWidget {
  const UploadInstructions({Key? key}) : super(key: key);

  @override
  State<UploadInstructions> createState() => _UploadInstructionsState();
}

class _UploadInstructionsState extends State<UploadInstructions> {
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
                      Navigator.pushNamed(context, 'RenterFlow.id');
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Read ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.yellow),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Instructions",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.yellow),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Card(
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          ListTile(
                            leading: MyBullet(),
                            contentPadding:
                                const EdgeInsets.fromLTRB(1, 0, 9, 0),
                            title: const Text(
                              "The registration process consists of the personal information along with your Bike details.",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ),
                          ListTile(
                            leading: MyBullet(),
                            contentPadding:
                                const EdgeInsets.fromLTRB(1, 0, 9, 0),
                            title: const Text(
                              "The following bike documents are to be uploaded for the verification process.",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ),
                          ListTile(
                            leading: MyBullet(),
                            contentPadding:
                                const EdgeInsets.fromLTRB(1, 0, 9, 0),
                            title: const Text(
                              "(The PDFs and Images must be clearly visible!) :",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 3,
                                color: Colors.black,
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: const Text(
                                    "PDF-Format",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        backgroundColor: Colors.yellow,
                                        color: Colors.black),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  leading: MyBulletforinside(),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(44, 0, 9, 0),
                                  title: const Text(
                                    "Reg-Certificate",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                ),
                                ListTile(
                                  leading: MyBulletforinside(),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(44, 0, 9, 0),
                                  title: const Text(
                                    "Insurance",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                ),
                                ListTile(
                                  leading: MyBulletforinside(),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(44, 0, 9, 0),
                                  title: const Text(
                                    "Pollution-Certificate",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 3,
                                color: Colors.black,
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: const Text(
                                    "Image-Format",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        backgroundColor: Colors.yellow,
                                        color: Colors.black),
                                  ),
                                ),
                                ListTile(
                                  leading: MyBulletforinside(),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(44, 0, 9, 0),
                                  title: const Text(
                                    "Bike-Photo",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                ),
                                ListTile(
                                  leading: MyBulletforinside(),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(44, 0, 9, 0),
                                  title: const Text(
                                    "A clear selfie photo of the renter",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "Please keep the above",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  backgroundColor: Colors.yellow,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "information ready,",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  backgroundColor: Colors.yellow,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "before starting the",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  backgroundColor: Colors.yellow,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "registration process.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  backgroundColor: Colors.yellow,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 80,
                            width: double.infinity,
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
                                  Navigator.pushNamed(
                                      context, 'RenterConfirm.id');
                                },
                                child: const Text(
                                  "Proceed",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyBullet() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
      child: Container(
        height: 13.0,
        width: 13.0,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget MyBulletforinside() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(28, 5, 0, 0),
      child: Container(
        height: 13.0,
        width: 13.0,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }
}
