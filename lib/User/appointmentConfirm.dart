import 'package:flutter/material.dart';
import 'package:spa69/User/BottomNavBar.dart';
class appointmentConfirm extends StatefulWidget {
  const appointmentConfirm({Key? key}) : super(key: key);

  @override
  State<appointmentConfirm> createState() => _appointmentConfirmState();
}

class _appointmentConfirmState extends State<appointmentConfirm> {
  Color golden = Color(0xFFC18F2C);
  Color green = Color(0xFF1F4B3E) ;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:AppBar(
        backgroundColor: green,
        elevation: 0,
        title: Text("My Appointments",),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNav(),));
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Container(
        width: w*0.97,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: 8.0,left: w*0.03),
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                return Container(
                  // color: Colors.black,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: green
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 20),
                        //ORDER ID
                        child: Container(
                          // clipBehavior: Clip.hardEdge,
                          // width: ,
                          // color: Colors.black,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Order ID",style: TextStyle(fontSize: 16,color: golden),),
                              SizedBox(height: 5,),
                              Text("123456452",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      //DIVIDER
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*0.93,
                            child: Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      //APPOINTMENT DATE
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Appointment Date",style: TextStyle(fontSize: 16,color: golden),),
                                      SizedBox(height: 5,),
                                      Text("Saturday, March 7, 2023",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),),
                                    ],
                                  ),
                                  Container(width: w*0.15,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("Appointment Time",style: TextStyle(fontSize: 16,color: golden),),
                                      SizedBox(height: 5,),
                                      Text("11:00 AM",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      //DIVIDER
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*0.93,
                            child: Divider(
                              thickness: 1,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      //TYPE OF SERVICE

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Type of Service",style: TextStyle(fontSize: 16,color: golden),),
                                      SizedBox(height: 5,),
                                      Text("Full Body Massage",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),),
                                      Text("Back Massage",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),),
                                      Text("Head Massage",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),),
                                    ],
                                  ),
                                  Container(width: w*0.33,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Total Amount",style: TextStyle(fontSize: 16,color: golden,),),
                                      SizedBox(height: 5,),
                                      Text("\$100.00",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //DIVIDER 3
                    ],
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10,);
              },),
              ),
            )
          ],
        ),
      ),
    );
  }
}
