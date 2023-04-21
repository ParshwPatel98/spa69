import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:spa69/User/BottomNavBar.dart';
import 'package:spa69/User/Login.dart';
import 'package:spa69/User/homePage.dart';
import 'package:spa69/Vendor/VendorHomeScreen.dart';

import 'commonFunction/allcommfunc.dart';
class vendorSignUp extends StatefulWidget {
  const vendorSignUp({Key? key}) : super(key: key);

  @override
  State<vendorSignUp> createState() => _vendorSignUpState();
}

class _vendorSignUpState extends State<vendorSignUp> {

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController mobno = TextEditingController();
  final appstore = FirebaseFirestore.instance;
  final _signup=Get.put(allfunc());
  bool txt = true;

  // String dropdownValue = list.first;
  String? dropdownvalue;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    // List of items in our dropdown menu
    return  Scaffold(
      backgroundColor: const Color(0xFF1F4B3E),
      body: Obx(
         () {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Positioned(
                  top: -h*0.15,
                  left: w*0.65,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Color(0xFF1F4B3E),
                        shape: BoxShape.circle,
                        border: Border.all(color:Color(0xFFC18F2C),width: 2)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 120,left: 60),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/svgimages/bottles.svg")                   ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: h*0.83,
                  left: -w*0.37,
                  child: Container(
                    // alignment: Alignment.center,
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Color(0xFF1F4B3E),
                        shape: BoxShape.circle,
                        border: Border.all(color:Color(0xFFC18F2C),width: 2)
                    ),
                    child:Padding(
                      padding: const EdgeInsets.only(left: 180,bottom: 120),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.center,
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
                        padding: const EdgeInsets.only(left: 20,top: 40),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 54,
                              height: 87,
                              child: SvgPicture.asset("assets/images/logInimage.svg",color:  Color(0xFFC18F2C),),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 110,
                              height: 40,
                              child: Text("Sparks",style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color:  Color(0xFFC18F2C)
                              ),),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 200,),
                      Container(
                        width: 380,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DropdownButton(
                              // Initial Value
                              value: dropdownvalue,
                              // Down Arrow Icon
                              icon: Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: const Icon(Icons.keyboard_arrow_down),
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                              underline: Container(),
                              // Array list of items
                              isExpanded: true,
                              hint: Text("Choose"),
                              // alignment: Alignment.center,

                              items:const [
                                DropdownMenuItem(
                                  value: 'USER',
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 12.0),
                                    child: Text("USER",style: TextStyle(fontWeight: FontWeight.w500),),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'VENDOR',
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 12.0),
                                    child: Text("VENDOR",style: TextStyle(fontWeight: FontWeight.w500),),
                                  ),
                                ),
                              ],
                              // After selecting the desired option, it will
                              // change button value to selected value
                            ),
                          ],
                      ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: 380,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextFormField(
                          controller: name,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            // filled: true,
                            // fillColor: Colors.black,
                              hintText: "Name",
                              prefixIcon: Icon(Icons.person,),
                              prefixIconColor: Colors.black45,
                              border: InputBorder.none
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: 380,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextFormField(
                          controller: email,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email_outlined,),
                            prefixIconColor: Colors.black54,
                            border: InputBorder.none,

                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: 380,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextFormField(
                          controller: mobno,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: "Mobile No.",
                            prefixIcon: Icon(Icons.call,),
                            prefixIconColor: Colors.black54,
                            border: InputBorder.none,

                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: 380,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextFormField(
                          obscureText: txt,
                          controller: pass,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              hintText: "Passowrd",
                              prefixIcon: Icon(Icons.security,),
                              prefixIconColor: Colors.black54,
                              border: InputBorder.none,
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                     if(txt == true){
                                       txt = false;
                                     }else{
                                       txt = true;
                                     }

                                    });
                                  },
                                  child: Icon(Icons.remove_red_eye_outlined)),
                              suffixIconColor: Colors.black45
                          ),
                        ),
                      ),
                      SizedBox(height: 35,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav(),));
                        },
                        child: GestureDetector(
                          onTap: () async {

                            _signup.signupfunc(email.text, pass.text, name.text, mobno.text, dropdownvalue);

                            },
                          child: Container(
                            alignment: Alignment.center,
                            width: 380,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Color(0xFFC18F2C)),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text("Sign Up",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color:Color(0xFFC18F2C) ),),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
                Positioned(
                  top: 171.74,
                  left: 305,
                  child: Container(
                    width: 13.4,
                    height: 14.55,
                    color: Colors.transparent,
                    child: Image.asset("assets/images/smallstar.png"),
                  ),
                ),
                Positioned(
                  top: 275,
                  left: 92.88,
                  child: Container(
                    width: 16.12,
                    height: 17.51,
                    child: Image.asset("assets/images/mediumstar.png"),
                  ),
                ),
                Positioned(
                  top: 243,
                  left: 305,
                  child: Container(
                    width: 29,
                    height: 31.5,
                    child: Image.asset("assets/images/largestar.png"),
                  ),
                ),
                Positioned(
                  top: 265,
                  left: 140,
                  child: Container(
                    child: Text("SIGN UP",style: TextStyle(fontSize: 32,color: Colors.white),),
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
