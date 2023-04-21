import 'package:flutter/material.dart';
class editProfile extends StatefulWidget {
  const editProfile({Key? key}) : super(key: key);

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
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
        title: Text("Edit Profile",),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: w,
                    height: h*0.2,
                    child: Image.asset("assets/images/profile.png",fit: BoxFit.fill,),
                  ),
                  SizedBox(height: h*0.06,),
                  Container(
                    width: w*0.9,
                    child: Column(
                      children: [

                        //NAME FIELD
                        Row(
                          children: [
                            Text("Name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                          ],
                        ),
                        SizedBox(height:h*0.02 ,),
                        Row(
                          children: [
                            Container(
                              width: w*0.9,
                              height: h*0.06,
                              color: Colors.white,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Mark Adair",
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: green,),borderRadius: BorderRadius.circular(10)),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: green,),borderRadius: BorderRadius.circular(10))
                                ),
                              ),
                            )
                          ],
                        ),

                        //EMAIL FIELD
                        SizedBox(height: h*0.02,),
                        Row(
                          children: [
                            Text("Email",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                          ],
                        ),
                        SizedBox(height:h*0.02 ,),
                        Row(
                          children: [
                            Container(
                              width: w*0.9,
                              height: h*0.06,
                              color: Colors.white,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "xxxxxxxx@gmail.com",
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: green,),borderRadius: BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: green,),borderRadius: BorderRadius.circular(10))
                                ),
                              ),
                            )
                          ],
                        ),

                        //PHONE NUMBER FILED
                        SizedBox(height: h*0.02,),
                        Row(
                          children: [
                            Text("Mobile Number",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                          ],
                        ),
                        SizedBox(height:h*0.02 ,),
                        Row(
                          children: [
                            Container(
                              width: w*0.9,
                              height: h*0.06,
                              color: Colors.white,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "+911234567890",
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: green,),borderRadius: BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: green,),borderRadius: BorderRadius.circular(10))
                                ),
                              ),
                            )
                          ],
                        ),

                        //PASSWORD FIELD
                        SizedBox(height: h*0.02,),
                        Row(
                          children: [
                            Text("Passowrd",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                          ],
                        ),
                        SizedBox(height:h*0.02 ,),
                        Row(
                          children: [
                            Container(
                              width: w*0.9,
                              height: h*0.06,
                              color: Colors.white,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "xxxxxxxxxxxx",
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: green,),borderRadius: BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: green,),borderRadius: BorderRadius.circular(10))
                                ),
                              ),
                            ),
                          ],
                        ),

                        //CONTINUE BUTTON
                        // Spacer(),
                        SizedBox(height: h*0.08,),
                        Container(
                          alignment: Alignment.center,
                          width: w*0.9,
                          height: h*0.06,
                          // color: Colors.black,
                          decoration: BoxDecoration(
                            color: golden,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text("Continue",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: h*0.15,
              left: w*0.38,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: green,width: 2)
                ),
                child: Image.asset("assets/images/ahmedabad.png",fit: BoxFit.fill,),
              ),
            ),
          ]
      ),
    );
  }
}
