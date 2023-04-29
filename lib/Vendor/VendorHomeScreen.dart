import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spa69/Vendor/addServices.dart';
import 'package:spa69/common/commontxt.dart';

import '../common/coomoonPath.dart';
import '../commonFunction/allcommfunc.dart';
class VendorHomeScreen extends StatefulWidget {
  const VendorHomeScreen({Key? key}) : super(key: key);

  @override
  State<VendorHomeScreen> createState() => _VendorHomeScreenState();
}

class _VendorHomeScreenState extends State<VendorHomeScreen> {
  Color golden = Color(0xFFC18F2C);
  Color green = Color(0xFF1F4B3E) ;

  FirebaseFirestore _fstore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String? spaName;
  String?
  spaId;
  File? profile_photo;
  TextEditingController _therapiest_name = TextEditingController();
  TextEditingController _therapiest_title = TextEditingController();
  TextEditingController _therapiest_working_days = TextEditingController();
  TextEditingController _therapiest_working_hours = TextEditingController();
  TextEditingController _edit_name = TextEditingController();
  TextEditingController _edit_title = TextEditingController();
  TextEditingController _edit_hours = TextEditingController();
  TextEditingController _edit_days = TextEditingController();
  String? utype;


  getspaName() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    setState(() {

    spaName = sf.getString('spaName');
    });

  }

  getspaId() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    setState(() {
      spaId = sf.getString('spaId');
    });
  }

  getutype() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    setState(() {
      utype = sf.getString("utype");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getspaName();
    getspaId();
    getutype();
    super.initState();
  }
  final _addtherapiest = Get.put(allfunc());

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF1F4B3E),
            leading: GestureDetector(
                onTap: () {
                  // Navigator.pop(context);

                },
                child: Icon(Icons.arrow_back)),
            title: Text("Home Screen"),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize:  Size.fromHeight(45),
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    labelColor:golden,
                    unselectedLabelColor: Colors.white,
                    indicatorColor: golden,
                    labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
                    // indicatorPadding:EdgeInsetsGeometry.infinity ,
                    indicatorSize: TabBarIndicatorSize.tab,
                    onTap:(value) {
                      getspaName();
                      // print(object)
                    },
                    tabs: [
                      Tab(text: "ORDER LIST",),
                      Tab(text: "THERAPIST LIST",),
                      Tab(text: "SERVICE LIST",)
                    ],
                  )
                ],
              ),
            ),
          ),
          body: TabBarView(children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: h*0.02,),
                  Container(
                    width: w*0.9,
                    child: Row(
                      children: [
                        Text("Upcoming Orders",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: w*0.9,
                      height: h,
                      child: ListView.separated(
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            print(spaName.toString());
                            print(spaId);
                            print(utype);
                          },
                          child: Container(
                            width: w*0.9,
                            height: h*0.16,
                            color: Colors.transparent,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: w*0.3,
                                  height: h*0.1,
                                  color: Colors.transparent,
                                  child: Image.asset("assets/images/streached.png",fit: BoxFit.fill,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Full Body Massage",style: TextStyle(color: golden,fontSize: 15,fontWeight: FontWeight.w500),),
                                      Text("Saturday, Mar 7, 2023 11:00 AM",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                                      Text("In Spa",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }, separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            thickness: 1,
                            color: Colors.black,
                          );
                      },),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0,top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)
                                )),
                            context: context,
                            builder: (context) {
                              return Container(
                                padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(height: h*0.02,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Stack(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Future<void> profile_image() async {
                                                    XFile? xf = await ImagePicker().pickImage(source: ImageSource.gallery);
                                                    if (xf != null) {
                                                      setState(() {
                                                        profile_photo=File(xf.path);
                                                      });
                                                    }
                                                  }
                                                  profile_image();
                                                },
                                                child: Container(
                                                  width: w*0.3,
                                                  height: h*0.15,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(fit: BoxFit.fill,image: profile_photo!= null ? FileImage(profile_photo!):AssetImage("assets/images/ahmedabad.png",) as ImageProvider),
                                                      color: Colors.white,
                                                      border: Border.all(color: green,width: 2),
                                                      shape: BoxShape.circle
                                                  ),

                                                ),
                                              ),
                                              Positioned(
                                                left: w*0.17,
                                                top: h*0.12,
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  width: w*0.05,
                                                  height: h*0.03,
                                                  decoration: BoxDecoration(
                                                    // color: golden,
                                                      shape: BoxShape.circle
                                                  ),
                                                  child: Icon(Icons.camera_alt_outlined,color: golden,size: 25,),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: h*0.05,),
                                      Container(
                                        width: w*0.9,
                                        child: Row(children: [
                                          Text("Name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
                                        ],),
                                      ),
                                      SizedBox(height: h*0.01,),
                                      Container(
                                        width: w*0.9,
                                        // height: h*0.055,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Colors.black)
                                        ),
                                        child: TextFormField(
                                          controller: _therapiest_name,
                                          decoration: InputDecoration(
                                            hintText: "Name",
                                            disabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                                            // focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                            border: InputBorder.none,
                                          ),

                                        ),
                                      ),
                                      SizedBox(height: h*0.05,),
                                      Container(
                                        width: w*0.9,
                                        child: Row(children: [
                                          Text("Title",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
                                        ],),
                                      ),
                                      SizedBox(height: h*0.01,),
                                      Container(
                                        width: w*0.9,
                                        // height: h*0.055,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: Colors.black)
                                        ),
                                        child: TextFormField(
                                          controller: _therapiest_title,
                                          decoration: InputDecoration(
                                            hintText: "Title",
                                            disabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                                            // focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                            border: InputBorder.none,
                                          ),

                                        ),
                                      ),
                                      SizedBox(height: h*0.02,),
                                      Container(
                                        width: w*0.9,
                                        child: Row(children: [
                                          Text("Working Hours",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
                                        ],),
                                      ),
                                      SizedBox(height: h*0.01,),
                                      Container(
                                        width: w*0.9,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: w*0.4,
                                              height: h*0.06,
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: TextFormField(
                                                controller: _therapiest_working_days,
                                                decoration: InputDecoration(
                                                    hintText: "Days",
                                                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                                    suffixIcon: Icon(Icons.calendar_month,color: Colors.black54,)
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: w*0.4,
                                              height: h*0.06,
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: TextFormField(
                                                controller: _therapiest_working_hours,
                                                decoration: InputDecoration(
                                                    hintText: "Hours",
                                                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                                    suffixIcon: Icon(Icons.watch_later_outlined,color: Colors.black54,)
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: h*0.02,),
                                      Obx(
                                         () {
                                          return
                                            _addtherapiest.addtherapistloading.value?CircularProgressIndicator():
                                            InkWell(
                                            onTap: () async {

                                              _addtherapiest.addtherapiest(_auth.currentUser!.email.toString(), _therapiest_name.text, _therapiest_title.text,_therapiest_working_days.text, _therapiest_working_hours.text,spaName.toString(), spaId.toString(), profile_photo!);
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: w*0.9,
                                              height: h*0.06,
                                              // color: Colors.black,
                                              decoration: BoxDecoration(
                                                  color: golden,
                                                  borderRadius: BorderRadius.circular(15)
                                              ),
                                              child: Text("Save",style: TextStyle(fontSize: 25,color: Colors.white),),
                                            ),
                                          );
                                        }
                                      ),
                                      SizedBox(height: h*0.02,)
                                    ],
                                  ),
                                ),
                              );

                            },
                          );
                        },
                        child: Container(
                          width: w*0.22,
                          height: h*0.055,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: golden),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Add",style: TextStyle(fontSize: 15,color: golden),),
                              Icon(Icons.add_circle_outline_outlined,color: golden,)
                            ],
                          ),
                        ),
                      ),
                    ],
                    ),
                  ),
                  SizedBox(height: h*0.02,),
                  Expanded(
                    child: StreamBuilder(
                      stream: _fstore.collection(utype.toString()).doc(_auth.currentUser!.email.toString()).collection('Spas').doc("${spaId.toString()}").collection('therapiest').snapshots(),
                      builder: (context, snapshot) {
                        if(snapshot.connectionState==ConnectionState.waiting){
                          return Center(child: CircularProgressIndicator(),);
                        }
                        else if(snapshot.data!.docs.isEmpty){
                          return Center(child: Text("No Therapist Found"),);
                        }else{
                          return  Container(
                            width: w*0.9,
                            height: h*0.68,
                            color: Colors.transparent,
                            child: ListView.separated(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  width: w,
                                  height: h*0.25,
                                  decoration: BoxDecoration(
                                      color: green,
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8.0,top: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                                onTap: () async {

                                                  FirebaseFirestore.instance.collection('VENDOR').doc(_auth.currentUser!.email.toString()).collection("Spas").doc("${spaId}").collection("therapiest").doc(
                                                    snapshot.data!.docs[index].id.toString()
                                                  ).delete();

                                                },
                                                child: Icon(Icons.delete,color: golden,size: 26,))
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: w*0.18,
                                              height: h*0.09,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(color: golden,width: 2)
                                              ),
                                              child: Image.network(snapshot.data!.docs[index].get('imgURl'),),
                                            ),
                                            SizedBox(width: 7,),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(snapshot.data!.docs[index].get('name'),style: TextStyle(fontSize: 15,color: Colors.white),),
                                                Text(snapshot.data!.docs[index].get('title'),style: TextStyle(fontSize: 13,color: Colors.white),),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20.0),
                                        child: Row(
                                          children: [
                                            Text("Working Hours:",style: TextStyle(fontSize: 15,color: Colors.white),)
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 8,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            width: w*0.3,
                                            height: h*0.05,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(color: golden)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text("Days :",style: TextStyle(fontSize: 10,color: Colors.white),),
                                                Text(snapshot.data!.docs[index].get('working_days'),style: TextStyle(fontSize: 10,color: Colors.white),),
                                                Icon(Icons.calendar_month,color: Colors.white,size: 20,)
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: w*0.4,
                                            height: h*0.05,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(color: golden)
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text("Hours :",style: TextStyle(fontSize: 10,color: Colors.white),),
                                                Text(snapshot.data!.docs[index].get('working_hours'),style: TextStyle(fontSize: 10,color: Colors.white),),
                                                Icon(Icons.watch_later_outlined,color: Colors.white,size: 20,)
                                              ],
                                            ),
                                          ),
                                          Container(width: 15,)
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }, separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(height: 10,);
                            },),
                          );
                        }

                      },

                    ),
                  ),

                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0,top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(addServices());
                          },
                          child: Container(
                            width: w*0.22,
                            height: h*0.055,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: golden),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.add_circle_outline,color: golden,
                                ),
                                Text("Add",style: TextStyle(fontSize: 15,color: golden),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // SizedBox(height: h*0.01,)

                  SizedBox(height: h*0.02,),
                  Expanded(
                    child: Container(
                      width: w*0.9,
                      height: h*0.6,
                      // color: Colors.black,
                      child: StreamBuilder(
                        stream:_fstore.collection(utype.toString()).doc(_auth.currentUser!.email.toString()).collection('Spas').doc("${spaId.toString()}").collection('services').snapshots() ,
                        builder: (context, snapshot) {
                          if(snapshot.connectionState==ConnectionState.waiting){
                          return Center(child: CircularProgressIndicator(),);
                          }
                          else if(snapshot.data!.docs.isEmpty){
                          return Center(child: Text("No Service Found"),);
                          }
                          else{
                            return ListView.separated(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () async {
                                    List therapistname=[];
                                    therapistname.clear();


                                    QuerySnapshot snapserv=await FirebaseFirestore.instance.collection(utype.toString()).doc(_auth.currentUser!.email.toString()).collection('Spas').doc(spaId.toString()).collection('services').get();
                                    for(int i=0;i<snapserv.docs[index]["selected_terapiest"].length;i++){
                                      await _fstore.collection(utype.toString()).doc(_auth.currentUser!.email.toString()).collection('Spas').doc(spaId.toString()).collection('therapiest').doc(snapserv.docs[index]["selected_terapiest"][i])
                                          .get().then((DocumentSnapshot) {
                                        setState(() {
                                          therapistname.add(DocumentSnapshot.get("name").toString());
                                        });
                                        print(DocumentSnapshot.get("name").toString());
                                      }
                                      );
                                    }
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15)
                                          )),
                                      context: context,
                                      builder: (context) {
                                        if(snapshot.connectionState==ConnectionState.waiting){
                                          return Center(child: CircularProgressIndicator(),);
                                        }
                                        else if(snapshot.data!.docs.isEmpty){
                                          return Center(child: Text("No Spa FOund"),);
                                        }
                                        else{
                                          return Container(
                                            height: h*0.35,
                                            child: Column(
                                              // crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: h*0.02,),
                                                Container(
                                                  width: w*0.9,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      border: Border.all(color: golden)
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Text('Service Name:',style: TextStyle(fontSize: 22),),
                                                      Text(snapshot.data!.docs[index].get('service_name'),style: TextStyle(fontSize: 25),),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: h*0.02,),
                                                Container(
                                                  width: w*0.9,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      border: Border.all(color: golden)
                                                  ),
                                                  child: Row(
                                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Text('Service description:',style: TextStyle(fontSize: 22),),
                                                      Text(snapshot.data!.docs[index].get('service_description'),style: TextStyle(fontSize: 22),),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: h*0.02,),
                                                Container(
                                                  width: w*0.9,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(15),
                                                      border: Border.all(color: golden)
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Text('Service price:',style: TextStyle(fontSize: 22),),
                                                      Text("₹${snapshot.data!.docs[index].get('service_price')}",style: TextStyle(fontSize: 25),),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: h*0.02,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text('Therapist:',style: TextStyle(fontSize: 22),),
                                                    Text(therapistname.toString().replaceAll("[", "").replaceAll("]", ""),style: TextStyle(fontSize: 25),),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      },);
                                  },
                                  child: Container(
                                    width: w*0.9,
                                    height: h*0.28,
                                    color: Colors.transparent,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                width: w*0.1,
                                                height: h*0.05,
                                                color: Colors.transparent,
                                                child: SvgPicture.asset("assets/svgimages/greenbottles.svg")
                                            ),
                                            Text(snapshot.data!.docs[index].get('service_name'),style: TextStyle(fontSize: 20,color: golden,fontWeight: FontWeight.w500),)
                                          ],
                                        ),
                                        SizedBox(height: h*0.02),
                                        Row(
                                          children: [
                                            Container(
                                              width: w*0.9,
                                              height: h*0.2,
                                              color: Colors.white,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: w*0.5,
                                                    height: h*0.2,
                                                    color: Colors.transparent,
                                                    child: Image.network(snapshot.data!.docs[index].get('service_img'),fit: BoxFit.fill,),
                                                  ),
                                                  Container(
                                                    width: w*0.4,
                                                    height: h*0.2,
                                                    color: green,
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Image.asset("assets/images/heaart.png"),
                                                            SizedBox(height: 5,),
                                                            Text("60 Min",style: TextStyle(fontSize: 15,color: Colors.white),),
                                                            SizedBox(height: 5,),
                                                            Text("₹${snapshot.data!.docs[index].get('service_price')}/Hour",style: TextStyle(fontSize: 15,color: Colors.white),),
                                                            // Text("Hours",style: TextStyle(fontSize: 15,color: Colors.white),),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: [
                                                            GestureDetector(
                                                                onTap: (){
                                                                  FirebaseFirestore.instance.collection('VENDOR').doc(_auth.currentUser!.email.toString()).collection("Spas").doc("${spaId}").collection("services").doc(
                                                                      snapshot.data!.docs[index].id.toString()
                                                                  ).delete();

                                                                },
                                                                child: Icon(Icons.delete,color: golden,size: 30,)),
                                                          ],
                                                        ),

                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }, separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(height: 10,);
                            },);
                          }

                        }
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ]),
        )
    );
  }
}
