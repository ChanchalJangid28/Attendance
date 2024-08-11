
import 'package:attendence_app/Screens/Home/Attendence/attendencepage.dart';
import 'package:attendence_app/Screens/Home/Calender/calenderpage.dart';
import 'package:attendence_app/Screens/Home/Profile/profilepage.dart';
import 'package:attendence_app/Widgets/uihelper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static  List<Widget> widgetList=<Widget>[
    AttendencePage(),
    CalenderPage(),
    Profilepage(),

  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF26235C)
        ),
          child: widgetList.elementAt(_selectedIndex)),
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Center(
      //         child: Row(
      //           children: [
      //               Uihelper.CustomElevatedButton((){}, "In", Colors.blue, Colors.white),
      //               SizedBox(width: 30,),
      //             Uihelper.CustomElevatedButton((){}, "Out", Colors.blue, Colors.white),
      //
      //
      //
      //           ],
      //           mainAxisAlignment: MainAxisAlignment.center,
      //         ),
      //       )
      //     ],
      //   ),
      // ),


      bottomNavigationBar: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF26235C),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 50.0,
                  spreadRadius: 4.0,
                )
              ],
            ),
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.calendar_month),label: 'Calender'),
                BottomNavigationBarItem(icon: Icon(Icons.account_box_outlined,),label: 'Profile')
              ],
              backgroundColor: Color(0xFF3E3A84),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white70,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}




