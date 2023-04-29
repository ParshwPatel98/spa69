import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'confirmBooking.dart';
import 'package:flutter_svg/svg.dart';
class BookApointment extends StatefulWidget {
  const BookApointment({Key? key}) : super(key: key);

  @override
  State<BookApointment> createState() => _BookApointmentState();
}

class _BookApointmentState extends State<BookApointment> {
  Color golden = Color(0xFFC18F2C);
  Color green = Color(0xFF1F4B3E) ;
  List times = ["10:00 AM","11:00 AM","12:00 PM",
    "1:00 PM","2:00 PM","3:00 PM",
    "4:00 AM","5:00 AM","6:00 AM",
    "7:00 PM","8:00 PM","9:00 PM",
    "10:00 AM"
  ];
  // DateTime _selectedDay = DateTime.now();
  late DateTime _selectedDate;
  int _SelectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _resetSelectedDate();
  }

  void _resetSelectedDate() {
    _selectedDate = DateTime.now().add(const Duration(days: 2));
  }
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar:AppBar(
        backgroundColor: green,
        elevation: 0,
        title: Text("Book Time Slots",),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: h*0.02),
        child: Column(
          children: [
            Container(
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 390,
                          height: MediaQuery.of(context).size.height*0.2,
                          decoration: BoxDecoration(
                            color: green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              CalendarTimeline(
                                // shrink: true,
                                showYears: true,
                                initialDate: _selectedDate,
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(Duration(days: 365 * 20)),
                                onDateSelected: (date) => setState(() => _selectedDate = date),
                                leftMargin: 20,
                                monthColor: golden,
                                dayColor: golden,
                                dayNameColor: const Color(0xFF333A47),
                                activeDayColor: Colors.white,
                                activeBackgroundDayColor: golden,
                                dotsColor: const Color(0xFF333A47),
                                selectableDayPredicate: (date) => date.day != 22,
                                locale: 'en',
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20,top: 15),
                          child: Text("Available Time slots",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      child: GridView.count(crossAxisCount: 3,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2.8,
                        children: List.generate(times.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              print(_selectedDate);
                              setState(() {
                                _SelectedIndex = index;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              // width: 123,
                              // height: 40,
                              decoration: BoxDecoration(
                                color: _SelectedIndex==index? green:Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: _SelectedIndex==index?green:golden),
                              ),
                              child: Text(times[index],style: TextStyle(fontSize: 15,color: _SelectedIndex==index?Colors.white:Colors.black),),
                            ),
                          );
                        }),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20,top: 15),
                          child: Text("Massage Therapist",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => confirmBooking(),));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width*0.97,
                          height: 50,
                          child: Text("Book Appointment",style: TextStyle(fontSize: 20,color: golden),),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: golden,width: 2),
                            color: Colors.white,

                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
