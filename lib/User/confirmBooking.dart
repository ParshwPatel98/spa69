import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spa69/User/paaymentMethod.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';
class confirmBooking extends StatefulWidget {
  const confirmBooking({Key? key}) : super(key: key);

  @override
  State<confirmBooking> createState() => _confirmBookingState();
}

class _confirmBookingState extends State<confirmBooking> {
  Color golden = Color(0xFFC18F2C);
  Color green = Color(0xFF1F4B3E) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        elevation: 0,
        leading:  GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Text("Confirm Booking",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 370,
              // color: Colors.blue,
              child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  height: 110,
                  // color: Colors.black,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Full Body Massage",style: TextStyle(fontSize: 15,color: golden,fontWeight: FontWeight.w500),),
                          Container(width: 220,)
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 100,
                            height: 80,
                            // color: Colors.black,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Image.asset("assets/images/streached.png"),
                          ),
                          SvgPicture.asset("assets/images/greenheart.svg"),
                          Text("60min",style: TextStyle(fontSize: 15,color: green,fontWeight: FontWeight.w500),),
                          Text("\$40",style: TextStyle(fontSize: 15,color: green,fontWeight: FontWeight.w500),),
                          Icon(Icons.cancel,color: green,)
                        ],
                      )
                    ],
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Colors.black,
                    thickness: 1,
                  );
              },),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Book Appointment",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: green),),
                      Icon(Icons.calendar_today_rounded,color: green,)
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              width:MediaQuery.of(context).size.width ,
              height: 150,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 247,
                    height: 55,
                    decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Text("Saturday, Mar 7, 2023",style: TextStyle(fontSize: 16,color: Colors.white),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 247,
                    height: 55,
                    decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.watch_later_outlined,color: Colors.white,),
                        Container(width: 10,),
                        Text("11:00 AM",style: TextStyle(fontSize: 16,color: Colors.white),)
                      ],
                    )
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22,top: 20),
              child: Row(
                children: [
                  Text("Massage Therapist",style: TextStyle(fontSize: 20,color: green,fontWeight: FontWeight.w500),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22,top: 20),
              child: Row(
                children: [
                  Container(
                    width: 177,
                    height: 177,
                    decoration: BoxDecoration(
                        color: green,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle
                          ),
                          child: Image.asset("assets/images/ahmedabad.png"),
                        ),
                        Text("Julie Cook",style: TextStyle(fontSize: 15,color: Colors.white),),
                        Text("Available",style: TextStyle(fontSize:12,color: Colors.green ),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22,top: 20),
              child: Row(
                children: [
                  Text("Apply Coupon",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: green),)
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width*0.9,
              height: 50,
              color: Colors.white,
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: golden),borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),bottomRight:Radius.circular(10),topLeft:Radius.circular(10),bottomLeft: Radius.circular(10)  )
                  ),
                  focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: golden),borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),bottomRight:Radius.circular(10),topLeft:Radius.circular(10),bottomLeft: Radius.circular(10)  )
                  ),
                  border: InputBorder.none,
                  hintText: "Enter Coupon Code",
                  hintStyle: TextStyle(fontSize: 15),
                  prefixIcon: Container(
                    width: 50,
                    height: 50,
                    child: Image.asset("assets/images/discount.png"),
                    ),
                  suffixIcon: Container(
                    alignment: Alignment.center,
                    width: 103,
                    height: 50,
                    decoration: BoxDecoration(
                        color: golden,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight:Radius.circular(10) )
                    ),
                    child: Text("Apply",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w500),),
                  )
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width*0.9,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: green)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Sub Total: ",style: TextStyle(fontSize: 16,),),
                      SizedBox(width: 180,),
                      Text("\$120.00",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Charges: ",style: TextStyle(fontSize: 16,),),
                      SizedBox(width: 180,),
                      Text("\$120.00",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Discount: ",style: TextStyle(fontSize: 16,),),
                      SizedBox(width: 180,),
                      Text("\$120.00",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Sub Total: ",style: TextStyle(fontSize: 16,),),
                      SizedBox(width: 180,),
                      Text("\$120.00",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => paymentMethod(),));
              },
              child: Container(
                alignment: Alignment.center,
                width:MediaQuery.of(context).size.width*0.9 ,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: golden),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text("Confirm Booking",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: golden),),
              ),
            ),
            Container(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
