import 'package:flutter/material.dart';
import 'package:spa69/User/paymethod.dart';
class paymentMethod extends StatefulWidget {
  const paymentMethod({Key? key}) : super(key: key);

  @override
  State<paymentMethod> createState() => _paymentMethodState();
}

class _paymentMethodState extends State<paymentMethod> {
  Color golden = Color(0xFFC18F2C);
  Color green = Color(0xFF1F4B3E) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        elevation: 0,
        title: Text("Payment Method",),
        centerTitle: true,
        leading:  GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                 width: MediaQuery.of(context).size.width*0.93,
                 height: 50,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: golden),
                  ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Container(
                       width: 20,
                       height: 20,
                        child:Image.asset("assets/images/circle.png") ,
                     ),
                     Container(
                       child: Icon(Icons.wallet,color: green,),
                     ),
                     Text("Pay Via Wallet",style: TextStyle(color: green,fontSize: 15,fontWeight: FontWeight.w500),),
                      Container(width: 130,)
                   ],
                 ),
               ),
             ],
           ),
            SizedBox(height: 30,),
            Container(
              width: MediaQuery.of(context).size.width*0.93,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: golden),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    child:Image.asset("assets/images/circle.png") ,
                  ),
                  Container(
                    child: Icon(Icons.credit_card,color: green,),
                  ),
                  Text("Debit/Credit Card",style: TextStyle(color: green,fontSize: 15,fontWeight: FontWeight.w500),),
                  Container(width: 110,)
                ],
              ),
            ),
            SizedBox(height: 30,),

            Container(
              width: MediaQuery.of(context).size.width*0.93,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: golden),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    child:Image.asset("assets/images/circle.png") ,
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    child: Image.asset("assets/images/netbanking.png"),
                    // color: Colors.black,
                  ),
                  Text("Net Banking",style: TextStyle(color: green,fontSize: 15,fontWeight: FontWeight.w500),),
                  Container(width: 140,)
                ],
              ),
            ),
            SizedBox(height: 30,),

            Container(
              width: MediaQuery.of(context).size.width*0.93,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: golden),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    child:Image.asset("assets/images/circle.png") ,
                  ),
                  Container(
                    child: Icon(Icons.wallet,color: green,),
                  ),
                  Text("UPI",style: TextStyle(color: green,fontSize: 15,fontWeight: FontWeight.w500),),
                  Container(width: 200,)
                ],
              ),
            ),
            SizedBox(height: 200,),

            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => payMethod(),));
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
          ],
        ),
      ),
    );
  }
}
