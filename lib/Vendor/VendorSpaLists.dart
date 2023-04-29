import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spa69/User/Login.dart';
import 'package:spa69/Vendor/VendorHomeScreen.dart';
import 'package:spa69/common/commontxt.dart';
import 'package:spa69/commonFunction/allcommfunc.dart';
import 'dart:io';

import 'package:spa69/vendorSignUp.dart';

import '../common/coomoonPath.dart';
class vendorspalists extends StatefulWidget {
  const vendorspalists({Key? key}) : super(key: key);

  @override
  State<vendorspalists> createState() => _vendorspalistsState();
}

class _vendorspalistsState extends State<vendorspalists> {

  String dropdownvalue = 'OPEN';
  File? spa_photo;
  TextEditingController spaName = TextEditingController();
  TextEditingController apartment_controller = TextEditingController();
  TextEditingController area_controller = TextEditingController();
  TextEditingController city_controller = TextEditingController();

  final fstore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  // final loading = false.obs;
  final snapcomm= FirebaseFirestore.instance.collection("SPAS").doc(FirebaseAuth.instance.currentUser!.email.toString()).collection('spa');
  final _addSpa = Get.put(allfunc());
  String? utype;

  getutype() async{
    SharedPreferences sf = await SharedPreferences.getInstance();
    setState(() {
      utype = sf.getString("utype");
    });
  }
  
@override
  void initState() {
    // TODO: implement initState
  getutype();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    Color golden = Color(0xFFC18F2C);
    Color green = Color(0xFF1F4B3E) ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:green,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () async {
                  Get.offAll(LoginPage());
                  SharedPreferences sf = await SharedPreferences.getInstance();
                  sf.clear();
                },
                child: Icon(Icons.logout,color: Colors.white,size: 25,)),
          )
        ],
        automaticallyImplyLeading: false,
        title: GestureDetector(
            onTap: (){
              // _getIMage();

            },
            child: Text("Your total Spa")),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:10,top: 10),
              child: Row(
                children: [
                  Text("Your Total Number Of spa's",style: TextStyle(color: green,fontSize: 20),),
                ],
              ),
            ),
            SizedBox(height: h*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: (){
                      spaName.clear();
                      apartment_controller.clear();
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)
                              )),
                          context: context,
                          builder: (context){
                            return StatefulBuilder(
                                builder:(context,setState) {
                                  return Container(
                                    padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                    width: w*0.9,
                                    color: Colors.white,
                                    child: SingleChildScrollView(

                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(height: h*0.04,),
                                          GestureDetector(
                                            onTap: () {
                                              Future<void> profile_image() async {
                                                XFile? xf = await ImagePicker().pickImage(source: ImageSource.gallery);
                                                if (xf != null) {
                                                  setState(() {
                                                    spa_photo=File(xf.path);
                                                  });
                                                }
                                              }
                                              profile_image();
                                            },
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: 80,
                                                  height: 80,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(fit: BoxFit.fill,image: spa_photo!= null ? FileImage(spa_photo!):AssetImage("assets/images/ahmedabad.png",) as ImageProvider),
                                                      shape: BoxShape.circle,
                                                      color: Colors.white,
                                                      border: Border.all(color: golden)
                                                  ),
                                                ),
                                                Positioned(
                                                  left: 45,
                                                  top: 59,
                                                  child: Container(
                                                    width: 25,
                                                    height: 25,
                                                    color: Colors.white,
                                                    child: Icon(Icons.camera_alt_outlined,color: golden,),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: h*0.05,),
                                          Container(
                                            width: w*0.9,
                                            height: h*0.055,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(color: golden)
                                            ),
                                            child: TextFormField(
                                              controller: spaName,
                                              autofocus: false,
                                              cursorColor: Colors.black,
                                              decoration: InputDecoration(
                                                hintText: "Enter Spa Name",
                                                prefixIcon: Icon(Icons.drive_file_rename_outline,),
                                                prefixIconColor: Colors.black54,
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: h*0.02,),

                                          Container(
                                            width: w*0.9,
                                            height: h*0.055,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(color: golden)
                                            ),
                                            child: TextFormField(
                                              controller: apartment_controller,
                                              autofocus: false,
                                              cursorColor: Colors.black,
                                              decoration: InputDecoration(
                                                hintText: "Flat,House No.,Building,Company,Apartment",
                                                prefixIcon: Icon(Icons.apartment,),
                                                prefixIconColor: Colors.black54,
                                                border: InputBorder.none,

                                              ),
                                            ),
                                          ),
                                          SizedBox(height: h*0.02,),
                                          Container(
                                            width: w*0.9,
                                            height: h*0.055,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(color: golden)
                                            ),
                                            child: TextFormField(
                                              controller: area_controller,
                                              autofocus: false,
                                              cursorColor: Colors.black,
                                              decoration: InputDecoration(
                                                hintText: "Area,Street,Sector,Village",
                                                prefixIcon: Icon(Icons.streetview,),
                                                prefixIconColor: Colors.black54,
                                                border: InputBorder.none,

                                              ),
                                            ),
                                          ),
                                          SizedBox(height: h*0.02,),
                                          Container(
                                            width: w*0.9,
                                            height: h*0.055,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(color: golden)
                                            ),
                                            child: TextFormField(
                                              controller: city_controller,
                                              autofocus: false,
                                              cursorColor: Colors.black,
                                              decoration: InputDecoration(
                                                hintText: "Town/City",
                                                prefixIcon: Icon(Icons.location_city,),
                                                prefixIconColor: Colors.black54,
                                                border: InputBorder.none,

                                              ),
                                            ),
                                          ),
                                          SizedBox(height: h*0.02,),
                                          Container(
                                            width: w*0.9,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: golden),
                                                borderRadius: BorderRadius.circular(15)
                                            ),
                                            child: DropdownButton(
                                              // Initial Value
                                              value: dropdownvalue,
                                              // Down Arrow Icon
                                              icon: Padding(
                                                padding: const EdgeInsets.only(right: 12.0),
                                                child: const Icon(Icons.keyboard_arrow_down),
                                              ),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  dropdownvalue = newValue!;
                                                });
                                              },
                                              underline: Container(),
                                              // Array list of items
                                              isExpanded: true,
                                              hint: Padding(
                                                padding: const EdgeInsets.only(left: 10.0),
                                                child: Text("Choose"),
                                              ),
                                              // alignment: Alignment.center,
                                              items: [
                                                DropdownMenuItem(
                                                  value: 'OPEN',
                                                  child: Padding(
                                                    padding: EdgeInsets.only(left: 12.0),
                                                    child: Text("Open",style: TextStyle(fontWeight: FontWeight.w500),),
                                                  ),
                                                ),
                                                DropdownMenuItem(
                                                  value: 'CLOSE',
                                                  child: Padding(
                                                    padding: EdgeInsets.only(left: 12.0),
                                                    child: Text("Close",style: TextStyle(fontWeight: FontWeight.w500),),
                                                  ),
                                                ),
                                              ],
                                              // After selecting the desired option, it will
                                              // change button value to selected value
                                            ),
                                          ),
                                          SizedBox(height: h*0.02,),
                                          Obx(
                                            () {
                                              return Container(
                                                child: _addSpa.addspaloading.value ? CircularProgressIndicator(color: Colors.black):
                                                GestureDetector(
                                                  onTap: () async {

                                                    // _addSpa.addspa(spaName.text, location.text, dropdownvalue.toString(), spa_photo!,auth.currentUser!.email.toString(),utype.toString());
                                                    _addSpa.addspa(spaName.text, apartment_controller.text, dropdownvalue.toString(), spa_photo!, auth.currentUser!.email.toString(), utype.toString(), area_controller.text, city_controller.text);
                                                  },


                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    width: w*0.22,
                                                    height: h*0.055,
                                                    decoration: BoxDecoration(
                                                        color: golden,
                                                        border: Border.all(color: golden),
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child:Text("Save",style: TextStyle(color: Colors.white),),
                                                  ),
                                                ),
                                              );
                                            }
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            );
                          });
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
                ),
              ],
            ),
            SizedBox(height: h*0.03,),
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection(utype.toString()).doc(FirebaseAuth.instance.currentUser!.email.toString()).collection('Spas').snapshots(),
              builder: (context, snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }
                else if(snapshot.data!.docs.isEmpty){
                  return Center(child: Text("No Spa FOund"),);
                }
                else{
                  return Container(
                    width: w*0.95,
                    height: h*0.7,
                    color: Colors.white,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,

                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(snapshot.data!.docs.length, (index) {
                        return GestureDetector(
                          onTap: () async {
                            SharedPreferences sf = await SharedPreferences.getInstance();
                            sf.setString("spaName",snapshot.data!.docs[index].get("spaName") );

                            SharedPreferences spaIdSf = await SharedPreferences.getInstance();
                            spaIdSf.setString('spaId', snapshot.data!.docs[index].get("id").toString());


                            // print(spaId);

                            // Fluttertoast.showToast(msg: spaName.text.toString());

                            Get.to(VendorHomeScreen());
                          },
                          child: Container(
                            width: w*0.3,
                            height: h*0.2,
                            decoration: BoxDecoration(
                              color: green,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image: NetworkImage(snapshot.data!.docs[index].get("imgURL")),fit: BoxFit.fill),
                                      color: Colors.white,
                                      shape: BoxShape.circle
                                  ),
                                ),
                                Text(
                                    snapshot.data!.docs[index].get("spaName"),
                                    style: TextStyle(color: Colors.white,fontSize: 15
                                    )),
                                Text(
                                    snapshot.data!.docs[index].get("apartmnet"),
                                    style: TextStyle(color: Colors.white,fontSize: 15
                                    )),
                                Text(
                                    snapshot.data!.docs[index].get("area"),
                                    style: TextStyle(color: Colors.white,fontSize: 15
                                    )),
                                Text(
                                    snapshot.data!.docs[index].get("city"),
                                    style: TextStyle(color: Colors.white,fontSize: 15
                                    )),
                                Text(
                                    snapshot.data!.docs[index].get("available"),
                                    style: TextStyle(color: Colors.green,fontSize: 15,
                                    )),

                              ],
                            ),
                          ),
                        );
                      }),

                    ),
                  );
                }

              },
            )
          ],
        ),
      ),
    );
  }
}
