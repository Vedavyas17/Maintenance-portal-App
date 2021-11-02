import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_1/chatbot.dart';
import 'package:flutter_app_1/notcreate.dart';
import 'package:flutter_app_1/notifdisplay.dart';
import 'package:flutter_app_1/notifedit.dart';
import 'package:flutter_app_1/notlist.dart';
import 'package:flutter_app_1/wo1.dart';
import 'package:flutter_app_1/wocreate.dart';
import 'package:flutter_app_1/wodisp.dart';
import 'package:flutter_app_1/woedit.dart';
import 'package:flutter_app_1/worderlist.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app_1/workorder.dart';
import 'package:flutter_app_1/notify.dart';
import 'package:flutter_svg/svg.dart';

const kBackgroundColor = Color(0xFFF8F8F8);
const kActiveIconColor = Color(0xFFE68342);
const kTextColor = Color(0xFF222B45);
const kBlueLightColor = Color(0xFFC7B8F5);
const kBlueColor = Color(0xFF817DC0);
const kShadowColor = Color(0xFFE6E6E6);
const kTexColor = Color(0xFF607d8b);

// class SignUpPage extends StatelessWidget {
//   // const SignUpPage({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         fontFamily: "Cairo",
//         scaffoldBackgroundColor: kBackgroundColor,
//         textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
//       ),
//       // home: HomeScreen(),
//       initialRoute: '/dashboard',
//       routes: {
//         '/dashboard':(context)=>HomeScreen(),
//       },
//     );
//   }
// }

class SignUpPage extends StatefulWidget {
  // const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      // home: HomeScreen(),
      initialRoute: '/dashboard',
      routes: {
        '/dashboard': (context) => HomeScreen(),
        '/wopage': (context) => WorkOrder(),
        '/wodisplaypage': (context) => Workorderdisplay(),
        WorkOrder().id: (context) => WorkOrder(),
        '/notifpage': (context) => NotifListPage(),
        '/notifdisplay': (context) => NotifDisplay(),
        // '/notifdisplay': (context) => NotifDisplay(),
        '/chatbot': (context) => HomePageDialogflow(),
        NotifDisplay().id: (context) => NotifDisplay(),
        '/wocreatepage': (context) => WoCreate(),
        '/notcreatepage': (context) => NotifCreate(),
        '/oeditpage': (context) => WoEditPage(),
        '/noteditpage': (context) => NotEditPage()
      },
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   // const HomeScreen({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//
//       body: Stack(
//         children: <Widget>[
//           Container(
//             height: size.height * .45,
//             decoration: BoxDecoration(
//               color: Color(0xFFF5CEB8),
//               image: DecorationImage(
//                 alignment: Alignment.centerLeft,
//                 image: AssetImage("assets/images/undraw.png"),
//               ),
//             ),
//           ),
//           SafeArea(
//               child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Container(
//                     alignment: Alignment.center,
//                     height: 52,
//                     width: 52,
//                     decoration: BoxDecoration(
//                       color: Color(0xFFF2BEA1),
//                       shape: BoxShape.circle,
//                     ),
//                     child: SvgPicture.asset("assets/icons/menu.svg"),
//                   ),
//                 ),
//                 Text(
//                   "Maintainence \n Dashboard ",
//                   style: Theme.of(context)
//                       .textTheme
//                       .headline4
//                       .copyWith(fontWeight: FontWeight.w900),
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(vertical: 30),
//                   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(29.5),
//                   ),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: "Search",
//                       icon: SvgPicture.asset("assets/icons/search.svg"),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                     child: GridView.count(
//                   crossAxisCount: 2,
//                   childAspectRatio: 0.85,
//                   crossAxisSpacing: 20,
//                   mainAxisSpacing: 20,
//                   children: <Widget>[
//                     CategoryCard(
//                       title: "Work Order",
//                       svgSrc: "assets/icons/hamburger.svg",
//                       press: () {
//                         Navigator.pushNamed(context,'/wopage');
//                       },
//                     ),
//                     CategoryCard(
//                       title: "Notifications",
//                       svgSrc: "assets/icons/date-reminder.svg",
//                       press: () {
//                         Navigator.pushNamed(context,'/notifpage');
//                       },
//                     ),
//                     CategoryCard(
//                       title: "Chat Bot",
//                       svgSrc: "assets/icons/Meditation.svg",
//                       press: () {},
//                     ),
//                     // CategoryCard(
//                     //   title: "other",
//                     //   svgSrc: "assets/yoga.svg",
//                     //   press: () {},
//                     // )
//                   ],
//                 )),
//               ],
//             ),
//           ))
//         ],
//       ),
//     );
//   }
// }

// class CategoryCard extends StatelessWidget {
//   final String svgSrc;
//   final String title;
//   final Function press;
//   const CategoryCard({
//     Key key,
//     this.svgSrc,
//     this.title,
//     this.press,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(13),
//       child: Container(
//         // padding: EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(13),
//           boxShadow: [
//             BoxShadow(
//               offset: Offset(0, 17),
//               blurRadius: 17,
//               spreadRadius: -23,
//               color: kShadowColor,
//             ),
//           ],
//         ),
//         child: Material(
//           color: Colors.transparent,
//           child: InkWell(
//             onTap: press,
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 children: <Widget>[
//                   Spacer(),
//                   SvgPicture.asset(svgSrc),
//                   Spacer(),
//                   Text(
//                     title,
//                     textAlign: TextAlign.center,
//                     style: Theme.of(context)
//                         .textTheme
//                         .headline6
//                         .copyWith(fontSize: 18),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw.png"),
              ),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Color(0xFFF2BEA1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset("assets/icons/menu.svg"),
                  ),
                ),
                Text(
                  "Maintainence \n Dashboard ",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.w900),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(29.5),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      icon: SvgPicture.asset("assets/icons/search.svg"),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Expanded(
                    child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: <Widget>[
                    CategoryCard(
                      title: "Work Order",
                      svgSrc: "assets/icons/hamburger.svg",
                      press: () {
                        Navigator.pushNamed(context, '/wopage');
                      },
                    ),
                    CategoryCard(
                      title: "Notifications",
                      svgSrc: "assets/icons/date-reminder.svg",
                      press: () {
                        Navigator.pushNamed(context, '/notifpage');
                      },
                    ),
                    CategoryCard(
                      title: "Chat Bot",
                      svgSrc: "assets/icons/Meditation.svg",
                      press: () {
                        Navigator.pushNamed(context, '/chatbot');
                      },
                    ),
                    // CategoryCard(
                    //   title: "other",
                    //   svgSrc: "assets/yoga.svg",
                    //   press: () {},
                    // )
                  ],
                )),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function press;
  const CategoryCard({
    Key key,
    this.svgSrc,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: kShadowColor,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  SvgPicture.asset(svgSrc),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 18),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
