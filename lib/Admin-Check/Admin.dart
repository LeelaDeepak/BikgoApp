import 'package:bigkoapp/Admin-Check/AdminRiderUsers.dart';
import 'package:bigkoapp/FirestoreDataBase/SignUpDatatoFirestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'AdminRenterUsers.dart';

class AdminAcount extends StatefulWidget {
  const AdminAcount({Key? key}) : super(key: key);

  @override
  State<AdminAcount> createState() => _AdminAcountState();
}

class _AdminAcountState extends State<AdminAcount> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: const Text('Admin-Section'),
          actions: [
            IconButton(
                onPressed: () async {
                  Navigator.pushNamed(context, 'Availableridershow.id');
                },
                icon: const Icon(Icons.pedal_bike_sharp))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Renter-Details",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.yellow),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              StreamBuilder<List<Users>>(
                builder: ((context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Something went wrong");
                  } else if (snapshot.hasData) {
                    final u = snapshot.data!;
                    return SingleChildScrollView(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: u.map(buildUser).toList(),
                        ));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  }
                }),
                stream: readUsers(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildUser(Users users) => ListTile(
      leading: CircleAvatar(child: Text(users.RenterAge)),
      title: Text("Renter-Name: " + users.RenterName,
          style: const TextStyle(color: Colors.white)),
      subtitle: Text(
        "Renter-Address: " + users.RenterAddress,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: IsRenterVerified(users));

  void logout() async {
    await FirebaseAuth.instance.signOut();
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
              child: Text("Logout Successfully",
                  style: TextStyle(fontSize: 20, color: Colors.white)))
        ],
      ),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 3),
      shape: const StadiumBorder(),
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    ));
    Navigator.pushNamed(context, 'Home.id');
  }

  Widget IsRenterVerified(Users users) {
    if (users.IsVerified == "False") {
      return const Icon(
        Icons.verified,
        color: Colors.red,
        size: 30,
      );
    }
    return const Icon(
      Icons.verified,
      color: Colors.green,
      size: 30,
    );
  }

  Stream<List<Users>>
      readUsers() => //Accessing the data from firestore and convert json data to user objects
          FirebaseFirestore.instance
              .collection("Renter-details")
              .snapshots()
              .map((snapshot) => snapshot.docs
                  .map((doc) => Users.fromJson(doc.data()))
                  .toList());
}

class RiderAdminSection extends StatefulWidget {
  const RiderAdminSection({Key? key}) : super(key: key);

  @override
  State<RiderAdminSection> createState() => _RiderAdminSectionState();
}

class _RiderAdminSectionState extends State<RiderAdminSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('Admin-Section'),
        actions: [
          IconButton(
              onPressed: () async {
                Navigator.pushNamed(context, 'PresentAccount.id');
              },
              icon: const Icon(Icons.directions_bike))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                "Rider-Details",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.yellow),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<List<Userswala>>(
              builder: ((context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                } else if (snapshot.hasData) {
                  final u = snapshot.data!;
                  return SingleChildScrollView(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: u.map(buildUserRider).toList(),
                      ));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                }
              }),
              stream: readUsersRider(),
            )
          ],
        ),
      ),
    );
  }

  Stream<List<Userswala>>
      readUsersRider() => //Accessing the data from firestore and convert json data to user objects
          FirebaseFirestore.instance
              .collection("Rider-details")
              .snapshots()
              .map((snapshot) => snapshot.docs
                  .map((doc) => Userswala.fromJson(doc.data()))
                  .toList());

  Widget buildUserRider(Userswala userswala) => ListTile(
      leading: CircleAvatar(child: Text(userswala.RiderAge)),
      title: Text("Rider-Name: " + userswala.RiderName,
          style: const TextStyle(color: Colors.white)),
      subtitle: Text(
        "Rider-Address: " + userswala.RiderAddress,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: IsRiderVerified(userswala));

  Widget IsRiderVerified(Userswala userswala) {
    if (userswala.IsVerified == "False") {
      return const Icon(
        Icons.verified,
        color: Colors.red,
        size: 30,
      );
    }
    return const Icon(
      Icons.verified,
      color: Colors.green,
      size: 30,
    );
  }
}

class SignUpRiderAdminSection extends StatefulWidget {
  const SignUpRiderAdminSection({Key? key}) : super(key: key);

  @override
  State<SignUpRiderAdminSection> createState() =>
      _SignUpRiderAdminSectionState();
}

class _SignUpRiderAdminSectionState extends State<SignUpRiderAdminSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('Admin-Section'),
        actions: [
          IconButton(
              onPressed: () async {
                logout();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
                size: 20,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                "SignUp-Details",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.yellow),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<List<SignUpUser>>(
              builder: ((context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                } else if (snapshot.hasData) {
                  final u = snapshot.data!;
                  return SingleChildScrollView(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: u.map(buildUserSignUp).toList(),
                      ));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                }
              }),
              stream: readUsersSignUp(),
            )
          ],
        ),
      ),
    );
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
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
              child: Text("Logout Successfully",
                  style: TextStyle(fontSize: 20, color: Colors.white)))
        ],
      ),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 3),
      shape: const StadiumBorder(),
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    ));
    Navigator.pushNamed(context, 'Home.id');
  }

  Widget buildUserSignUp(SignUpUser upUser) => ListTile(
      title: Text("User-Name: " + upUser.Name,
          style: const TextStyle(color: Colors.white)),
      subtitle: Text(
        "User-Email: " + upUser.Email,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: const Icon(
        Icons.verified,
        color: Colors.green,
        size: 30,
      ));

  Stream<List<SignUpUser>>
      readUsersSignUp() => //Accessing the data from firestore and convert json data to user objects
          FirebaseFirestore.instance
              .collection("SignUpDetails")
              .snapshots()
              .map((snapshot) => snapshot.docs
                  .map((doc) => SignUpUser.fromJson(doc.data()))
                  .toList());
}
