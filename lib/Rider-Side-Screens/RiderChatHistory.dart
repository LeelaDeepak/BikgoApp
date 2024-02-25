import 'package:bigkoapp/Renter/Active_Renters/MetaActiveRenters.dart';

import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RiderChatTab extends StatefulWidget {
  const RiderChatTab({Key? key}) : super(key: key);

  @override
  State<RiderChatTab> createState() => _RiderChatTabState();
}

class _RiderChatTabState extends State<RiderChatTab> {
  Map<String, dynamic>? userMap;
  DateTime date = DateTime.now();

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Chats As Rider",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder<List<UsersmetaforRider>>(
            builder: ((context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        height: 450,
                        width: 450,
                        child: GestureDetector(
                          child: Lottie.asset('assets/Under-maintainence.json'),
                          onTap: () {},
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        "Something went wrong, in the Chat-Section. We are trying to fix it. Thank you for your patience.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      )),
                    )
                  ],
                );
              } else if (snapshot.hasData) {
                final u = snapshot.data!;
                print("User-History-data:$globalUseremail");
                print(u.length);

                if (u.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          height: 450,
                          width: 450,
                          child: Lottie.asset('assets/chatscreendata.json'),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          "It seems like this is your first time, Select Your Bike and Chat with The Renter.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )),
                      )
                    ],
                  );
                } else {
                  return SingleChildScrollView(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: u.map(buildUser).toList(),
                      ));
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }
            }),
            stream: readUsers(),
          )
        ],
      )),
    );
  }

  Widget buildUser(UsersmetaforRider usersmeta) {
    return Column(
      children: [
        Card(
          color: Colors.black,
          child: ListTile(
              onTap: () {
                setState(() {
                  myriderchater = usersmeta.BikeOwner;
                  if (myriderchater == "Freoz Shah") {
                    myriderchatroomId = "ChatAsFreozRenter";
                  } else if (myriderchater == "Pradeep Rawat") {
                    myriderchatroomId = "ChatAsPradeepRenter";
                  } else if (myriderchater == "Rajesh Bhat") {
                    myriderchatroomId = "ChatAsRajeshRenter";
                  } else if (myriderchater == "Rohit Kumar") {
                    myriderchatroomId == "ChatAsRohitRenter";
                  } else if (myriderchater == "Sandeep Reddy") {
                    myriderchatroomId == "ChatAsSandeepRenter";
                  } else if (myriderchater == "Vinod Sharma") {
                    myriderchatroomId = "ChatAsVinodRenter";
                  }

                  Navigator.pushNamed(context, 'RiderSideChatRoom.id');
                });
              },
              leading: CircleAvatar(
                maxRadius: 30,
                minRadius: 30,
                child: Material(
                  color: Colors.blue.shade900,
                  child: Ink.image(
                      width: 100,
                      height: 100,
                      image: NetworkImage(usersmeta.BikeOwnerPhoto.toString(),
                          scale: 1),
                      child: InkWell(
                        onTap: () {},
                      ),
                      onImageError: (exception, stackTrace) {}),
                ),
              ),
              title: Text(usersmeta.BikeOwner,
                  style: const TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              subtitle: Text(
                "Bike-Model: ${usersmeta.VechileModel}",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
              trailing: Text("Rents: ${usersmeta.Rents}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15))),
        ),
      ],
    );
  }

  Stream<List<UsersmetaforRider>>
      readUsers() => //Accessing the data from firestore and convert json data to user objects
          FirebaseFirestore.instance
              .collection("Active-Renters")
              .snapshots()
              .map((snapshot) => snapshot.docs
                  .map((doc) => UsersmetaforRider.fromJson(doc.data()))
                  .toList());
}
