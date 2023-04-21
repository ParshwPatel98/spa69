import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spa69/User/BookApointment.dart';
import 'package:spa69/User/Login.dart';
import 'package:spa69/User/appointmentConfirm.dart';
import 'package:spa69/User/changePassword.dart';
import 'package:spa69/User/offers.dart';
import 'package:spa69/User/onBoarding.dart';
import 'package:spa69/User/otpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spa69/User/resetPaasword.dart';
import 'package:spa69/User/spainfo.dart';
import 'package:spa69/User/splashScreen.dart';
import 'package:spa69/Vendor/VendorHomeScreen.dart';
import 'package:spa69/Vendor/VendorSpaLists.dart';
import 'package:spa69/Vendor/addServices.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spa69/Vendor/vendorLogin.dart';
import 'package:spa69/vendorSignUp.dart';


import 'User/forgotPassword.dart';
import 'User/homePage.dart';
import 'User/nearbySpa.dart';
import 'User/profile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Spa69',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),

      home: splashScreen(),
    );
  }
}


