// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:otp_text_field/otp_text_field.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';
// import 'forgotPassword.dart';
// import 'package:pinput/pinput.dart';
// import 'package:spa69/User/resetPaasword.dart';
// class otpScreen extends StatefulWidget {
//   const otpScreen({Key? key}) : super(key: key);
//
//   @override
//   State<otpScreen> createState() => _otpScreenState();
// }
//
// class _otpScreenState extends State<otpScreen> {
//   OtpFieldController otpController = OtpFieldController();
//   Color golden = Color(0xFFC18F2C);
//   Color green = Color(0xFF1F4B3E) ;
//   FirebaseAuth auth = FirebaseAuth.instance;
//   var code = " ";
//   @override
//   Widget build(BuildContext context) {
//     final w = MediaQuery.of(context).size.width;
//     final h = MediaQuery.of(context).size.height;
//
//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
//       decoration: BoxDecoration(
//         border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
//         borderRadius: BorderRadius.circular(20),
//       ),
//     );
//
//     final focusedPinTheme = defaultPinTheme.copyDecorationWith(
//       border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
//       borderRadius: BorderRadius.circular(8),
//     );
//
//     final submittedPinTheme = defaultPinTheme.copyWith(
//       decoration: defaultPinTheme.decoration?.copyWith(
//         color: Color.fromRGBO(234, 239, 243, 1),
//       ),
//     );
//
//     return Scaffold(
//       backgroundColor: const Color(0xFF1F4B3E),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(Icons.arrow_back,size: 30,color: Color(0xFFC18F2C),)),
//       ),
//         body: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             Positioned(
//               top: MediaQuery.of(context).size.height*0.78,
//               left: w*-0.1,
//               child: Container(
//                 width: 130,
//                 height: 130,
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Color(0xFFC18F2C),width: 2)
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 45,bottom: 35),
//                   child: Row(
//                     children: [
//                     SvgPicture.asset("assets/svgimages/bottles.svg")
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 15.0,left: 15.0),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: w*0.17,
//                           height: h*0.1,
//                           child: SvgPicture.asset("assets/images/logInimage.svg",color:  Color(0xFFC18F2C),),
//                         ),
//                         SizedBox(width: w*0.02,),
//                         Container(
//                           width: w*0.3,
//                           height: h*0.05,
//                           child: Text("Sparks",style: TextStyle(
//                               fontSize: 32,
//                               fontWeight: FontWeight.w600,
//                               color:  Color(0xFFC18F2C)
//                           ),),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: h*0.05,),
//                   Container(
//                     width: w*0.7,
//                     height: h*0.25,
//                     color: Colors.transparent,
//                     child: Image.asset("assets/images/otp.png"),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: h*0.06,left: w*0.05),
//                     child: Row(
//                       // mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Verification code",style: TextStyle(fontSize: 24,color: Colors.white),),
//                             SizedBox(height: 5,),
//                             Text("We sent to the e-mail xxxxxxx@gmail.com",style: TextStyle(fontSize: 15,color: Color( 0xFFACABAB)),)
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                     SizedBox(height: h*0.02,),
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       height: 50,
//                       child:  Pinput(
//                         length: 6,
//                         showCursor: true,
//                           onChanged: (value){
//                           code = value;
//                           },
//                       ),
//                     ),
//
//                   //RESEND OTP TEXT
//                   SizedBox(height: h*0.02,),
//                   Padding(
//                     padding:  EdgeInsets.only(left: w*0.06),
//                     child: Row(
//                       children: [
//                         Text("RESEND OTP",style: TextStyle(fontSize: 15,color: Colors.white),),
//                         Icon(Icons.arrow_right_rounded,color: Colors.white,)
//                       ],
//                     ),
//                   ),
//
//                   //VERIFY BUTTON
//                   Padding(
//                     padding: EdgeInsets.only(top: h*0.04),
//
//                     child: GestureDetector(
//                       onTap: () async {
//                         // try {
//                         //   PhoneAuthCredential credential = PhoneAuthProvider
//                         //       .credential(
//                         //     verificationId: forgotPassword.varify,
//                         //     smsCode: code,
//                         //
//                         //   );
//                         //   await auth.signInWithCredential(credential).then((value){
//                         //   Get.to(resetPassword());
//                         //   });
//                         //
//                         // }on FirebaseAuthException catch(e){
//                         //   Fluttertoast.showToast(msg: e.toString());
//                         // }
//                         try{
//                           PhoneAuthCredential credential = PhoneAuthProvider.credential(
//                               verificationId: forgotPassword.verify,
//                               smsCode:code
//                           );
//
//                           // Sign the user in (or link) with the credential
//                           await auth.signInWithCredential(credential);
//                           Get.to(resetPassword());
//                         }on FirebaseAuthException catch (e){
//                           Fluttertoast.showToast(msg: e.message.toString());
//                         }
//
//
//                       },
//                       child: Container(
//                         alignment: Alignment.center,
//                         width: MediaQuery.of(context).size.width*0.9 ,
//                         height: 50,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color:Color(0xFFC18F2C))
//                         ),
//                         child: Text("Verify",style: TextStyle(fontSize: 24,color:Color(0xFFC18F2C) ),),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         )
//     );
//   }
// }
