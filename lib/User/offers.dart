import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:spa69/User/BottomNavBar.dart';
import 'package:spa69/User/spainfo.dart';
import 'package:spa69/common/commontxt.dart';
class Offers extends StatefulWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  Color golden = Color(0xFFC18F2C);
  Color green = Color(0xFF1F4B3E) ;
  FirebaseFirestore fstore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:AppBar(
        backgroundColor: green,
        elevation: 0,
        title: Text("Offers",),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav(),));
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: GestureDetector(
        onTap: () {

        },
        child:StreamBuilder(
            stream: fstore.collection('coupon').snapshots(),
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
              }
              else if(snapshot.data!.docs.isEmpty){
              return Center(child: Text("No Therapist Found"),);
              }else{
                return ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data!.docs.length,
                  padding: EdgeInsets.only(left: 10.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: w*0.9,
                      height:h*0.23 ,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(color: golden,width: 1.5),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: w*0.515,
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
                  return SizedBox(height: 10,);
                },);
              }

            }
        )
      ),
    );
  }
}
