import 'dart:io';

import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadUserpropic extends StatefulWidget {
  const UploadUserpropic({Key? key}) : super(key: key);

  @override
  State<UploadUserpropic> createState() => _UploadUserpropicState();
}

class _UploadUserpropicState extends State<UploadUserpropic> {
  int profilepicvalue = 0;
  String userprofileimageurl = "";

  void pickUploadImage() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 75);

    String path =
        "UserProfilepics/$nextmail@Bikgo.com/$nextname/Userprofilepic.jpg";

    Reference ref = FirebaseStorage.instance.ref().child(path);

    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value) {
      print(value);
      setState(() {
        userprofileimageurl = value;
        DocumentReference users = FirebaseFirestore.instance
            .collection('SignUpDetails')
            .doc("$nextmail@Bikgo.com");
        users.set({
          'Name': nextname,
          'Personal-Email': nextrecmail,
          'Bikgo-ID': "$nextmail@Bikgo.com",
          'Q1-BornCity': userborncity,
          'Q2-Firstjobplace': userfirstjobplace,
          'DateOfBirth': nextdob,
          'UserProfilepic': userprofileimageurl,
        });
      });
      print("userprofileimage:$userprofileimageurl");
      print("user-born-city:$userborncity");
      print("Name: $nextname");
      print("user-first-movie:$userfirstjobplace");
      print("Personal-Email:$nextrecmail");
      print("NextDob=$nextdob");
      print("Nextmail=$nextmail");
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
        body: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Upload Your Profile Picture",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 315,
                  width: 315,
                  child: InkWell(
                    onTap: () {
                      print("Button-Pressed-on-Avatar");
                      pickUploadImage();
                      profilepicvalue = 1;
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                            backgroundImage: (userprofileimageurl == "")
                                ? const AssetImage("assets/Addprofilepic.png")
                                : NetworkImage(userprofileimageurl)
                                    as ImageProvider),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomSheet: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            height: 90,
            width: double.infinity,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.black26;
                      }
                      return Colors.black87;
                    }),
                  ),
                  onPressed: () {
                    if (profilepicvalue == 1) {
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
                                    'Your Account has been Successfully created with given Bikgo-ID and Password.',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)))
                          ],
                        ),
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 4),
                        shape: const StadiumBorder(),
                        margin: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 12),
                        behavior: SnackBarBehavior.floating,
                        elevation: 0,
                      ));
                      Navigator.pushNamed(context, 'Home.id');
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
                                child: Text('Upload Your Profile Picture!',
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
                    "Create-Account",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ))),
      ),
    );
  }
}
