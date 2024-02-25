import 'package:bigkoapp/globaldetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationSystem {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future initializeCloudMessaging() async {
    //1.Terminated
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? remotemessage) {
      if (remotemessage != null) {
        //display info
        print("RemoteMessage=$remotemessage");
      }
    });
    //2.Foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage? remotemessage) {
      print("RemoteMessageinforeground=$remotemessage");
      //display info
    });
    //3.Background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? remotemessage) {
      print("RemoteMessageinbackground=$remotemessage");
      //display info
    });
  }

  Future generateAndGetToken() async {
    String? registrationToken = await messaging.getToken();
    print("FCM Registration Token:[$registrationToken]");

    DocumentReference userphonetoken = FirebaseFirestore.instance
        .collection('Renter-details')
        .doc(globalUseremail)
        .collection('Token')
        .doc(registrationToken);
    await userphonetoken.set({
      'Email': globalUseremail,
      'Token': registrationToken,
    });
    // messaging.subscribeToTopic("allRenters");
    // messaging.subscribeToTopic("allRiders");
  }
}
