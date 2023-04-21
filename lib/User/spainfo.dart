import 'package:flutter/material.dart';
// import 'package:weekly_date_picker/weekly_date_picker.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spa69/User/confirmBooking.dart';

import 'BookApointment.dart';
class spaInfo extends StatefulWidget {
  const spaInfo({Key? key}) : super(key: key);

  @override
  State<spaInfo> createState() => _spaInfoState();
}

class _spaInfoState extends State<spaInfo> with TickerProviderStateMixin{
  Color golden = Color(0xFFC18F2C);
  Color green = Color(0xFF1F4B3E) ;

  late DateTime _selectedDate;
  int? _SelectedIndex;
  List img = ["assets/svgimages/first.png","assets/svgimages/second.png","assets/svgimages/third.png","assets/svgimages/fourth.png"];
  List names = ["Full Body Massage","Foot Massage","Back Massage","Head Massage"];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // void _goToSecondTab() {
  //   _tabController.animateTo(1);
  //   setState(() {
  //     // Change the label of the second tab to "Second Tab"
  //     _tabController.index = 1;
  //   });
  // }


  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return DefaultTabController(
      // initialIndex: 0,
      length: 3,
      child: Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF1F4B3E),
          leading:  GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          title: Text("Spa Information"),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(45),
            child: Column(
              children: [
                TabBar(
                  controller: _tabController,

                  // indicatorSize: ,
                  isScrollable: true,
                  labelColor:golden,
                  // labelPadding: EdgeInsets.only(right: 1),
                  unselectedLabelColor: Colors.white,
                  indicatorColor: golden,
                  labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
                  tabs:[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Tab(text: "ABOUT US",),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Tab(text: "SERVICES",),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Tab(text: "THERAPIST",),
                    ),
                  ],
                ),
              ],
            )
          ),
        ),
        body:TabBarView(
          controller: _tabController,
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
                color: Colors.white,
                child:Column(
                  children: [
                    Container(
                      width: w,
                      height: h*0.35,
                      color: Colors.black,
                      child: Image.asset("assets/images/man.png",fit: BoxFit.fill,),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 15),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text("SPA NAME",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
                                ],
                              ),
                              SizedBox(height: 3,),
                              Row(
                                children: [
                                  Text("₹1065"),
                                  SizedBox(width: 10,),
                                  Text("₹3357",style: TextStyle(color: Colors.black54,decoration: TextDecoration.lineThrough),),
                                  SizedBox(width: 10,),
                                  Text("68% OFF",style: TextStyle(color: Color(0xFF49CA56)),)
                                ],
                              ),
                              SizedBox(height: 3,),
                              Row(
                                children: [
                                  Icon(Icons.star,color: golden,),
                                  SizedBox(width: 10,),
                                  Text("3.7",style: TextStyle(fontSize: 17),),
                                  SizedBox(width: 10,),
                                  Text("(426 Reviews)",style: TextStyle(fontSize: 17),)
                                ],
                              ),
                              SizedBox(height: 3,),
                              Row(
                                children: [
                                  Text("Alkapuri, Vadodara")
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("Lorem Ipsum has been the industry's standard dummy text "
                        "ever since the 1500s, when an unknown printer took a "
                        "galley of type and scrambled it to make a type specimen book.",style: TextStyle(fontSize: 15),),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,),
                      child: Row(
                        children: [
                          Text("Time:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Mon to Fri : ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                              Text("9:00 AM to 10:00 PM",style: TextStyle(fontSize: 17,color: Colors.black54))
                            ],
                          ),
                          SizedBox(height:5 ,),
                          Row(
                            children: [
                              Text("Sat: ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500)),
                              SizedBox(width: 57,),
                              Text("9:00 AM to 10:00 PM",style: TextStyle(fontSize: 17,color: Colors.black54))
                            ],
                          ),
                          SizedBox(height:5 ,),
                          Row(
                            children: [
                              Text("Sun: ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500)),
                              SizedBox(width: 53,),
                              Text("Closed",style: TextStyle(fontSize: 17,color: Colors.black54))
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _tabController.animateTo(1);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width*0.9,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: golden),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text("Continue",style: TextStyle(fontSize: 20,color: golden),),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            Container(
              height:MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemCount: 4,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 20,bottom: 20),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 390,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      child:SvgPicture.asset("assets/svgimages/greenbottles.svg")
                                    ),
                                    SizedBox(width: 15,),
                                    Text(names[index].toString(),style: TextStyle(fontSize: 20,color: golden),)
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                width: MediaQuery.of(context).size.width*0.9,
                                height: 175,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: w*0.9,
                                          height: 173,
                                          color: Colors.black,
                                          child: Image.asset(img[index].toString(),fit: BoxFit.fill,),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      left: w*0.469,
                                      // top: h*0.001,
                                      child: Container(
                                        width: w*0.43,
                                        height: 173,
                                        color: green,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                SvgPicture.asset("assets/svgimages/heart.svg"),
                                                SizedBox(height: h*0.005,),
                                                Text("60 min",style: TextStyle(fontSize: 15,color: Colors.white),),
                                                SizedBox(height: h*0.005,),
                                                Text("\$40 min",style: TextStyle(fontSize: 15,color: Colors.white),),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _SelectedIndex == _SelectedIndex;
                                                });

                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: w*0.2,
                                                height: h*0.04,
                                                decoration: BoxDecoration(
                                                    color: golden,
                                                    borderRadius: BorderRadius.circular(10)
                                                ),
                                                child: Text(_SelectedIndex == _SelectedIndex ? "Add":"Added",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }, separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 15,);
                    },),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BookApointment(),));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: w*0.97,
                      height: h*0.06,
                      decoration: BoxDecoration(
                          color: golden,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text("Continue",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: 10),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 317,
                  height: 75,
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // color: Colors.transparent
                          ),
                          child: Image.asset("assets/images/ahmedabad.png"),
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text("Massage Therapist: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                  Text("Julie Cook",style: TextStyle(fontSize: 15),)
                                ],
                              ),
                              SizedBox(height: 3,),
                              Row(
                                children: [
                                  Text("Age: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                  SizedBox(width: 5,),
                                  Text("26 Years",style: TextStyle(fontSize: 15),)
                                ],
                              )
                            ],
                          ),
                        )
                    ],
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    // height: 1,
                    color: Colors.black,
                    thickness: 1,
                  );
              }, itemCount: 8,),
            ),

          ],
        ),
      ),
    );
  }
}
