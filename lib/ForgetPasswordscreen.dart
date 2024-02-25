import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final helpmailController = TextEditingController();

  @override
  void dispose() {
    helpmailController.dispose();
    super.dispose();
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
                    Navigator.pushNamed(context, 'Home.id');
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Don't worry,",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.yellow),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Enter Your",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.yellow),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Recovery",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.yellow),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Mail ID",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.yellow),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "To Reset",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.yellow),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Your Password!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.yellow),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Card(
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: SizedBox(
                    width: 330,
                    height: 230,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          width: 370,
                          child: TextField(
                            decoration: const InputDecoration(
                              labelText: 'Mail',
                              hintText: 'Your Recovery Mail-ID',
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(),
                            ),
                            controller: helpmailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, 'SecuritySection.id');
                            },
                            child: const Text(
                              "Forget-Recovery-Mail ?",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            )),
                        Builder(builder: (context) {
                          return SizedBox(
                            height: 60,
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
                                  if (helpmailController.text == "") {
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
                                                  'The Email cannot be empty.',
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
                                  } else {
                                    resetPassword(context);
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.done,
                                            size: 32,
                                            color: Colors.blue.shade900,
                                          ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                              child: Text(
                                                  'The Password reset mail has been sent to ${helpmailController.text}.',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors
                                                          .blue.shade900)))
                                        ],
                                      ),
                                      backgroundColor: Colors.white,
                                      duration: const Duration(seconds: 4),
                                      shape: const StadiumBorder(),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 12),
                                      behavior: SnackBarBehavior.floating,
                                      elevation: 0,
                                    ));
                                    Navigator.pushNamed(context, 'Home.id');
                                  }
                                },
                                child: const Text(
                                  "Reset-Password",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow),
                                )),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future resetPassword(context) async {
    String emessage = "";
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: helpmailController.text);
    } on FirebaseAuthException catch (e) {
      emessage = e.toString();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 32,
            ),
            const SizedBox(width: 16),
            Expanded(
                child: Text(emessage, style: const TextStyle(fontSize: 20)))
          ],
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        shape: const StadiumBorder(),
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ));
    }
  }
}
