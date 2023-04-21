import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spa69/User/Login.dart';
List<Widget> widget = [
  Image.asset("assets/images/ooonboarding.png"),
  Image.asset("assets/svgimages/one.png"),
  Image.asset("assets/svgimages/two.png"),
];

class onBoarding extends StatefulWidget {
  const onBoarding({Key? key}) : super(key: key);

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> with SingleTickerProviderStateMixin {
  late final TabController controller;
  int index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(
      length: widget.length,
      initialIndex: index,
      vsync: this
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Color golden = Color(0xFFC18F2C);
    Color green = Color(0xFF1F4B3E) ;
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: green,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: w,
                height: h*0.7,
                color: Colors.transparent,
                child: TabBarView(
                    controller: controller,
                    children: widget
                ),
              ),
              Positioned(
                  bottom: 10,
                  child: TabPageSelector(
                    controller: controller,
                    color: green,
                    selectedColor: golden,
                  )
              )
            ],
          ),
          SizedBox(height:h*0.08 ,),
          Text("Massage",style: TextStyle(fontSize: 32,fontWeight: FontWeight.w700,color: Colors.white),),
          SizedBox(height:h*0.01 ,),
          Container(
            width: 390,
            height: 48,
            child: Text("Get a personalised hair colour perfect for your skin tone"
                "try our different hair styling option",
              style: TextStyle(
                  fontSize: 19,
                  color: const Color(0xFFACACAC)
              ),
            ),
          ),
          SizedBox(height:h*0.04 ,),
          GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
          },
          child: Container(
            alignment: Alignment.center,
            width: 226,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius:BorderRadius.circular(10),
                border: Border.all(color: Color(0xFFC18F2C))
            ),
            child: Text("Get started",style: TextStyle(fontSize: 20,color: Color(0xFFC18F2C)),),
          ),
        ),
        ],
      )
    );
  }
}
