import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:spa69/User/Login.dart';
import 'package:spa69/User/otpScreen.dart';
import 'package:email_auth/email_auth.dart';
import 'package:spa69/main.dart';

import '../commonFunction/allcommfunc.dart';


class forgotPassword extends StatefulWidget {
  const forgotPassword({Key? key}) : super(key: key);

  static String verify = "";

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  // TextEditingController countrycode = TextEditingController();
  TextEditingController email = TextEditingController();
  final _forgotpass = Get.put(allfunc());

late EmailAuth emailAuth;
  Color golden = Color(0xFFC18F2C);
  Color green = Color(0xFF1F4B3E) ;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   countrycode.text = "+91";
  //   super.initState();
  // }

@override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF1F4B3E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,size: 30,color: Color(0xFFC18F2C),)),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height*0.78,
            left: w*-0.1,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Color(0xFFC18F2C),width: 2)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 45,bottom: 35),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/svgimages/bottles.svg")
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0,left: 15.0),
                  child: Row(
                    children: [
                      Container(
                        width: w*0.17,
                        height: h*0.1,
                        child: SvgPicture.asset("assets/images/logInimage.svg",color:  Color(0xFFC18F2C),),
                      ),
                      SizedBox(width: w*0.02,),
                      Container(
                        width: w*0.3,
                        height: h*0.05,
                        child: Text("Sparks",style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color:  Color(0xFFC18F2C)
                        ),),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h*0.03,),
                Container(
                  width: w*0.7,
                  height: h*0.3,
                  color: Colors.transparent,
                  child: Image.asset("assets/images/group.png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50,left: 23),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Forgot Password..?",style: TextStyle(fontSize: 24,color: Colors.white),),
                          SizedBox(height: 5,),
                          Text("Enter the email to recover the password",style: TextStyle(fontSize: 15,color: Color( 0xFFACABAB)),)
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: h*0.02),

                //EMAIL FIELD
                Container(
                  width: 380,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextFormField(
                    controller: email,
                    autofocus: false,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      // filled: true,
                      // fillColor: Colors.black,
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email_outlined,),
                        prefixIconColor: Colors.black45,
                        border: InputBorder.none
                    ),
                  ),
                ),

                //CONTINUE BUTTON
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: GestureDetector(
                    onTap: () async {

                    //   try{
                    //     FirebaseAuth.instance.sendPasswordResetEmail(
                    //         email: email.text
                    //     ).then((value) {
                    //       Get.to(LoginPage());
                    //     });
                    //   }on FirebaseAuthException catch(e){
                    //   Fluttertoast.showToast(msg: e.message.toString());
                    //   }


                        _forgotpass.forgotpassfunc(email.text);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width*0.9 ,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color:Color(0xFFC18F2C))
                      ),
                      child: Text("Continue",style: TextStyle(fontSize: 24,color:Color(0xFFC18F2C) ),),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}
