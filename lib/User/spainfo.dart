import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:weekly_date_picker/weekly_date_picker.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spa69/User/confirmBooking.dart';

import 'BookApointment.dart';
class spaInfo extends StatefulWidget {
 String? id,email;

 spaInfo(this.id,this.email);

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
  String? spadetail;

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
                // Navigator.pop(context);
                print(widget.id);
                print(widget.email);
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
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('VENDOR').doc(widget.email).collection("Spas").doc(widget.id).snapshots(),
              builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
              }
              else if(snapshot.data == null){
              return Center(child: Text("No Spa FOund"),);
              }
              else{
                return Container(
                  color: Colors.white,
                  child:Column(
                    children: [
                      Container(
                        width: w,
                        height: h*0.35,
                        color: Colors.black,
                        child: Image.network(snapshot.data!.get('imgURL'),fit: BoxFit.fill,),
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
                                    Text(snapshot.data!.get('spaName'),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
                                  ],
                                ),
                                SizedBox(height: 3,),
                                Row(
                                  children: [
                                    Text("${snapshot.data!.get('area')}"+","+"${snapshot.data!.get('city')}")
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
                      // SizedBox(height: 20,),
                      Spacer(),
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
                );
              }

              }
            ),
            Container (
              height:MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('VENDOR').doc(widget.email).collection("Spas").doc(widget.id).collection('services').snapshots(),
                      builder: (context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return Center(child: CircularProgressIndicator(),);
                        }else if(snapshot.data!.docs.isEmpty){
                          return Center(child: Text('No Services Found'),);
                        }else{
                          return ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemCount: snapshot.data!.docs.length,
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 20,bottom: 20),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              if(snapshot.connectionState == ConnectionState.waiting){
                                return Center(child: CircularProgressIndicator());
                              }else if(snapshot.data!.docs.isEmpty){
                                return Center(child: Text('No Services Found'));
                              }else{
                                return GestureDetector(
                                  onTap: () async {
                                    List therapistname=[];
                                    therapistname.clear();


                                    QuerySnapshot snapserv=await FirebaseFirestore.instance.collection('VENDOR').doc(widget.email).collection('Spas').doc(widget.id).collection('services').get();
                                    for(int i=0;i<snapserv.docs[index]["selected_terapiest"].length;i++){
                                      await FirebaseFirestore.instance.collection('VENDOR').doc(widget.email).collection('Spas').doc(widget.id).collection('therapiest').doc(snapserv.docs[index]["selected_terapiest"][i])
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
                                              Text(snapshot.data!.docs[index].get('service_name'),style: TextStyle(fontSize: 20,color: golden),)
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
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        image: DecorationImage(image: NetworkImage(snapshot.data!.docs[index].get('service_img')),fit: BoxFit.fill)
                                                    ),

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
                                                          Text("₹"+'${snapshot.data!.docs[index].get('service_price')}'+"/Hour",style: TextStyle(fontSize: 15,color: Colors.white),),
                                                        ],
                                                      ),
                                                      GestureDetector(
                                                        onTap: (){
                                                          setState(() {
                                                            _SelectedIndex == index;
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
                                                          child: Text("Add",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
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
                                  ),
                                );
                              }

                            }, separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 15,);
                          },);
                        }

                      }
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BookApointment(),));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
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
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: StreamBuilder(
                stream:FirebaseFirestore.instance.collection('VENDOR').doc(widget.email).collection("Spas").doc(widget.id).collection('therapiest').snapshots() ,
                builder: (context, snapshot) {

                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  }else if(snapshot.data!.docs.isEmpty){
                    return Center(child: Text('No Therapist Found'),);
                  }else{
                    return ListView.separated(
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
                                  child: Image.network(snapshot.data!.docs[index].get('imgURl')),
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
                                        Text("Name: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                        Text(snapshot.data!.docs[index].get('name'),style: TextStyle(fontSize: 15),)
                                      ],
                                    ),
                                    SizedBox(height: 3,),
                                    Row(
                                      children: [
                                        Text("Title: ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                                        SizedBox(width: 5,),
                                        Text(snapshot.data!.docs[index].get('title'),style: TextStyle(fontSize: 15),)
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
                    }, itemCount: snapshot.data!.docs.length,);
                  }

                }
              ),
            ),

          ],
        ),
      ),
    );
  }
}
