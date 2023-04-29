import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spa69/User/nearbySpa.dart';
import 'package:spa69/User/spainfo.dart';
import 'package:spa69/common/commontxt.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}


class _homePageState extends State<homePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Color golden = Color(0xFFC18F2C);
  Color green = Color(0xFF1F4B3E) ;
  bool _isDrawerOpen = false;
  FirebaseFirestore fstore = FirebaseFirestore.instance;
  List vendor_mail=[];
  List spaappartment=[];
  List spaarea=[];
  List spaimage=[];
  List spaname=[];
  List spaid=[];
  List spacity = [];
  List items = [];
  TextEditingController search = TextEditingController();
  String? uname;
  String? uemail;
  List searchspaname=[];
  List searchcity = [];
  final isloading = false.obs;
  String? _selectedindex;


  getudetail()async{
  DocumentSnapshot qr = await fstore.collection('USER').doc(FirebaseAuth.instance.currentUser!.email.toString()).get();
  setState(() {
    uname = qr.get('Name');
    uemail = qr.get('email');
  });

  }


  getVendorMail() async {


    spaid.clear();
    spacity.clear();
    vendor_mail.clear();
    spaarea.clear();
    spaimage.clear();
    spaname.clear();

    searchspaname.clear();
    spaappartment.clear();
   QuerySnapshot qr = await fstore.collection('VENDOR').get();
   for(int i=0;i<qr.docs.length;i++){
     setState(() {
       vendor_mail.add(qr.docs[i].get("email"));
     });
   }

 
   for(int i=0;i<vendor_mail.length;i++){
     QuerySnapshot qr = await fstore.collection('VENDOR').doc(vendor_mail[i]).collection("Spas").get();
     for(int b=0;b<qr.docs.length;b++ ){
       setState(() {
           spaname.add(qr.docs[b].get("spaName"));
           spaappartment.add(qr.docs[b].get('apartmnet'));
           spaarea.add(qr.docs[b].get('area'));
           spaimage.add(qr.docs[b].get('imgURL'));
           spaid.add(qr.docs[b].get('id'));
           spacity.add(qr.docs[b].get('city'));
         });
     }
   }
   

    spacity.forEach((element) {
      print(element);
      setState(() {
        if(searchcity.contains(element)){

        }
        else{
          searchcity.add(element);
        }
      });

      });
  }




  @override
  void initState() {
    // TODO: implement initState
    getVendorMail();
    getudetail();
    super.initState();
  }


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
                    uname.toString(),
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text(uemail.toString()),
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
         title: GestureDetector(
             onTap: (){

               print(searchcity);
               print(spaid);
               print(spaname);
               print(spacity);
               print(spaimage);
               print(spaarea);
               print(spaappartment);


             },
             child: Text('Home Page',style: TextStyle(color: Colors.black),)),
         centerTitle: true,
         leading: Padding(
           padding:  EdgeInsets.only(left: w*0.055),
           child: Row(
             children: [
               GestureDetector(
                   onTap: () => _scaffoldKey.currentState?.openDrawer(),
                   child: SvgPicture.asset("assets/svgimages/menu_left.svg",theme: SvgTheme(currentColor: green))),

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
                    controller: search,
                    decoration: InputDecoration(
                      hintText: "Search for city, location or Spa ",
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,

                    ),
                    onChanged: (value){
                      searchspaname.clear();
                      setState(() {
                        spaname.forEach((element) {
                          if(element.toString().contains(search.text)){
                            searchspaname.add(element);
                          }
                          else{
                          }
                        });
                      });
                    },
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color:Color(0xFFC18F2C) ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),

              search.text.length==0||searchspaname.length==0?Container():
              Center(
                child: Obx(
                   () {
                    return
                      isloading.value?CircularProgressIndicator():
                      Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      height: h*0.12,
                      decoration: BoxDecoration(
                          border: Border.all(color:Color(0xFFC18F2C) ),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: searchspaname.length,
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 2,
                            color: Colors.black,
                          );
                        },
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: (){
                                  Get.to(spaInfo(spaid[index],"${spaid[index].toString().substring(0,spaid[index].toString().indexOf(".com"))}.com"));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(searchspaname[index].toString(),style: TextStyle(color: Colors.black,fontSize: 18),),
                                ));
                          },
                      ),
                    );
                  }
                ),
              ),
              SizedBox(height: h*0.03,),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => nearBySpa(),));

                      print(uname);
                      print(uemail);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      color: Colors.transparent,
                      child: ListView.separated(
                        itemCount: searchcity.length+1,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(left: 20),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                _selectedindex = searchcity[index-1];
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: w*0.17
                                  ,
                                height: h*0.075,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(color: green,width: 1)
                                ),
                                child: Image.asset('assets/svgimages/locations.png')
                              ),
                            ),
                            SizedBox(height:10,),
                            Text(index == 0?"All":searchcity[index-1].toString(),style: TextStyle(color: Colors.black,fontSize: 14),)
                          ],
                        );
                      }, separatorBuilder:
                          (BuildContext context, int index) {
                          return SizedBox(width: 20,);
                      }, ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
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
                  itemCount: spaname.length,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: 20),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (){
                        Get.to(spaInfo(spaid[index],"${spaid[index].toString().substring(0,spaid[index].toString().indexOf(".com"))}.com"));
                          print(spaid);
                          print(vendor_mail);

                        },
                        child: Container(
                          width: 180,
                          height: 132,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Image.network(spaimage[index],fit: BoxFit.fill,),
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
                            Text(spaname[index],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                            SizedBox(height: 6,),
                            Text("${spaarea[index]}"+","
                                ""+"${spacity[index]}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500)),
                            SizedBox(height: 2,),

                          ],
                        ),
                      )
                    ],
                  );
                },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 26,);
                }, ),
              ),
              Container(
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
              SizedBox(height: h*0.029,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: h*0.28,
                // color: Colors.black,
                child: ListView.separated(
                reverse: true,
                  itemCount: spaname.length,
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => spaInfo(spaid[index],"${spaid[index].toString().substring(0,spaid[index].toString().indexOf(".com"))}.com"),));
                            print(_selectedindex);
                          },
                          child: Container(
                            width: 180,
                            height: 132,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Image.network(spaimage[index],fit: BoxFit.fill,),
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
                              Text(spaname[index],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                              SizedBox(height: 6,),
                              Text("${spaarea[index]}"+","
                                  ""+"${spacity[index]}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500)),
                              SizedBox(height: 2,),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 26,);
                  }, ),
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
                      Text("Offers For You",style: TextStyle(fontSize: 20,color:Color(0xFFC18F2C),fontWeight: FontWeight.w500 ),)
                    ],
                  ),
                ),
              ),
              SizedBox(height: h*0.02,),
              Container(
                width: w,
                height: h*0.22,
                child: StreamBuilder(
                  stream: fstore.collection('coupon').snapshots(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(),);
                    }else if (snapshot.data!.docs.isEmpty){
                      return Text('No Offers Founed');
                    }else{
                      return ListView.separated(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.docs.length,
                        padding: EdgeInsets.only(left: 10.0),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: w*0.91,
                            height:h*0.1 ,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(color: golden,width: 1.5),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: w*0.45,
                                  height: h,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft:Radius.circular(15) )
                                  ),
                                  child: Image.network(snapshot.data!.docs[index].get('img'),fit: BoxFit.fill,),
                                ),
                                Container(
                                  width: w*0.452,
                                  height: h,
                                  decoration: BoxDecoration(
                                      color: green, borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15))
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(snapshot.data!.docs[index].get('offer'),style: TextStyle(color: Colors.white,fontSize: 17),),
                                      SizedBox(height: h*0.01,),
                                      Text(snapshot.data!.docs[index].get('description'),style: TextStyle(color: Colors.white,fontSize: 17),),
                                      SizedBox(height: h*0.01,),
                                      Container(
                                        // width: w*0.3,
                                        //   height: h*0.04,
                                        //   alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),

                                              border: Border.all(color: golden)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                                onTap: (){
                                                  Clipboard.setData(new ClipboardData(text: snapshot.data!.docs[index].get('code')));
                                                  Fluttertoast.showToast(msg: "Code Coppied!");
                                                },
                                                child: Text(snapshot.data!.docs[index].get('code'),style: TextStyle(color: golden,fontSize: 20))),
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }, separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(width: 10,);
                      },);

                    }

                  }
                ),
              )

            ],
          ),
        ),
      ),
    );

  }
}
