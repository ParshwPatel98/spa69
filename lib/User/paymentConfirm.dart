import 'package:flutter/material.dart';
import 'package:spa69/User/BookApointment.dart';
import 'package:spa69/User/appointmentConfirm.dart';
class paySucess extends StatefulWidget {
  const paySucess({Key? key}) : super(key: key);

  @override
  State<paySucess> createState() => _paySucessState();
}

class _paySucessState extends State<paySucess> {
  Color golden = Color(0xFFC18F2C);
  Color green = Color(0xFF1F4B3E) ;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar:AppBar(
          backgroundColor: green,
          elevation: 0,
          title: Text("Payment Success",),
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.7,
                  height: MediaQuery.of(context).size.height*0.3,
                  color: Colors.transparent,
                  child: Image.asset("assets/images/paysucc.png"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Payment Successfully \n          Completed",style: TextStyle(fontSize: 24,color: green,fontWeight: FontWeight.w500),),
              ],
            ),
            Spacer(),
            Padding(
              padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.02),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => appointmentConfirm(),));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width*0.93,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: golden),
                  ),
                  child: Text("Continue",style: TextStyle(fontSize: 20,color: golden),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
