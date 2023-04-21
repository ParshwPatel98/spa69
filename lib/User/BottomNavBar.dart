import 'package:flutter/material.dart';
import 'package:spa69/User/appointmentConfirm.dart';
import 'package:spa69/User/homePage.dart';
import 'package:spa69/User/offers.dart';
import 'package:spa69/User/profile.dart';
class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  Color golden = Color(0xFFC18F2C);
  Color green = Color(0xFF1F4B3E) ;
  int index = 0;
  List widgets = <Widget>[
    homePage(),
    appointmentConfirm(),
    Offers(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: widgets[index],
      bottomNavigationBar: BottomNavigationBar(
        // elevation: 0,
        currentIndex: index,
        selectedItemColor:golden,
        unselectedItemColor: Colors.black54,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket_outlined,),label: "Booking"),
          BottomNavigationBarItem(icon: Icon(Icons.discount_outlined),label: "Offers"),
          BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle_outlined),label: "Profile")
        ],
        selectedIconTheme: IconThemeData(
          size: 40,
          fill: 0.1,
          // opacity: 1,
        ),
      ),
    );
  }
}
