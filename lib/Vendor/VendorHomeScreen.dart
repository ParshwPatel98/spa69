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
  String? spaId;
  File? profile_photo;
  TextEditingController _therapiest_name = TextEditingController();
  TextEditingController _therapiest_title = TextEditingController();
  TextEditingController _therapiest_working_days = TextEditingController();
  TextEditingController _therapiest_working_hours = TextEditingController();

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

  @override
  void initState() {
    // TODO: implement initState
    getspaName();
    getspaId();
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
                  Navigator.pop(context);
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
                                                  // child: Image.asset("assets/images/ahmedabad.png",fit: BoxFit.fill,),
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
                                          // maxLines: 4,
                                          // maxLength: 6,
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
                                          // maxLines: 4,
                                          // maxLength: 6,
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
                                      InkWell(
                                        onTap: () async {
                                          // print("data adding in progress");
                                          // FirebaseStorage storage = FirebaseStorage.instance;
                                          // Reference ref = storage.ref().child("${_auth.currentUser!.email.toString()}spa").child("images/${spaName.toString()}").child(_therapiest_name.text);
                                          // UploadTask uploadTask = ref.putFile(profile_photo!);
                                          // await uploadTask.whenComplete(() => print('Image uploaded to Firebase Storage'));
                                          // String imageURL = await ref.getDownloadURL();
                                          // print('Download URL: $imageURL');
                                          // print("photo uploaded");
                                          //
                                          //
                                          // QuerySnapshot snap =  await snapcom.doc(spaId.toString()).collection('therapiest').get();
                                          // int count = snap.docs.length;
                                          // snapcom.doc(spaId.toString()).collection('therapiest').doc('${count+1}').set({
                                          //   'id':'${count + 1}',
                                          //   'name':_therapiest_name.text,
                                          //   'title':_therapiest_title.text,
                                          //   'working_days':_therapiest_working_days.text,
                                          //   'working_hours':_therapiest_working_hours.text,
                                          //   'imgURl':imageURL.toString()
                                          // }).then((value) {
                                          //   print("data Added");
                                          //   print(imageURL.toString());
                                          // });
                                          //
                                          // Get.back();

                                          _addtherapiest.addtherapiest(_therapiest_name.text, _therapiest_title.text, _therapiest_working_days.text, _therapiest_working_hours.text, spaName.toString(), spaId.toString(), profile_photo!);

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
                      stream: _fstore.collection('SPAS').doc(_auth.currentUser!.email.toString()).collection("spa").doc(spaId).collection('therapiest').snapshots(),
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
                                  height: h*0.22,
                                  decoration: BoxDecoration(
                                      color: green,
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Icon(Icons.mode_edit_outline_outlined,color: golden,size: 26,),
                                            SizedBox(width: 10,),
                                            Icon(Icons.delete,color: golden,size: 26,)
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
                                              child: Image.asset("assets/images/goa.png"),
                                            ),
                                            SizedBox(width: 10,),
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
                                      SizedBox(height: 3,),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: [
                                            Text("Working Hours",style: TextStyle(fontSize: 15,color: Colors.white),)
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 3,),
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
                  Container(
                    alignment: Alignment.center,
                    width: w*0.95,
                    height: h*0.05,
                    decoration: BoxDecoration(
                      color: golden,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text("Save",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
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
                      child: ListView.separated(
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                        return Container(
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
                                  Text("Full Body Massage",style: TextStyle(fontSize: 20,color: golden,fontWeight: FontWeight.w500),)
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
                                          child: Image.asset("assets/images/spaimg.png",fit: BoxFit.fill,),
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
                                                  Text("\$40/Hours",style: TextStyle(fontSize: 15,color: Colors.white),),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [

                                                  Icon(Icons.delete,color: golden,size: 30,),
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
                        );
                      }, separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 10,);
                      },),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      alignment: Alignment.center,
                      width: w*0.95,
                      height: 50,
                      decoration: BoxDecoration(
                        color: golden,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Save",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
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
