import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class changePassword extends StatefulWidget {
  const changePassword({Key? key}) : super(key: key);

  @override
  State<changePassword> createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  Color golden = Color(0xFFC18F2C);
  Color green = Color(0xFF1F4B3E) ;
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:AppBar(
        backgroundColor: green,
        elevation: 0,
        title: Text("Change Password",),
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
                width: w*0.5,
                height:h *0.2,
                color: Colors.transparent,
                child: Row(
                  children: [
                    Container(
                      width: w*0.2,
                      height: h*0.14,
                      color: Colors.transparent,
                      child: SvgPicture.asset("assets/images/lady.svg")
                    ),
                    SizedBox(width:w*0.04 ,),
                    Text("Sparks",style: TextStyle(fontSize: 32,color: golden,fontWeight: FontWeight.w500),)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height:h*0.04 ,),
          Container(
            width: w*0.9,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: w*0.9,
                      height: h*0.06,
                      color: Colors.white,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Old Password",
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: green,),borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: green,),borderRadius: BorderRadius.circular(10)),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                      ),
                    )
                  ],
                ),


                //NEW PASSWORD
                SizedBox(height:h*0.04 ,),
                Row(
                  children: [
                    Container(
                      width: w*0.9,
                      height: h*0.06,
                      color: Colors.white,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "New Password",
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: green,),borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: green,),borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                      ),
                    )
                  ],
                ),

                //CONFIRM NEW PASSWORD
                SizedBox(height:h*0.04 ,),
                Row(
                  children: [
                    Container(
                      width: w*0.9,
                      height: h*0.06,
                      color: Colors.white,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Confirm New Password",
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: green,),borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: green,),borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              alignment: Alignment.center,
              width: w*0.9,
              height: h*0.06,
              // color: Colors.black,
              decoration: BoxDecoration(
                  color: golden,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Text("Confirm Password",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}
