// import 'dart:js';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/chatbot.dart';
import 'package:flutter_app_1/login.dart';
import 'package:flutter_app_1/notcreate.dart';
import 'package:flutter_app_1/notifdisplay.dart';
import 'package:flutter_app_1/notifedit.dart';
import 'package:flutter_app_1/notlist.dart';
import 'package:flutter_app_1/signup.dart';
import 'package:flutter_app_1/wo1.dart';
import 'package:flutter_app_1/wocreate.dart';
import 'package:flutter_app_1/wodisp.dart';
import 'package:flutter_app_1/woedit.dart';
import 'package:flutter_app_1/worderlist.dart';
import 'package:flutter_app_1/workorder.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: HomePage(),
    initialRoute: '/home',
    routes: {
      '/home': (context) => HomePage(),
      '/login': (context) => LoginPage(),
      '/signuppage': (context) => SignUpPage(),
      '/dashboard': (context) => HomeScreen(),
      '/chatbot': (context) => HomePageDialogflow(),
      '/wopage': (context) => WorkOrder(),
      WorkOrder().id: (context) => WorkOrder(),
      '/wocreatepage': (context) => WoCreatePage(),
      '/wodisplaypage': (context) => Workorderdisplay(),
      Workorderdisplay().id: (context) => Workorderdisplay(),
      '/wocreatepage': (context) => WoCreate(),
      '/notifpage': (context) => NotifListPage(),
      '/notifdisplay': (context) => NotifDisplay(),
      NotifDisplay().id: (context) => NotifDisplay(),
      NotifListPage().id: (context) => NotifListPage(),
      // '/notifdisplay': (context) => NotifDisplay(),
      '/noteditpage': (context) => NotEditPage(),
      '/notcreatepage': (context) => NotifCreate()
    },
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Welcome to",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    " Maintenance Portal ",
                    style: TextStyle(
                      color: Color(0xffFF3B5F),
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Maintenance Portal needs to be designed and developed to provide easy and anywhere access through our mobile phone which has the below functionalities. The maintenance portal will be accessed by the maintenance department or maintenance engineer belonging to the organization (plant). The need of maintenance portal is to access and view the complete maintenance related activities of the organization (plant).",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/welcome.png"))),
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    color: Color(0xff0095FF),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Get Started -->",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  // SizedBox(height: 20),
                  // MaterialButton(
                  //   minWidth: double.infinity,
                  //   height: 60,
                  //   onPressed: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => SignUpPage()));
                  //   },
                  //   color: Color(0xff0095FF),
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(50)),
                  //   child: Text(
                  //     "SignUp",
                  //     style: TextStyle(
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.w600,
                  //         fontSize: 18),
                  //   ),
                  // )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
