import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class vendorLogin extends StatefulWidget {
  const vendorLogin({Key? key}) : super(key: key);

  @override
  State<vendorLogin> createState() => _vendorLoginState();
}

class _vendorLoginState extends State<vendorLogin> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F4B3E),
      body: Stack(
        children: [
          Positioned(
            top: -150,
            left: 260.97,
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
                    SvgPicture.asset("assets/svgimages/bottles.svg")
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 720.11,
            left: -150,
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
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 20),
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
                  child: TextFormField(
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
                SizedBox(height: 20,),
                Container(
                  width: 380,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: "Passowrd",
                        prefixIcon: Icon(Icons.security,),
                        prefixIconColor: Colors.black54,
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        suffixIconColor: Colors.black45
                    ),
                  ),
                ),
                SizedBox(height: 30,),

                SizedBox(height: 90,),
                Container(
                  alignment: Alignment.center,
                  width: 380,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Color(0xFFC18F2C)),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text("Login",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color:Color(0xFFC18F2C) ),),
                ),
                SizedBox(height: 50,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t Have an Account?",style: TextStyle(color: Colors.white,fontSize: 15,),),
                      Text("SignUp",style: TextStyle(color:Color(0xFFC18F2C),fontSize: 15,decoration: TextDecoration.underline ),)
                    ],
                  ),
                )
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
            left: 162,
            child: Container(
              child: Text("LOG IN",style: TextStyle(fontSize: 32,color: Colors.white),),
            ),
          )
        ],
      ),
    );;
  }
}
