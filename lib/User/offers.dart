import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spa69/User/BottomNavBar.dart';
import 'package:spa69/User/spainfo.dart';
class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  Color golden = Color(0xFFC18F2C);
  Color green = Color(0xFF1F4B3E) ;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:AppBar(
        backgroundColor: green,
        elevation: 0,
        title: Text("Offers",),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav(),));
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => spaInfo(),));
          },
          child: Container(
            width: w*0.9,
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(8.0),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Container(
                      width: w*0.9,
                      height: h*0.2,
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          image: DecorationImage(image: AssetImage("assets/images/man.png"),fit: BoxFit.fill)
                      ),
                      child: SvgPicture.asset("assets/images/background.svg",fit: BoxFit.fill,)
                      ),
                    Positioned(
                      top: h*0.04,
                      left: w*0.04,
                      child: Container(
                        width: w*0.7,
                        height: h*0.1,
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("50% OFF",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                            SizedBox(height: h*0.001,),
                            Text(" On First Full Body Massage",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: h*0.09,
                      left: w*0.02,
                      child: Container(
                        width: w*0.6,
                        height: h*0.1,
                        child: Row(
                          children: [
                            Text("Valid Till : ",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w500),),
                            Text("25 March 2023",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                    )
                  ],
                );
            }, separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 20,);
            },),
          ),
        ),
      ),
    );
  }
}
