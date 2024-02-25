import 'package:bigkoapp/Renter/Active_Renters/MetaActiveRenters.dart';
import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RenterChatHistory extends StatefulWidget {
  const RenterChatHistory({Key? key}) : super(key: key);

  @override
  State<RenterChatHistory> createState() => _RenterChatHistoryState();
}

class _RenterChatHistoryState extends State<RenterChatHistory> {
  @override
  void initState() {
    getAvailablestatus();
    super.initState();
  }

  getAvailablestatus() async {
    print("Hi its working in status part");
    doc1 = await FirebaseFirestore.instance
        .collection('chatroom')
        .doc("ChatAsFreozRenter")
        .collection("ChatAsFreozRenter")
        .get()
        .then((value) => value.size);
    print("Doclength of Freoz=$doc1");

    doc2 = await FirebaseFirestore.instance
        .collection('chatroom')
        .doc("ChatAsPradeepRenter")
        .collection("ChatAsPradeepRenter")
        .get()
        .then((value) => value.size);
    print("Doclength of Pradeep=$doc2");

    doc3 = await FirebaseFirestore.instance
        .collection('chatroom')
        .doc("ChatAsRajeshRenter")
        .collection("ChatAsRajeshRenter")
        .get()
        .then((value) => value.size);
    print("Doclength of Rajesh=$doc3");

    doc4 = await FirebaseFirestore.instance
        .collection('chatroom')
        .doc("ChatAsVinodRenter")
        .collection("ChatAsVinodRenter")
        .get()
        .then((value) => value.size);
    print("Doclength of Vinod=$doc4");

    int count = await FirebaseFirestore.instance
        .collection('Rider-Transactions')
        .doc(globalUseremail)
        .collection("Transactions-While-Trip")
        .get()
        .then((value) => ridertansactions = value.size);
    print("Doclength Of Transactions-While-Trip=$ridertansactions");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Chats As Renter",
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
                          "It seems like this is your first time, Chat with the rider to rent your bike.",
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
      backgroundColor: Colors.blue.shade900,
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
                Navigator.pushNamed(context, 'RenterSideChatRoom.id');
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
          ),
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
