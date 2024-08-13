import 'dart:core';
import 'dart:developer';
import 'package:attendence_app/Screens/Home/Profile/Profilepage/profileBlocs/profilebloc.dart';
import 'package:attendence_app/Screens/Home/Profile/Profilepage/profileBlocs/profilestates.dart';
import 'package:attendence_app/Screens/Home/Profile/Profilepage/profileController/ProfileController.dart';
import 'package:attendence_app/Screens/Home/Profile/leavespage/leaveController/leaveController.dart';
import 'package:attendence_app/Widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'leavespage/leavepage.dart';

class Profilepage extends StatefulWidget {
  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  // //String username='',email='';
   String? username;
  // String? email;
  //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProfileController.fetchUser(context);
  }
  //
  // void getData() async {
  //   log("getdata called");
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     username = prefs.getString("username");
  //     email = prefs.getString("email");
  //   });
  //
  //   // email!=prefs.getString("email");
  //   log(username.toString());
  //   log(email.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF26235C),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.account_box_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body:
      BlocConsumer<ProfileBloc, ProfileStates>(listener: (context, state) {

        if (state is ProfileLoadedState) {

          username=state.profileModel.data!.email.toString();
          log("data from bloc");
          log(username!);

        } else if (state is ProfileErrorState) {
          log(state.errormsg.toString());
        }
      }, builder: (context, state) {
        if (state is ProfileLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: Color(0xFF26235C)),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 100,
              ),
              Container(
                width: 350,
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  //color:Color(0xFF3E3A84),
                  color: Color(0xFF3E3A84),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white24,
                      blurRadius: 20.0,
                      spreadRadius: 10.0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(300.0),
                          bottomRight: Radius.circular(300.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('assets/images/img.png'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Hello',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: Icon(Icons.account_box, color: Colors.white),
                      title: Text(
                        'Username : $username',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.email, color: Colors.white),
                      title: Text(
                        'Email : ',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Image.asset(
                        'assets/images/img_5.png',
                        height: 30,
                        width: 30,
                      ),
                      title: Text(
                        'Leaves  ',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing:
                          Icon(Icons.arrow_forward_ios, color: Colors.white),
                      onTap: ()=>{
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>Leavepage()) )
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    // ElevatedButton(onPressed: (){}, child: Icon(Icons.logout),),

                    Uihelper.CustomIconButton(() {}, "Log out", Icons.logout,
                        Colors.blue, Colors.white),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        );
      }),
    );
  }
}
