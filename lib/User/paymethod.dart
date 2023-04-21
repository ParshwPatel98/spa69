import 'package:flutter/material.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:spa69/User/paymentConfirm.dart';
class payMethod extends StatefulWidget {
  const payMethod({Key? key}) : super(key: key);

  @override
  State<payMethod> createState() => _payMethodState();
}

class _payMethodState extends State<payMethod> {
  Color golden = Color(0xFFC18F2C);
  Color green = Color(0xFF1F4B3E) ;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: green,
        elevation: 0,
        title: Text("Payment Method",),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15,top: 20),
                  child: Row(
                    children: [
                      Text("CARD NUMBER",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.93,
                      height: 50,
                      color: Colors.white,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "1234     1234     1234     1234",
                          hintStyle: TextStyle(color: Colors.black54),
                          prefixIcon: Image.asset("assets/images/visa.png"),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: golden),borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: golden),borderRadius: BorderRadius.circular(10))
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,top: 20),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("EXPIRY DATE",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width*0.93,
                  height: 60,
                  // color: Colors.black,
                  child: DropdownDatePicker(
                    inputDecoration: InputDecoration(
                        enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide(color: green, width: 1.0),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ), // optional
                    isDropdownHideUnderline: true, // optional
                    isFormValidator: true, // optional
                    startYear: 1900,

                    showDay: false,// optional
                    endYear: 2020, // optional
                    width: 10, // optional
                    // selectedDay: 14, // optional
                    selectedMonth: 10, // optional
                    selectedYear: 1993, // optional
                    onChangedDay: (value) => print('onChangedDay: $value'),
                    onChangedMonth: (value) => print('onChangedMonth: $value'),
                    onChangedYear: (value) => print('onChangedYear: $value'),
                    boxDecoration: BoxDecoration(
                      // border: Border.all(color: green),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    //boxDecoration: BoxDecoration(
                    // border: Border.all(color: Colors.grey, width: 1.0)), // optional
                    // showDay: false,// optional
                    // dayFlex: 2,// optional
                    // locale: "zh_CN",// optional
                    // hintDay: 'Day', // optional
                    // hintMonth: 'Month', // optional
                    // hintYear: 'Year', // optional
                    // hintTextStyle: TextStyle(color: Colors.grey), // optional
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "CVV",
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: green),borderRadius: BorderRadius.circular(5)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: green),borderRadius: BorderRadius.circular(5)),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 20),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("CARD HOLDER",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.93,
                      height: 50,
                      color: Colors.white,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: green),borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: green),borderRadius: BorderRadius.circular(10))
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Checkbox(
                        // focusColor: green,
                        activeColor: green,
                        value: isChecked,
                        onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },),
                      Text("Save Card For Future Use",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.2),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => paySucess(),));
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
                    child: Text("Confirm Payment",style: TextStyle(fontSize: 20,color: golden),),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
