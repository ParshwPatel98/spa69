import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:spa69/Vendor/VendorHomeScreen.dart';
import 'dart:io';

import '../common/coomoonPath.dart';
class addServices extends StatefulWidget {
  const addServices({Key? key}) : super(key: key);

  @override
  State<addServices> createState() => _addServicesState();
}

class _addServicesState extends State<addServices> with SingleTickerProviderStateMixin {
  Color golden = Color(0xFFC18F2C);
  Color green = Color(0xFF1F4B3E) ;
  TextEditingController _therapiest_name = TextEditingController();
  TextEditingController _therapiest_title = TextEditingController();
  TextEditingController _therapiest_working_hours = TextEditingController();
  TextEditingController _therapiest_working_days = TextEditingController();
  TextEditingController _add_services = TextEditingController();
  TextEditingController _add_price = TextEditingController();
  TextEditingController _description = TextEditingController();


  FirebaseFirestore _fstore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  // List<String> _thearapiest_list = [];
  String? selectedValue;
  String? spaName;
  File? profile_photo;
  File? _service_photo;
  List _selectedIndex=[];
  // late TabController _tabController;
  late TabController _tabController;
  String? spaId;



  getSpaName() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    setState(() {
      spaName = sf.getString("spaName");
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
    super.initState();
    // _goToSecondTab();
    getSpaName();
    getspaId();
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
            title: Text("Add Services"),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize:  Size.fromHeight(45),
                child: Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      labelColor:golden,
                      unselectedLabelColor: Colors.white,
                      indicatorColor: golden,
                      labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
                      // indicatorPadding:EdgeInsetsGeometry.infinity ,
                      indicatorSize: TabBarIndicatorSize.tab,
                      onTap: (value) {
                        // getName_fun();
                      },
                      tabs: [
                        Tab(text: "ADD SERVICE",),
                        Tab(text: "ADD PRICE",),
                        Tab(text: "ADD THERAPIST",)
                      ],
                    )
                  ],
                ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
              children:[
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height:h*0.03 ,),
                      Container(
                        width: w*0.9,
                        child: Row(
                          children: [
                            Text("Add a Service",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
                          ],
                        ),
                      ),
                      SizedBox(height: h*0.01,),
                      Container(
                        width: w*0.9,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)
                        ),
                        child:  Container(
                          width: 380,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: TextFormField(
                            controller: _add_services,
                            // controller: email,
                            autofocus: false,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              // filled: true,
                              // fillColor: Colors.black,
                                hintText: "Service Name",
                                prefixIcon: Icon(Icons.add_circle_outline,),
                                prefixIconColor: Colors.black45,
                                border: InputBorder.none
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: h*0.04),
                      Container(
                        width: w*0.9,
                        child: Row(
                          children: [
                            Text('Add Service Image',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                          ]
                        ),
                      ),
                      SizedBox(height: h*0.02,),
                      GestureDetector(
                        onTap: () {
                          Future<void> profile_image() async {
                            XFile? xf = await ImagePicker().pickImage(source: ImageSource.gallery);
                            if (xf != null) {
                              setState(() {
                                _service_photo=File(xf.path);
                              });
                            }
                          }
                          profile_image();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: w*0.9,
                          height: h*0.2,
                          decoration: BoxDecoration(
                            image: DecorationImage(fit: BoxFit.fill,image: _service_photo != null ? FileImage(_service_photo!):AssetImage("assets/images/add_image.png",) as ImageProvider),
                              color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black),
                          ),
                          // child: Icon(Icons.add,size: 50,color: Colors.black38,),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child:  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height:h*0.03 ,),

                        Container(
                          width: w*0.9,
                          child: Row(
                            children: [
                              Text("Add Price",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                        SizedBox(height: h*0.01,),
                        Container(
                          width: w*0.9,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black)
                          ),
                          child:  Container(
                            width: 380,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: TextFormField(
                              // controller: email,
                              controller: _add_price,
                              autofocus: false,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                // filled: true,
                                // fillColor: Colors.black,
                                  hintText: "Add Price",
                                  prefixIcon: Icon(Icons.price_change_outlined,),
                                  prefixIconColor: Colors.black45,
                                  border: InputBorder.none
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: h*0.05,),
                        Container(
                          width: w*0.9,
                          child: Row(children: [
                            Text("Description",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
                          ],),
                        ),
                        SizedBox(height: h*0.01,),
                        Container(
                          width: w*0.9,
                          // height: h*0.055,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black)
                          ),
                          child: TextFormField(
                            controller: _description,
                            decoration: InputDecoration(
                              hintText: "DESCRIPTION",
                              // hintTextDirection: TextDirection.ltr,
                              disabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
                              border: InputBorder.none,
                            ),
                            maxLines: 4,
                            // maxLength: 6,
                          ),
                        ),
                        // Spacer(),
                        SizedBox(height: h*0.38,),
                        // Padding(
                        //   padding: const EdgeInsets.only(bottom: 8.0),
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       _tabController.animateTo(2);
                        //     },
                        //     child: Container(
                        //       alignment: Alignment.center,
                        //       width: w*0.9,
                        //       height: 50,
                        //       decoration: BoxDecoration(
                        //         color: golden,
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //       child: Text("Continue",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height:h*0.03 ,),
                        GestureDetector(
                          onTap: () {
                            // print(serv);
                            // Fluttertoast.showToast(msg: serv.toString());
                            _therapiest_name.clear();
                            _therapiest_title.clear();
                            _therapiest_working_days.clear();
                            _therapiest_working_hours.clear();
                            // _therapiest_name.clear();
                            print(spaName.toString());


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

                                             try{
                                               print("data adding in progress");
                                               FirebaseStorage storage = FirebaseStorage.instance;
                                               Reference ref = storage.ref().child("${_auth.currentUser!.email.toString()}spa").child("images/${spaName.toString()}").child(_therapiest_name.text);
                                               UploadTask uploadTask = ref.putFile(profile_photo!);
                                               await uploadTask.whenComplete(() => print('Image uploaded to Firebase Storage'));
                                               String imageURL = await ref.getDownloadURL();
                                               print('Download URL: $imageURL');
                                               print("photo uploaded");


                                               QuerySnapshot snap =  await snapcom.doc(spaId.toString()).collection('therapiest').get();
                                               int count = snap.docs.length;
                                               snapcom.doc(spaId.toString()).collection('therapiest').doc('${count+1}').set({
                                                 'id': '${count + 1}',
                                                 'name':_therapiest_name.text,
                                                 'title':_therapiest_title.text,
                                                 'working_days':_therapiest_working_days.text,
                                                 'working_hours':_therapiest_working_hours.text,
                                                 'imgURl':imageURL.toString()
                                               }).then((value) {
                                                 print("data Added");
                                                 print(imageURL.toString());
                                               });
                                             }on FirebaseAuthException catch(e){
                                               Fluttertoast.showToast(msg: e.message.toString());
                                             }
                                             Get.back();

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
                            width: w*0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
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
                              ],
                            ),
                          ),
                        ),

                        // Spacer(),
                        SizedBox(height: h*0.06,),
                        Container(
                          width: w*0.95,
                          height: h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            // border: Border.all(color: Colors.black)
                          ),
                          child:StreamBuilder(
                            stream: _fstore.collection('SPAS').doc(_auth.currentUser!.email.toString()).collection("spa").doc(spaId).collection('therapiest').snapshots(),
                            builder: (context,snapshot) {
                              if(snapshot.connectionState==ConnectionState.waiting){
                                return Center(child: CircularProgressIndicator(),);
                                return Center(child: CircularProgressIndicator(),);
                              }
                              else if(snapshot.data!.docs.isEmpty){
                                return Center(child: Text("No Spa FOund"),);
                              }else{
                                return ListView.separated(
                                  itemCount: snapshot.data!.docs.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () async {
                                        setState(() {

                                          if(_selectedIndex.contains(snapshot.data!.docs[index].get("id"))){
                                          _selectedIndex.remove(snapshot.data!.docs[index].get("id"));
                                          }else{
                                            _selectedIndex.add(snapshot.data!.docs[index].get("id"));
                                          }
                                        });

                                      },
                                      child: Container(
                                        width: w*9,
                                        height: h*0.09,
                                        decoration: BoxDecoration(
                                          color: _selectedIndex.contains(snapshot.data!.docs[index].get("id"))?green:Colors.white,
                                          border: Border.all(color: _selectedIndex.contains(snapshot.data!.docs[index].get("id")) ? golden:Colors.black,width: 2 ),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Row(
                                          // mainAxisAlignment: M,
                                          children: [
                                            Container(
                                              width: w*0.2,
                                              height: h*0.075,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(image: NetworkImage(snapshot.data!.docs[index].get("imgURl"))),
                                                  color: Colors.white,
                                                  shape: BoxShape.circle
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Text(snapshot.data!.docs[index].get('name'),style: TextStyle(color: _selectedIndex.contains(snapshot.data!.docs[index].get("id"))?Colors.white:Colors.black ,fontSize: 20),),
                                                Text(snapshot.data!.docs[index].get('title'),style: TextStyle(color: _selectedIndex.contains(snapshot.data!.docs[index].get("id"))?Colors.white:Colors.black ,fontSize: 20),),
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

                      ],
                    ),
                  ),
                ),
              ]
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: GestureDetector(
                  onTap: () async {

                    // Navigator.push(context, MaterialPageRoute(builder: (context) => VendorHomeScreen(),));
                    if(_tabController.index == 0){
                      _tabController.animateTo(1);
                    }else if (_tabController.index == 1){

                      _tabController.animateTo(2);
                    }else{
                      try{

                        FirebaseStorage storage = FirebaseStorage.instance;
                        Reference ref = storage.ref().child("${_auth.currentUser!.email.toString()}spa").child("images/${spaName.toString()}").child(_therapiest_name.text);
                        UploadTask uploadTask = ref.putFile(_service_photo!);
                        await uploadTask.whenComplete(() => print('Image uploaded to Firebase Storage'));
                        String serviceImageURL = await ref.getDownloadURL();
                        // print('Download URL: $imageURL');
                        print("photo uploaded");


                        snapcom.doc(spaId.toString()).collection('services').add({
                          'service_name':_add_services.text,
                          'service_description':_description.text,
                          'service_price':_add_price.text,
                          'service_img':_service_photo.toString(),
                          'selected_terapiest':_selectedIndex.toString()
                        }).then((value) {
                          Get.offAll(VendorHomeScreen());
                        });

                      }on FirebaseAuthException catch(e){
                        Fluttertoast.showToast(msg: e.message.toString());
                      }


                    }
                    print(_tabController.index);
                    _selectedIndex.clear();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: w*0.9,
                    height: 50,
                    decoration: BoxDecoration(
                      color: golden,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text("Continue",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
