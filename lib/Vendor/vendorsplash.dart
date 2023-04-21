import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class vendorSplash extends StatefulWidget {
  const vendorSplash({Key? key}) : super(key: key);

  @override
  State<vendorSplash> createState() => _vendorSplashState();
}

class _vendorSplashState extends State<vendorSplash> {
  Color myColor = Color(0xFFC18F2C);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
    );;
  }
}
