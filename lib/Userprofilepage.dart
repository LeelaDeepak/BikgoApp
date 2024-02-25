import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Userprofile extends StatefulWidget {
  const Userprofile({Key? key}) : super(key: key);

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {
  String? profileimagepath = "";
  String username = "";

  @override
  void initState() {
    getUserprofileimage();
    super.initState();
  }

  getUserprofileimage() async {
    DocumentSnapshot imageref = await FirebaseFirestore.instance
        .collection("SignUpDetails")
        .doc(globalUseremail)
        .get();
    print(imageref['UserProfilepic']);
    print(imageref['Name']);
    setState(() {
      profileimagepath = imageref['UserProfilepic'];
      username = imageref['Name'];
    });

    print("User Profile Image URL = $profileimagepath");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          backgroundColor: Colors.blue.shade900,
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: SizedBox(
            height: 70,
            width: 70,
            child: FloatingActionButton(
              backgroundColor: Colors.yellow,
              child: const Icon(
                Icons.account_balance_wallet_outlined,
                size: 40,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'BikgoWallet.id');
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                ProfileWidget(imagePath: profileimagepath!, onClicked: () {}),
                const SizedBox(height: 24),
                buildName(),
                const SizedBox(
                  height: 24,
                ),
                const NumbersWidget(),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 60,
                  width: 300,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.yellow;
                          }
                          return Colors.yellow;
                        }),
                      ),
                      onPressed: () {
                        userlogout();
                      },
                      child: const Text(
                        "Log-Out",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                ),
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Bikgo-Subscriptions",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(child: buildUpgradeButton()),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )),
    );
  }

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Know My Pack',
        onClicked: () {
          print("Going to Subscription Packages");
          Navigator.pushNamed(context, 'SubscriptionScreen.id');
        },
      );

  Widget buildName() => Column(
        children: [
          Text(
            username,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            globalUseremail,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          )
        ],
      );

  void userlogout() async {
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
}

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        buildImage(),
        Positioned(bottom: 0, right: 4, child: buildEditIcon(Colors.yellow))
      ]),
    );
  }

  Widget buildEditIcon(Color color) {
    return buildCircle(
        color: Colors.blue.shade900,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: const Icon(
            Icons.edit,
            size: 20,
            color: Colors.black,
          ),
        ));
  }

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          child: child,
          color: color,
          padding: EdgeInsets.all(all),
        ),
      );

  Widget buildImage() {
    final image = NetworkImage(imagePath.toString(), scale: 1.0);
    return ClipOval(
      child: Material(
        color: Colors.white,
        child: Ink.image(
            image: image,
            fit: BoxFit.cover,
            width: 128,
            height: 128,
            child: InkWell(
              onTap: onClicked,
            ),
            onImageError: (exception, stackTrace) {}),
      ),
    );
  }
}

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildButton(context, '02', 'Rides'),
        buildDivider(),
        buildButton(context, '02', 'Rents'),
        buildDivider(),
        buildButton(context, '1k', 'Earnings'),
      ],
    );
  }

  Widget buildDivider() => const SizedBox(
        height: 24,
        child: VerticalDivider(),
      );

  Widget buildButton(BuildContext context, String value, String text) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.yellow),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            text,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
                fontSize: 16),
          )
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({Key? key, required this.onClicked, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      child: Text(
        text,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: Colors.yellow,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20)),
    );
  }
}
