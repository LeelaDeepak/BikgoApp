import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:bigkoapp/globaldetails.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  // const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final userpwdController = TextEditingController();
  final recoverymail = TextEditingController();
  final q1Controller = TextEditingController();
  final q2Controller = TextEditingController();
  String userpassword = "";
  String retypepassword = "";
  bool isuserPasswordVisible1 = true;
  bool isuserPasswordVisible2 = true;
  DateTime date = DateTime.now();
  var loading = false;
  String DOB = "";
  bool senddata = false;

  validateForm() {
    if (nameController.text.length < 3) {
      Fluttertoast.showToast(msg: "Name must be atleast 3 Characters");
    } else if (userpassword.length < 6) {
      Fluttertoast.showToast(msg: "Password is Weak");
    } else if (retypepassword.length < 6) {
      Fluttertoast.showToast(msg: "Repeat Password is Weak");
    } else if (!recoverymail.text.contains("@")) {
      Fluttertoast.showToast(msg: "Recovery Email Address is not valid");
    } else if (q1Controller.text.length < 2) {
      Fluttertoast.showToast(msg: "First Answer must be of atleast length 3");
    } else if (q2Controller.text.length < 2) {
      Fluttertoast.showToast(msg: "Second Answer must be of atleast length 3");
    } else {
      Fluttertoast.showToast(msg: "Details Saved");
      setState(() {
        senddata = true;
      });
    }
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Create new Account',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.yellow),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'Home.id');
                        },
                        child: const Text(
                          "Already Registered? Login-Here",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ))),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            width: 370,
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'Name',
                                hintText: 'Your Full Name',
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(),
                              ),
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            width: 370,
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'Mail-ID',
                                hintText: 'Recovery Mail',
                                prefixIcon: Icon(
                                  Icons.mail_lock,
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(),
                              ),
                              controller: recoverymail,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            width: 370,
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'Bikgo-ID',
                                suffixText: "@Bikgo.com",
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(),
                              ),
                              controller: emailController,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            width: 370,
                            child: TextField(
                              onChanged: ((value) => setState(() {
                                    userpassword = value;
                                  })),
                              onSubmitted: ((value) => setState(() {
                                    userpassword = value;
                                  })),
                              decoration: InputDecoration(
                                labelText: 'New-Password',
                                hintText: 'Type Password',
                                suffixIcon: IconButton(
                                  icon: isuserPasswordVisible1
                                      ? const Icon(
                                          Icons.visibility_off,
                                          color: Colors.black,
                                        )
                                      : const Icon(
                                          Icons.visibility,
                                          color: Colors.black,
                                        ),
                                  onPressed: () => setState((() =>
                                      isuserPasswordVisible1 =
                                          !isuserPasswordVisible1)),
                                ),
                                border: const OutlineInputBorder(),
                              ),
                              obscureText: isuserPasswordVisible1,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            width: 370,
                            child: TextField(
                              onChanged: ((value) => setState(() {
                                    retypepassword = value;
                                  })),
                              onSubmitted: ((value) => setState(() {
                                    retypepassword = value;
                                  })),
                              decoration: InputDecoration(
                                labelText: 'Confirm-Password',
                                hintText: 'Retype Password',
                                suffixIcon: IconButton(
                                  icon: isuserPasswordVisible2
                                      ? const Icon(
                                          Icons.visibility_off,
                                          color: Colors.black,
                                        )
                                      : const Icon(
                                          Icons.visibility,
                                          color: Colors.black,
                                        ),
                                  onPressed: () => setState((() =>
                                      isuserPasswordVisible2 =
                                          !isuserPasswordVisible2)),
                                ),
                                border: const OutlineInputBorder(),
                              ),
                              obscureText: isuserPasswordVisible2,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Security-Questions',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            width: 370,
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'What city were you born in?',
                                prefixIcon: Icon(
                                  Icons.location_city,
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(),
                              ),
                              controller: q1Controller,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            width: 370,
                            child: TextField(
                              decoration: const InputDecoration(
                                labelText: 'In what city was your first job?',
                                prefixIcon: Icon(
                                  Icons.work,
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(),
                              ),
                              controller: q2Controller,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 60,
                            child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow),
                                onPressed: () async {
                                  DateTime? newDate = await showDatePicker(
                                      context: context,
                                      initialDate: date,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2100));
                                  //if 'CANCEL'==>null
                                  if (newDate != null) {
                                    setState(() => date = newDate);
                                    DOB =
                                        '${date.day} / ${date.month} / ${date.year}';
                                  }
                                },
                                icon: const Icon(
                                  Icons.calendar_month,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                label: const Text(
                                  "Date-Of-Birth",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.black),
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${date.day} / ${date.month} / ${date.year}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 70,
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
                                  if (nameController.text != "" &&
                                      userpassword != "" &&
                                      retypepassword != "" &&
                                      emailController.text != "" &&
                                      recoverymail.text != "" &&
                                      q1Controller.text != "" &&
                                      q2Controller.text != "") {
                                    validateForm();
                                    setState(() {
                                      userpwdController.text =
                                          userpassword.trim();
                                      nextname = nameController.text.trim();
                                      nextmail = emailController.text.trim();
                                      nextdob = DOB.trim();
                                      nextrecmail = recoverymail.text.trim();
                                      userborncity = q1Controller.text
                                          .toLowerCase()
                                          .trim();
                                      userfirstjobplace = q2Controller.text
                                          .toLowerCase()
                                          .trim();
                                    });

                                    if (userpassword == retypepassword) {
                                      if (senddata == true) {
                                        signUp(context);
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "Enter Valid Details");
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.error,
                                              size: 32,
                                            ),
                                            SizedBox(width: 16),
                                            Expanded(
                                                child: Text(
                                                    'The new password and the confirmed password are not matching.',
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
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.error,
                                            size: 32,
                                          ),
                                          SizedBox(width: 16),
                                          Expanded(
                                              child: Text(
                                                  'Sorry, Your Account has not been created. Fill the required details to create an account. ',
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
                                  "Sign-Up",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow),
                                )),
                          ),
                          const SizedBox(
                            height: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signUp(context) async {
    print("created account");

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: "${nextmail.trim()}@Bikgo.com",
          password: userpwdController.text);
      print("Added to firebase Auth");
      print("Adding to Firestore");

      Navigator.pushNamed(context, 'Userpropic.id');
    } on FirebaseAuthException catch (e) {
      _handleSignUpError(e, context);
    }
  }

  void _handleSignUpError(FirebaseException e, context) {
    String message = "";
    switch (e.code) {
      case 'email-already-in-use':
        message = "This email is already in use";
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error,
                size: 32,
              ),
              const SizedBox(width: 16),
              Expanded(
                  child: Text(message,
                      style: const TextStyle(
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
        break;
      case 'invalid-email':
        message =
            "The email you entered is invalid, please ensure no spaces in Bikgo-ID.";

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error,
                size: 32,
              ),
              const SizedBox(width: 16),
              Expanded(
                  child: Text(message,
                      style: const TextStyle(
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
        break;
      case 'operation-not-allowed':
        message = "This operation is not allowed";
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error,
                size: 32,
              ),
              const SizedBox(width: 16),
              Expanded(
                  child: Text(message,
                      style: const TextStyle(
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
        break;
      case 'weak-password':
        message = "The password you entered is too weak";
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error,
                size: 32,
              ),
              const SizedBox(width: 16),
              Expanded(
                  child: Text(message,
                      style: const TextStyle(
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
        break;
      default:
        message = "An Unknown error occured";
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error,
                size: 32,
              ),
              const SizedBox(width: 16),
              Expanded(
                  child: Text(message,
                      style: const TextStyle(
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
        break;
    }
  }
}
