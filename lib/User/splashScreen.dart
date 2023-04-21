import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:async/async.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spa69/User/BottomNavBar.dart';
import 'package:spa69/User/Login.dart';
import 'package:spa69/User/onBoarding.dart';
import 'package:spa69/Vendor/VendorSpaLists.dart';
import 'package:spa69/common/commontxt.dart';
class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  Color myColor = Color(0xFFC18F2C);
  String? getEmailtxt;
  String? getutype;

  void initState() {
    super.initState();
    getumail();
    // getUserType();
    Timer(Duration(seconds: 3),
            (){
      //
      // getEmailtxt == null || getutype.toString() == "VENDOR"? Get.to(vendorspalists()):Get.to(LoginPage());
              if(getutype.toString() == "VENDOR"){
                getEmailtxt == null || getutype.toString() == "VENDOR"? Get.to(vendorspalists()):Get.to(LoginPage());
              }else{
                getEmailtxt == null || getEmailtxt.toString() == ""? Get.to(LoginPage()):Get.to(BottomNav());
              }

            }
    );
  }

// getUserType() async {
//     SharedPreferences utype = await SharedPreferences.getInstance();
//     setState(() {
//       getutype = utype.getString('utype');
//       print(getutype);
//     }
//     );
//
// }
  getumail() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    setState(() {
      getEmailtxt = sf.getString("umail");
      getutype = sf.getString("utype");
      print("USERTYPECHECK${getutype}");
      print(getEmailtxt);
    });
  }
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(

        backgroundColor: const Color(0xFF1F4B3E) ,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 125,
                  height: 216,
                  color: Colors.transparent,
                  child: SvgPicture.asset("assets/images/logInimage.svg",color: myColor,),
                ),
                Text("Sparks",style: TextStyle(fontSize: 64,color: myColor,fontWeight: FontWeight.w600),)
              ],
            ),
          ),
      ),
    );
  }
}
