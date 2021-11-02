import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

const kBackgroundColor = Color(0xFFF8F8F8);
const kActiveIconColor = Color(0xFFE68342);
const kTextColor = Color(0xFF222B45);
const kBlueLightColor = Color(0xFFC7B8F5);
const kBlueColor = Color(0xFF817DC0);
const kShadowColor = Color(0xFFE6E6E6);

class Notify extends StatelessWidget {
  // const WorkOrder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: kBlueLightColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage("assets/images/example-29.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // SizedBox(
                  //   height: size.height * 0.05,
                  // ),
                  Text(
                    "Notifications",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Create and Change Notifications",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: size.width * .6, // it just take 60% of total width
                    child: Text(
                      "SAP maintenance notification is used to notify maintenance department about an abnormal or exceptional situation(s) in technical objects at the plant. It is also used for planned maintenance activity and to notify planners.",
                    ),
                  ),
                  // SizedBox(
                  //   width: size.width * .5, // it just take the 50% width
                  //   child: Container(
                  //     margin: EdgeInsets.symmetric(vertical: 30),
                  //     padding:
                  //         EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(29.5),
                  //     ),
                  //     child: TextField(
                  //       decoration: InputDecoration(
                  //         hintText: "Search",
                  //         icon: SvgPicture.asset("assets/icons/search.svg"),
                  //         border: InputBorder.none,
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
