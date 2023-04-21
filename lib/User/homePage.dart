import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spa69/User/nearbySpa.dart';
import 'package:spa69/User/spainfo.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List _img = ["assets/images/nearby.png","assets/images/ahmedabad.png","assets/images/goa.png","assets/images/delhi.png","assets/images/hydrabad.png","assets/images/mumbai.png"];
  List _cityName = ["Near BY","Ahmedabad","Goa","Delhi","Hydrabad","Mumbai"];
  Color golden = Color(0xFFC18F2C);
  Color green = Color(0xFF1F4B3E) ;
  bool _isDrawerOpen = false;



  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop:() {
        // Navigator.pop(context);
        SystemNavigator.pop();
        return Future.value(false);
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          backgroundColor: green,
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
               DrawerHeader(
                decoration: BoxDecoration(
                  color: golden,
                  border: Border.all(color: golden)
                ), //BoxDecoration
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: golden),
                  accountName: Text(
                    "Abhishek Mishra",
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text("abhishekm977@gmail.com"),
                  currentAccountPictureSize: Size.square(50),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 165, 255, 137),
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 30.0, color: Colors.blue),
                    ), //Text
                  ), //circleAvatar
                ), //UserAccountDrawerHeader
              ), //DrawerHeader
              ListTile(
                leading:  Icon(Icons.person,color: golden,),
                title:  Text(' My Profile ',style: TextStyle(color: golden),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading:  Icon(Icons.book,color: golden,),
                title:  Text(' My Appointments ',style: TextStyle(color: golden),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading:  Icon(Icons.local_offer,color: golden,),
                title:  Text(' Offers',style: TextStyle(color: golden),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading:  Icon(Icons.logout,color: golden,),
                title:  Text(' Logout',style: TextStyle(color: golden),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),

            ],
          ),
        ),
        appBar: AppBar(
         backgroundColor: Colors.white,
         leadingWidth: double.infinity,
         title: null,
         leading: Padding(
           padding:  EdgeInsets.only(left: w*0.055),
           child: Row(
             children: [
               GestureDetector(
                   onTap: () => _scaffoldKey.currentState?.openDrawer(),
                   child: SvgPicture.asset("assets/svgimages/menu_left.svg",theme: SvgTheme(currentColor: green))),
               SizedBox(width: w*0.03,),
               Icon(Icons.location_on,color: green,),
               Text("Ahmedabad",style: TextStyle(color: green),),
               Icon(Icons.arrow_drop_down_sharp,color: green,)
             ],
           ),
         ),
          elevation: 0,
       ),

        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: h*0.02),
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 20,),

              //CITY LOCATION FIELD
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search for city, location or Spa ",
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color:Color(0xFFC18F2C) ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
              SizedBox(height: h*0.03,),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => nearBySpa(),));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      color: Colors.transparent,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(left: 20),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: w*0.17,
                              height: h*0.077,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF1F4B3E),
                              ),
                              child: Image.asset(_img[index].toString())
                            ),
                            SizedBox(height:10,),
                            Text(_cityName[index].toString(),style: TextStyle(color: Colors.black,fontSize: 14),)
                          ],
                        );
                      }, separatorBuilder:
                          (BuildContext context, int index) {
                          return SizedBox(width: 20,);
                      }, itemCount: 6,),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Row(
                    children: [
                      Container(
                        width: w*0.11,
                        height: h*0.05,
                        // color: Colors.black,
                        child: SvgPicture.asset("assets/svgimages/greenbottles.svg")
                      ),
                      Text("Hand Picked For You",style: TextStyle(fontSize: 20,color:Color(0xFFC18F2C),fontWeight: FontWeight.w500 ),)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: h*0.28,
                // color: Colors.black,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: 20),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => spaInfo(),));
                        },
                        child: Container(
                          width: 180,
                          height: 132,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Image.asset("assets/images/spaimg.png",fit: BoxFit.fill,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star,size: 18, color:Color(0xFFC18F2C)),
                            SizedBox(width: 10,),
                            Text("3.7",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5,),
                            Text("SPA NAME",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                            SizedBox(height: 6,),
                            Text("Alkapuri,Vadodara",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500)),
                            SizedBox(height: 2,),
                            Row(
                              children: [
                                Text(" ₹1050",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500)),
                                SizedBox(width: 2,),
                                Text(" ₹3379",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black45,decoration: TextDecoration.lineThrough)),
                                SizedBox(width: 10,),
                                Text("68% OFF",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xFF49CA56))
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 26,);
                }, itemCount: 4,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        child:SvgPicture.asset("assets/svgimages/greenbottles.svg")
                      ),
                      Text("Discover Spa",style: TextStyle(fontSize: 20,color:Color(0xFFC18F2C),fontWeight: FontWeight.w500 ),)
                    ],
                  ),
                ),
              ),
              SizedBox(height: h*0.029,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: h*0.28,
                // color: Colors.black,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: 20),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => spaInfo(),));
                          },
                          child: Container(
                            width: 180,
                            height: 132,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Image.asset("assets/images/spaimg.png",fit: BoxFit.fill,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.star,size: 18, color:Color(0xFFC18F2C)),
                              SizedBox(width: 10,),
                              Text("3.7",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5,),
                              Text("SPA NAME",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                              SizedBox(height: 6,),
                              Text("Alkapuri,Vadodara",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500)),
                              SizedBox(height: 2,),
                              Row(
                                children: [
                                  Text(" ₹1050",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500)),
                                  SizedBox(width: 2,),
                                  Text(" ₹3379",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.black45,decoration: TextDecoration.lineThrough)),
                                  SizedBox(width: 10,),
                                  Text("68% OFF",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Color(0xFF49CA56))
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 26,);
                  }, itemCount: 4,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        child: SvgPicture.asset("assets/svgimages/greenbottles.svg")
                      ),
                      Text("Book your 1st Massage",style: TextStyle(fontSize: 20,color:Color(0xFFC18F2C),fontWeight: FontWeight.w500 ),)
                    ],
                  ),
                ),
              ),
              SizedBox(height: h*0.02,),
              Container(
                padding: EdgeInsets.zero,
                width: w*0.95,
                height: h*0.189,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Container(
                      width: 195,
                      color: Colors.transparent,
                      child: Image.asset("assets/images/mainspa.png"),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 195,
                      decoration: BoxDecoration(
                          color: Color(0xFF1F4B3E),
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("50% OFF",style: TextStyle(color: Colors.white,fontSize: 20),),
                          SizedBox(height: 8,),
                          Text("Your first Booking",style: TextStyle(color: Colors.white,fontSize: 15)),
                          SizedBox(height: 8,),
                          Container(
                            alignment: Alignment.center,
                            width: 75,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Color(0xFFC18F2C))
                            ),
                            child: Text("Book Now",style: TextStyle(fontSize: 12,color:Color(0xFFC18F2C) ),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

  }
}
