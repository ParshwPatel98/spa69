// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:spa69/User/Login.dart';
// class resetPassword extends StatefulWidget {
//   const resetPassword({Key? key}) : super(key: key);
//
//   @override
//   State<resetPassword> createState() => _resetPasswordState();
// }
//
// class _resetPasswordState extends State<resetPassword> {
//   TextEditingController pass=TextEditingController();
//   TextEditingController confpass=TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     final w = MediaQuery.of(context).size.width;
//     final h = MediaQuery.of(context).size.height;
//     return Scaffold(
//         backgroundColor: const Color(0xFF1F4B3E),
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           leading: GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Icon(Icons.arrow_back,size: 30,color: Color(0xFFC18F2C),)),
//         ),
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
//                       SvgPicture.asset("assets/svgimages/bottles.svg")
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
//                         SizedBox(width: 20,),
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
//                   SizedBox(height: h*0.01,),
//                   Container(
//                     width: w*0.7,
//                     height: h*0.3,
//                     color: Colors.transparent,
//                     child: Image.asset("assets/images/group.png"),
//                   ),
//                   Padding(
//                     padding:  EdgeInsets.only(top: h*0.06,left: w*0.055),
//                     child: Row(
//                       // mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Reset Password..?",style: TextStyle(fontSize: 24,color: Colors.white),),
//
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: h*0.015,),
//
//                   //PASSWORD FIELD
//                   Container(
//                     width: MediaQuery.of(context).size.width*0.9,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.white
//                     ),
//                     child: TextFormField(
//                       controller: pass,
//                       decoration: InputDecoration(
//                         hintText: "Password",
//                         prefixIcon: Icon(Icons.lock),
//                         suffixIcon: Icon(Icons.remove_red_eye_outlined),
//                         border: InputBorder.none
//                       ),
//                     ),
//                   ),
//                   SizedBox(height:20 ,),
//
//                   //CONFIRM PASSWORD FIELD
//                   Container(
//                     width: MediaQuery.of(context).size.width*0.9,
//                     height: 50,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.white
//                     ),
//                     child: TextFormField(
//                       controller: confpass,
//                       decoration: InputDecoration(
//                           hintText: "Confirm Password",
//                           prefixIcon: Icon(Icons.lock),
//                           suffixIcon: Icon(Icons.remove_red_eye_outlined),
//                           border: InputBorder.none
//                       ),
//                     ),
//                   ),
//
//
//
//                   // SizedBox(height: 15,),
//
//                   Padding(
//                     padding:  EdgeInsets.only(top: h*0.04),
//                     child: GestureDetector(
//                       onTap: () async {
//                         //Create an instance of the current user.
//                        if(pass.text == confpass.text){
//                          final auth = await FirebaseAuth.instance;
//
//
//                          //Pass in the password to updatePassword.
//                          auth.currentUser!.updatePassword(confpass.text).then((_){
//
//                            Fluttertoast.showToast(msg: "Password Chnaged Succesfully".toString());
//                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
//                          }).catchError((e){
//                            Fluttertoast.showToast(msg: e.message.toString());
//                            //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
//                          });
//                        }else{
//                          Fluttertoast.showToast(msg: "Password Does Not Match");
//                        }
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
//                         child: Text("Continue",style: TextStyle(fontSize: 24,color:Color(0xFFC18F2C) ),),
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
