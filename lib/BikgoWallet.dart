import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BikgoWallet extends StatefulWidget {
  const BikgoWallet({Key? key}) : super(key: key);

  @override
  State<BikgoWallet> createState() => _BikgoWalletState();
}

class _BikgoWalletState extends State<BikgoWallet> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          titleTextStyle: const TextStyle(
              color: Colors.yellow, fontSize: 24, fontWeight: FontWeight.bold),
          backgroundColor: Colors.blue.shade900,
          automaticallyImplyLeading: false,
          title: const Text("Bikgo-Wallet"),
          centerTitle: true,
        ),
        backgroundColor: Colors.blue.shade900,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  height: 230,
                  width: 230,
                  child: Lottie.asset('assets/Bikgowallet.json'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Your Bikgo Wallet Consists of the Security-Deposit as part of the Bikgo Guidelines.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold),
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: Card(
                          color: Colors.yellow,
                          child: ListTile(
                            isThreeLine: true,
                            title: Text(
                              "Total ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              children: [
                                SizedBox(
                                  height: 1,
                                ),
                                Text("1000Rs",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black)),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.asset("assets/Bikgo-Icon.png"))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: Card(
                          color: Colors.yellow,
                          child: ListTile(
                            title: Text(
                              "Balance",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              children: [
                                SizedBox(
                                  height: 1,
                                ),
                                Text(
                                  "1000Rs",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.asset("assets/Bikgo-Icon.png"))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
