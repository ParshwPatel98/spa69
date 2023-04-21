import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class nearBySpa extends StatefulWidget {
  const nearBySpa({Key? key}) : super(key: key);

  @override
  State<nearBySpa> createState() => _nearBySpaState();
}

class _nearBySpaState extends State<nearBySpa> {
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
        title: Text("Near By Spa",),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          SizedBox(height: h*0.02,),
          Container(
            width: w,
            height: h*0.05,
            color: Colors.transparent,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
              return Container(
                width: w*0.25,
                height: h*0.03,
                decoration: BoxDecoration(
                    color: golden,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Sort",style: TextStyle(fontSize: 16,color: Colors.white),),
                    Icon(Icons.arrow_downward_rounded,color: Colors.white,)
                  ],
                ),
              );
            }, separatorBuilder: (BuildContext context, int index) {
              return SizedBox(width: 5,);
            },),
          ),
          SizedBox(height: h*0.03,),
          Expanded(
            child: Container(
              width: w*0.9,
              height: h,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: w*0.9,
                  height: h*0.2,
                  decoration: BoxDecoration(
                      color: green,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: w*0.4,
                            height: h,
                            // color: Colors.white,
                            child: Image.asset("assets/images/spaimg.png",fit: BoxFit.fill,)
                          ),
                          Positioned(
                            left: w*0.03,
                            top: h*0.02,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: green,
                                  shape: BoxShape.circle
                              ),
                              child: SvgPicture.asset("assets/images/stackheart.svg",fit: BoxFit.scaleDown),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: w*0.03,),
                      Container(
                        width: w*0.45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Spa Name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.location_on,color: Colors.white,),
                                Text("Alkapuri, Vadodara",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),)
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.star,color: golden,),
                                Text("3.7",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),),
                                Text("(426)",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),),
                              ],
                            ),
                            Row(
                              children: [
                                Text("₹1050",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white),),
                                SizedBox(width:w*0.02 ,),
                                Text("₹1050",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white,decoration: TextDecoration.lineThrough),),
                                SizedBox(width:w*0.02 ,),
                                Text("68% OFF",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.green),),
                              ],
                            ),
                            SizedBox(height: h*0.02,),
                            Container(
                              // width: w*0.2,
                              // color: Colors.blue,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                 Container(
                                   alignment: Alignment.center,
                                   width: w*0.2,
                                   height: h*0.035,
                                   decoration: BoxDecoration(
                                       color: golden,
                                       borderRadius: BorderRadius.circular(15)
                                   ),
                                   child: Text("Book Now",style: TextStyle(color: Colors.white),),
                                 )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10,);
              },),
            ),
          )
        ],
      ),
    );
  }
}
