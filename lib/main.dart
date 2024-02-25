import 'dart:async';
import 'package:bigkoapp/Admin-Check/Admin.dart';
import 'package:bigkoapp/Available_Bikes/Marker1.dart';
import 'package:bigkoapp/Available_Bikes/Marker2.dart';
import 'package:bigkoapp/Available_Bikes/Marker3.dart';
import 'package:bigkoapp/Available_Bikes/Marker4.dart';
import 'package:bigkoapp/Available_Bikes/Marker5.dart';
import 'package:bigkoapp/Available_Bikes/Marker6.dart';
import 'package:bigkoapp/BikgoSplashScreen.dart';
import 'package:bigkoapp/BikgoWallet.dart';
import 'package:bigkoapp/Flow-of-Registration/RenterFlow.dart';
import 'package:bigkoapp/Flow-of-Registration/RenterUploads.dart';
import 'package:bigkoapp/Flow-of-Registration/RiderFlow.dart';
import 'package:bigkoapp/Flow-of-Registration/RiderUploads.dart';
import 'package:bigkoapp/Flow-of-Registration/ThankYouForSubmiting.dart';
import 'package:bigkoapp/Flow-of-Registration/UploadInstructionsofRenter.dart';
import 'package:bigkoapp/Flow-of-Registration/UploadInstructionsofRider.dart';
import 'package:bigkoapp/Google_Maps/showavailablerentstoriderinmap.dart';
import 'package:bigkoapp/InfoPage.dart';
import 'package:bigkoapp/Admin-Check/Availableridershow.dart';
import 'package:bigkoapp/Renter/ChatStatus.dart';
import 'package:bigkoapp/Rider_Renter_Connection/BillGeneratedByRenterView.dart';
import 'package:bigkoapp/Rider_Renter_Connection/BillGenerator.dart';
import 'package:bigkoapp/Rider_Renter_Connection/Checkfuelbill.dart';
import 'package:bigkoapp/Renter/ChooseRentType.dart';
import 'package:bigkoapp/Renter/ConfirmationRenter.dart';
import 'package:bigkoapp/Renter/Renter-Edit-Options/Renter-Update-Files/RenterBikeInsuranceUpdate.dart';
import 'package:bigkoapp/Renter/Renter-Edit-Options/Renter-Update-Files/RenterBikePhotoUpdate.dart';
import 'package:bigkoapp/Renter/Renter-Edit-Options/Renter-Update-Files/RenterBikePollutionUpdate.dart';
import 'package:bigkoapp/Renter/Renter-Edit-Options/Renter-Update-Files/RenterBikeRCUpdate.dart';
import 'package:bigkoapp/Renter/Renter-Edit-Options/RenterUpdateBikeDetails.dart';
import 'package:bigkoapp/Renter/Renter-Edit-Options/RenterUpdateBikePhotos.dart';
import 'package:bigkoapp/Renter/Renter-Edit-Options/RenterUpdateUserDetails.dart';
import 'package:bigkoapp/Renter/Renter-Edit-Options/RenterUpdateUserPhotos.dart';
import 'package:bigkoapp/Renter/Renter-Edit-Options/RenterViewBikeDetails.dart';
import 'package:bigkoapp/Renter/Renter-Edit-Options/RenterViewUserDetails.dart';

import 'package:bigkoapp/Renter/Renter-Side-Screens/RenterChatHistory.dart';
import 'package:bigkoapp/Renter/Renter-Side-Screens/RenterHistory.dart';
import 'package:bigkoapp/Renter/Renter-Side-Screens/RenterProfile.dart';
import 'package:bigkoapp/Renter/Renter-Side-Screens/RenterSideChatRoom.dart';
import 'package:bigkoapp/Renter/SlotRent.dart';
import 'package:bigkoapp/Renter/Starttrip.dart';
import 'package:bigkoapp/Rider-Edit-Details/RiderUpdateDetails.dart';
import 'package:bigkoapp/Rider-Edit-Details/RiderUpdatePhotos.dart';
import 'package:bigkoapp/Rider-Edit-Details/RiderViewDetails.dart';
import 'package:bigkoapp/Rider-Side-Screens/RiderChatHistory.dart';
import 'package:bigkoapp/Rider-Side-Screens/RiderChatRoom.dart';

import 'package:bigkoapp/Rider-Side-Screens/RiderTabs.dart';
import 'package:bigkoapp/Rider/Cashpaymentfortrip.dart';
import 'package:bigkoapp/Rider/Cashpaymentfortripwithfuel.dart';
import 'package:bigkoapp/Rider/Confirmridertousebike.dart';
import 'package:bigkoapp/Renter/RenterBikeInsurance.dart';
import 'package:bigkoapp/Renter/RenterBikePhoto.dart';
import 'package:bigkoapp/Renter/RenterPollutioncertificate.dart';
import 'package:bigkoapp/Renter/RenterReview.dart';
import 'package:bigkoapp/Renter/RenterSelfieUpload.dart';
import 'package:bigkoapp/Admin-Check/Selectedriderforbike.dart';
import 'package:bigkoapp/Rider/AvailableBikesShow.dart';
import 'package:bigkoapp/Rider/ChooseRidetype.dart';
import 'package:bigkoapp/Rider/ClearViewBike.dart';
import 'package:bigkoapp/Rider/ConfirmRiderWithInstructions.dart';
import 'package:bigkoapp/Renter/Takebiketoride.dart';
import 'package:bigkoapp/Rider/Rider-Update-Files/RiderUpdateBackLicense.dart';
import 'package:bigkoapp/Rider/Rider-Update-Files/RiderUpdateFrontLicense.dart';
import 'package:bigkoapp/Rider/Rider-Update-Files/RiderUpdateSelfie.dart';
import 'package:bigkoapp/Rider/SlotRide.dart';
import 'package:bigkoapp/Rider/TripBillforisfuel.dart';
import 'package:bigkoapp/Rider/TripBilltorider.dart';
import 'package:bigkoapp/Rider/whiletripwithbike.dart';
import 'package:bigkoapp/Rider/whiletripwithfuel.dart';
import 'package:bigkoapp/Rider_Renter_Connection/ConnectRentertoRider.dart';
import 'package:bigkoapp/Rider_Renter_Connection/ConnectRidertoRenter.dart';
import 'package:bigkoapp/Rider_Renter_Connection/PreviewBill.dart';
import 'package:bigkoapp/Rider_Renter_Connection/RatingsForRFR.dart';
import 'package:bigkoapp/Rider_Renter_Connection/RenterAcceptUndertaking.dart';
import 'package:bigkoapp/Rider_Renter_Connection/RenterReceivedPayment.dart';
import 'package:bigkoapp/Rider_Renter_Connection/RiderDrivingScreen.dart';
import 'package:bigkoapp/Rider_Renter_Connection/RiderSideUndertakingAccepted.dart';
import 'package:bigkoapp/Rider_Renter_Connection/RiderUndertaking.dart';
import 'package:bigkoapp/Rider_Renter_Connection/TakeRiderInputsToRent.dart';
import 'package:bigkoapp/Rider_Renter_Connection/TrackingRider.dart';
import 'package:bigkoapp/SecurityCheck.dart';
import 'package:bigkoapp/Subscriptionscreen.dart';
import 'package:bigkoapp/Uploaduserpropic.dart';
import 'package:bigkoapp/Userprofilepage.dart';

import 'package:bigkoapp/Rider/RiderReviewDetails.dart';
import 'package:bigkoapp/Rider/SelectedBiketoride.dart';

import 'package:bigkoapp/Customertype.dart';
import 'package:bigkoapp/ForgetPasswordscreen.dart';
import 'package:bigkoapp/OnBoardingPage.dart';
import 'package:bigkoapp/Flow-of-Registration/RenterBikeProvider.dart';
import 'package:bigkoapp/Renter/RenterBikeRCUpload.dart';
import 'package:bigkoapp/Flow-of-Registration/RideBikeUser.dart';
import 'package:bigkoapp/Rider/RiderBackLicense.dart';
import 'package:bigkoapp/Rider/RiderFrontLicense.dart';
import 'package:bigkoapp/Rider/RiderSelfieUpload.dart';
import 'package:bigkoapp/SignUp.dart';
import 'package:bigkoapp/VerificationScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'HomePage.dart';
import 'Renter/Renter-Side-Screens/RenterTabs.dart';
import 'user_simple_preferences_bikgo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getToken();
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  NotificationSettings notificationSettings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission:${notificationSettings.authorizationStatus}');

  FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
    print('Got a message while in the foreground!');
    print('Message data:${remoteMessage.data}');

    if (remoteMessage.notification != null) {
      print("Message also contained a notification : ${remoteMessage.data}");
    }
  });
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await UserSimplePreferences.init();

  print("Main condition");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(dividerColor: Colors.black),
      initialRoute: 'SplashScreen.id',
      title: 'Bikgo',
      routes: {
        'OnBoard.id': (context) => const OnBoardingPage(),
        'SplashScreen.id': (context) => const BikgoSplashScreen(),
        'Customer.id': (context) => const Customertype(),
        'SignUp.id': (context) => const SignUpPage(),
        'Home.id': (context) => HomePage(),
        'RenterBike.id': (context) => const RentBikeProvider(),
        'RiderBike.id': (context) => const RideBikeUser(),
        'Verification.id': (context) => const VerificationScreen(),
        'FrontLicense.id': (context) => const RiderFrontLicense(),
        'ForgetPassword.id': (context) => const ForgetPasswordScreen(),
        'BackLicense.id': (context) => const RiderBackLicense(),
        'RiderSelfieUpload.id': (context) => const RiderSelfieUpload(),
        'RenterBikeRCUpload.id': (context) => const RenterBikeRCUpload(),
        'RenterPollutionCertificate.id': (context) =>
            const RenterPollutioncertificate(),
        'RenterBikeInsurance.id': (context) => const RenterBikeInsurance(),
        'RenterBikePhoto.id': (context) => const RenterBikePhoto(),
        'RenterSelfieUpload.id': (context) => const RenterSelfieUpload(),
        'RenterFlow.id': (context) => const RenterFlow(),
        'UploadRenterInstructions.id': (context) => const UploadInstructions(),
        'RenterConfirm.id': (context) => const ConfirmRenterWithInstructions(),
        'RiderFlow.id': (context) => const RiderFlow(),
        'UploadRiderInstructions.id': (context) =>
            const UploadInstructionsofRider(),
        'RiderConfirm.id': (context) => const ConfirmRiderWithInstructions(),
        'ThankYouUserforDetails.id': (context) => const ThankYou(),
        'ReviewRider.id': (context) => const RiderReview(),
        'ReviewRenter.id': (context) => const RenterReview(),
        'Admin.id': (context) => const AdminAcount(),
        'RiderAdmin.id': (context) => const RiderAdminSection(),
        'PresentAccount.id': (context) => const SignUpRiderAdminSection(),
        'ChooseRidetype.id': (context) => const RideTypeByUser(),
        'ChooseRenttype.id': (context) => const ChooseRentType(),
        'Availableshowtorider.id': (context) => const Availableshowtorider(),
        'SelectedBikeByRider.id': (context) => const SelectedBikeToRide(),
        'Clearbikeview.id': (context) => const Clearbikeview(),
        'Availableridershow.id': (context) => const Availableridershow(),
        'Renterselectrider.id': (context) => const SelectedBike(),
        'Confirmmsgfromrenter.id': (context) => const Confirmrider(),
        'takebiketoride.id': (context) => const Takebiketoride(),
        'chatstatus.id': (context) => const Chatstatus(),
        'starttrip.id': (context) => const Starttrip(),
        'whiletripwithoutfuel.id': (context) => const Whiletripwithbike(),
        'checkfuelbill.id': (context) => const Checkfuelbill(),
        'Billtorider.id': (context) => const TripBilltorider(),
        'cashpaymentbyrider.id': (context) => const Cashpaymentbyrider(),
        'userprofile.id': (context) => const Userprofile(),
        'infopage.id': (context) => const InfoPage(),
        'whiletripwithfuel.id': (context) => const Whietripwithfuel(),
        'whiletripwithbike.id': (context) => const Whiletripwithbike(),
        'tripbillforisfuel.id': (context) => const TripBillforisfuel(),
        'cashpaymentbyriderwithfuel.id': (context) =>
            const Cashpaymentwithfuelfortrip(),
        'slotride.id': (context) => const SlotRide(),
        'slotrent.id': (context) => const SlotRent(),
        'Userpropic.id': (context) => const UploadUserpropic(),
        'SecuritySection.id': (context) => const SecurityCheck(),
        'ReviewRiderUpload.id': (context) => const RiderUploads(),
        'ReviewRenterUpload.id': (context) => const RenterUploads(),
        'ShowMapstoRider.id': (context) => const ShowMapsOfBikestoRider(),
        'RiderTabs.id': (context) => const RiderSideTabView(),
        'RiderViewDetails.id': (context) => const RiderViewDetailsForProfile(),
        'RiderUpdatePhotos.id': (context) => const RiderUpdatePhotos(),
        'RiderUpdateDetails.id': (context) => const RiderUpdateDetails(),
        'RenterHistory.id': (context) => const RenterHistory(),
        'RenterChatHistory.id': (context) => const RenterChatHistory(),
        'RenterTabs.id': (context) => const RenterSideTabView(),
        'RenterProfile.id': (context) => const Rentbikenow(),
        'RenterViewUserDetails.id': (context) => const RenterViewUserDetails(),
        'RenterViewBikeDetails.id': (context) => const RenterViewBikeDetails(),
        'RenterUpdateUserDetails.id': (context) =>
            const RenterUpdateUserDetails(),
        'RenterUpdateBikeDetails.id': (context) =>
            const RenterUpdateBikeDetails(),
        'RenterUpdateBikePhotos.id': (context) =>
            const RenterUpdateBikePhotos(),
        'RenterUpdateUserPhotos.id': (context) =>
            const RenterUpdateUserPhotos(),
        'RenterBikeInsuranceUpdate.id': (context) =>
            const RenterBikeInsuranceUpdate(),
        'RenterBikePhotoUpdate.id': (context) => const RenterBikePhotoUpdate(),
        'RenterBikePollutionUpdate.id': (context) =>
            const RenterBikePollutionUpdate(),
        'RenterBikeRCUpdate.id': (context) => const RenterBikeRCUpdate(),
        'RiderUpdateSelfie.id': (context) => const RiderUpdatSelfie(),
        'RiderUpdateFrontLicense.id': (context) =>
            const RiderUpdateFrontLicense(),
        'RiderUpdateBackLicense.id': (context) =>
            const RiderUpdateBackLicense(),
        'SubscriptionScreen.id': (context) => const SubscriptionScreen(),
        'MarkerOneScreen.id': (context) => const MarkerOne(),
        'MarkerTwoScreen.id': (context) => const MarkerTwo(),
        'MarkerThreeScreen.id': (context) => const MarkerThree(),
        'MarkerFourScreen.id': (context) => const MarkerFour(),
        'MarkerFiveScreen.id': (context) => const MarkerFive(),
        'MarkerSixScreen.id': (context) => const MarkerSix(),
        'RiderSideChatRoom.id': (context) => RiderChatRoom(),
        'RiderChatScreen.id': (context) => const RiderChatTab(),
        'RenterSideChatRoom.id': (context) => RenterChatRoom(),
        'RenterChatScreen.id': (context) => const RenterChatHistory(),
        'ConnectRentertoRider1.id': (context) =>
            const StartConnecttoRiderfromRenter(),
        'ConnectRidertoRenter1.id': (context) => const ConnetRidertoRenter(),
        'BikgoWallet.id': (context) => const BikgoWallet(),
        'RiderUndertaking.id': (context) => const RiderUndertaking(),
        'RenterAcceptUndertaking.id': (context) =>
            const RenterAcceptUndertaking(),
        'RenterEnterRentalDetails.id': (context) =>
            const StartTakingInputByRider(),
        'PreviewBill.id': (context) => const PreviewBillDetails(),
        'RiderSideUndertakingAccepted.id': (context) =>
            const RiderSideUndertakingAccepted(),
        'RiderDrivingScreen.id': (context) => const RiderDrivingScreen(),
        'RentalBill.id': (context) => const BillGenerationForTrip(),
        'RenterReceivedAmount.id': (context) => const RenterGotPaid(),
        'TrackingRiderWhileTrip.id': (context) =>
            const TrackTheRiderWhileTrip(),
        'BillGeneratedByRenter.id': (context) => const BillGeneratedByRenter(),
        'RatingsForRFR.id': (context) => const RatingsForRide()
      },
    );
  }
}
