import 'dart:async';
import 'package:bigkoapp/SignUp.dart';
import 'package:bigkoapp/Customertype.dart';
import 'package:bigkoapp/ForgetPasswordscreen.dart';
import 'package:bigkoapp/OnBoardingPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Admin-Check/AdminRenterUsers.dart';
import 'globaldetails.dart';
import 'user_simple_preferences_bikgo.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final emailController = TextEditingController();
  final userpassword = TextEditingController();
  String password = "";
  String UserEmail = '';

  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          backgroundColor: Colors.blue.shade900,
          body: SingleChildScrollView(
              child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: IconButton(
                alignment: Alignment.centerLeft,
                color: Colors.white,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushNamed(context, 'OnBoard.id');
                },
              ),
            ),
            const AnimatedImage(),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: const Text(
                'Hi !',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.yellow),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: const Text(
                'Welcome',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.yellow),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: const Text(
                'We are waiting for you, please enter your details.',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Card(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: SizedBox(
                  width: 330,
                  height: 245,
                  child: Column(children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: 370,
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Bikgo-ID',
                          hintText: 'Your Bikgo-ID',
                          suffixText: "@Bikgo.com",
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                        ),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 370,
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        controller: userpassword,
                        onChanged: ((value) => setState(() {
                              password = value;
                            })),
                        onSubmitted: ((value) => setState(() {
                              password = value;
                            })),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Your Password',
                          suffixIcon: IconButton(
                            icon: isPasswordVisible
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.black,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  ),
                            onPressed: () => setState(
                                (() => isPasswordVisible = !isPasswordVisible)),
                          ),
                          border: const OutlineInputBorder(),
                        ),
                        obscureText: isPasswordVisible,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'ForgetPassword.id');
                            },
                            child: const Text(
                              "Forget-Password?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ))),
                  ]),
                ),
              ),
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                  text: "Don't have an Account?  ",
                  children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("context");
                            Navigator.pushNamed(context, 'SignUp.id');
                          },
                        text: 'SignUp',
                        style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.yellow))
                  ]),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 60,
              width: 350,
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
                    if (emailController.text != "" && password != "") {
                      userpassword.text = password;
                      signIn(context);
                    } else {
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
                                    'Please Enter Your Details to Login.',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)))
                          ],
                        ),
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 2),
                        shape: const StadiumBorder(),
                        margin: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 12),
                        behavior: SnackBarBehavior.floating,
                        elevation: 0,
                      ));
                    }
                  },
                  child: const Text(
                    "Log-In",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow),
                  )),
            ),
            const SizedBox(
              height: 10,
            )
          ]))),
    );
  }

  signIn(context) async {
    print("Hello");
    String errormessage = "";
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var kmail =
          prefs.setString('email', emailController.text.trim() + "@Bikgo.com");
      print(kmail);
      globalUseremail = emailController.text.trim() + "@Bikgo.com";
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim() + "@Bikgo.com",
          password: userpassword.text);
      print("User-logged-in");
      print(globalUseremail);
      if (emailController.text.trim() == "developerdeepak123@Bikgo.com" &&
          userpassword.text == "deepak123") {
        print("Welcome Admin");
        Navigator.pushNamed(context, 'Admin.id');
      } else {
        Navigator.pushNamed(context, 'Customer.id');
      }
    } on FirebaseAuthException catch (e) {
      errormessage = e.message!;
      print(errormessage);
      _handleSignInError(e, context);
      print("Hi");
    }
  }

  void _handleSignInError(FirebaseAuthException e, context) {
    String message = "";
    switch (e.code) {
      case 'user-not-found':
        message =
            "There was no such account found, please create one before logging in.";
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
        SnackBar(
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
        );
        break;
      default:
        message = "Email/Password is incorrect.";
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

class AnimatedImage extends StatefulWidget {
  const AnimatedImage({Key? key}) : super(key: key);

  @override
  State<AnimatedImage> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 3))
        ..repeat(reverse: true);

  late final Animation<Offset> _animation =
      Tween(begin: Offset.zero, end: const Offset(0, 0.08))
          .animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: 250,
          width: 250,
          child: GestureDetector(
            child: Container(
              child: Image.asset("assets/Bikgo-Icon.png"),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.white)),
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
