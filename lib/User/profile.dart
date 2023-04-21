import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spa69/User/BottomNavBar.dart';
import 'package:spa69/User/Login.dart';
import 'package:spa69/User/appointmentConfirm.dart';
import 'package:spa69/User/changePassword.dart';
import 'package:spa69/User/editprofile.dart';
import 'package:spa69/User/homePage.dart';
import 'package:spa69/User/offers.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Color golden = Color(0xFFC18F2C);
  Color green = Color(0xFF1F4B3E) ;
  List icons = [
                "assets/svgimages/home.svg","assets/svgimages/ticket.svg","assets/svgimages/offers.svg",
                "assets/svgimages/lock.svg","assets/svgimages/admin.svg","assets/svgimages/logout.svg"
                ];
  List names = ["Home","My Booking","Offers","Change Password","Edit Profile","Log Out"];
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:AppBar(
        backgroundColor: green,
        elevation: 0,
        title: Text("Profile",),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav(),));
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Stack(
        children: [
          Column(
          children: [
            Container(
              width: w,
              height: h*0.2,
              child: Image.asset("assets/images/profile.png",fit: BoxFit.fill,),
            ),
            SizedBox(height: h*0.06,),
            Container(
              width: w*0.9,
              height: h*0.5,
              color: Colors.transparent,
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () async {
                      if(index == 0){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav(),));
                      }else if(index == 1){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => appointmentConfirm(),));
                      }else if(index == 2){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Offers(),));
                      }else if(index == 3){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => changePassword(),));
                      }else if(index == 4){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => editProfile(),));
                      }else if(index == 5){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                        SharedPreferences sf = await  SharedPreferences.getInstance();
                        sf.clear();
                      }
                    },
                    child: Container(
                      width: w*0.9,
                      height: h*0.06,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(icons[index].toString()),
                              SizedBox(width: w*0.04,),
                              Text(names[index].toString(),style: TextStyle(color: green,fontSize: 20,fontWeight: FontWeight.w500),),
                            ],
                          ),
                          // Container(width: w*0.5,),
                          Icon(Icons.arrow_forward_ios,size: 25,color: green,)
                        ],
                      ),
                    ),
                  );
              }, separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    thickness: 1,
                    color: Colors.black54,

                  );
              },),
            )
          ],
        ),
          Positioned(
            top: h*0.15,
            left: w*0.38,
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: green,width: 2)
              ),
              child: Image.asset("assets/images/ahmedabad.png",fit: BoxFit.fill,),
            ),
          ),
        ]
      ),

         
    );
  }
}
