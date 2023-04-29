import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spa69/User/BottomNavBar.dart';
import 'package:spa69/User/homePage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spa69/Vendor/VendorSpaLists.dart';
import 'package:spa69/common/commontxt.dart';
import '../Vendor/VendorHomeScreen.dart';
import '../commonFunction/allcommfunc.dart';
import '../vendorSignUp.dart';
import 'forgotPassword.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 TextEditingController email = TextEditingController();
 TextEditingController pass = TextEditingController();
 final appstore = FirebaseFirestore.instance;
 FirebaseAuth auth = FirebaseAuth.instance;
 String? typ;
bool viewpass = true;
// final loading = false.obs;


final _login=Get.put(allfunc());
String? dropdownvalue;


  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Obx(
      () {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xFF1F4B3E),
          body: Stack(
            children: [
              //FIRST RIGHT BOTTLES
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
                    padding:  EdgeInsets.only(top: h*0.13,left: w*0.15),
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

              //SECOND BOTTOM BOTTLES
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
                    padding: EdgeInsets.only(left: w*0.45,bottom: h*0.15),
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

              //STARS
              Positioned(
                top: h*0.19,
                left: w*0.75,
                child: Container(
                  width: 13.4,
                  height: 14.55,
                  color: Colors.transparent,
                  child: Image.asset("assets/images/smallstar.png"),
                ),
              ),

              //STAR
              Positioned(
                top: h*0.315,
                left: w*0.25,
                child: Container(
                  width: 16.12,
                  height: 17.51,
                  child: Image.asset("assets/images/mediumstar.png"),
                ),
              ),

              //STAR
              Positioned(
                top: h*0.29,
                left: 305,
                child: Container(
                  width: 29,
                  height: 31.5,
                  child: Image.asset("assets/images/largestar.png"),
                ),
              ),

              //LOGIN TEXT
              Positioned(
                top:  h*0.305,
                left: w*0.35,
                child: Container(
                  child: Text("LOG IN",style: TextStyle(fontSize: 32,color: Colors.white),),
                ),
              ),

              //MAIN COLUMN
              Expanded(
                child: Column(
                      children: [
                        SizedBox(height: h*0.05,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,top: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //GIRL IMAGE
                              Container(
                                width: w*0.17,
                                height: h*0.1,
                                child: SvgPicture.asset("assets/images/logInimage.svg",color:  Color(0xFFC18F2C),),
                              ),
                              SizedBox(width: w*0.05,),

                              //SPARKS TEXT
                              Container(
                                width: w*0.3,
                                height: h*0.05,
                                child: Text("Sparks",style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600,
                                  color:  Color(0xFFC18F2C)
                                ),),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: h*0.25,),

                        Row(
                          children: [
                            Container(width: w*0.04,),
                            Text('Plsease select your acount type:',style: TextStyle(fontSize: 15,color: Colors.white),),
                          ],
                        ),
                        SizedBox(height: h*0.01,),
                        //DROPDOWN BUTTON
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
                                hint: Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Text("Choose"),
                                ),
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
                        SizedBox(height: h*0.03,),

                        //EMAIL TEXTFORM FIELD
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
                        SizedBox(height: h*0.03,),

                       //PASSWORD TEXTFORM FIELD
                        Container(
                          width: 380,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: TextFormField(
                            obscureText: viewpass,
                            controller: pass,
                            autofocus: false,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                hintText: "Passowrd",
                                prefixIcon: Icon(Icons.security,),
                                prefixIconColor: Colors.black54,
                                border: InputBorder.none,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if(viewpass==true){
                                      viewpass = false;
                                    }else{
                                      viewpass = true;
                                    }
                                  });
                                },
                                  child: Icon(Icons.remove_red_eye_outlined)),
                              suffixIconColor: Colors.black45
                            ),
                          ),
                        ),

                        //FORGOT PASSWORD
                        Padding(
                          padding: const EdgeInsets.only(right: 20,top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => forgotPassword(),));
                                },
                                child: Text("Forgot Password?",style: TextStyle(
                                  fontSize:16,
                                  color: Colors.white,
                                ),),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: h*0.03,),


                        //LOGIN BOTTOM
                        _login.loading.value ? CupertinoActivityIndicator(
                          color: Colors.white,
                          radius: 20,
                        ) :

                        GestureDetector(
                          onTap: () async {
                            _login.loginfunc(email.text, pass.text,dropdownvalue.toString());
                            print(typ);

                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: w*0.92,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: Color(0xFFC18F2C)),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text("Login",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color:Color(0xFFC18F2C) ),),
                          ),
                        ),
                        SizedBox(height: h*0.02,),

                        //DONT HAVE AN ACCOUNT
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don’t Have an Account?",style: TextStyle(color: Colors.white,fontSize: 15,),),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => vendorSignUp(),));
                                  },
                                  child: Text("SignUp",style: TextStyle(color:Color(0xFFC18F2C),fontSize: 15,decoration: TextDecoration.underline ),))
                            ],
                          ),
                        )
                      ],
                    ),
              ),

            ],
          ),
        );
      }
    );
  }
}
