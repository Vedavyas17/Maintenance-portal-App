import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/notlist.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:provider/provider.dart';
// import 'package:maintainence/screens/display_notif.dart';
// import 'package:maintainence/model/notdisplay.dart';
// import 'package:maintainence/services/notdisplay.dart';

class NotifDisplay extends StatefulWidget {
  String id = 'notifdisplay';
  String number;
  NotifDisplay({this.number});
  @override
  _NotifDisplayState createState() => _NotifDisplayState(number);
}

class _NotifDisplayState extends State<NotifDisplay> {
  final String title = 'Status';
  String number;
  _NotifDisplayState(this.number);

  String notifino = ''; //
  String planplant = ''; //
  String locacc = '';
  String equipid = ''; //
  String enddate = ''; //
  // String strmlfntime = '';
  String costcenter = '';
  String userstatus = '';
  String statprof = '';
  String unit = '';
  String group = ''; //
  String type = ''; //
  String shorttext = ''; //
  String priotype = '';
  String priority = ''; //
  String createdby = '';
  String createdon = '';
  String notiftime = '';
  String date = ''; //
  String reportedby = ''; //
  String objectno = '';
  String startdate = ''; //
  String reftime = '';
  String plant = ''; //
  String breakdown = 'X'; //
  bool numberedit = false;
  bool plantgroupedit = false;
  bool notifdateedit = false;
  bool notiftypeedit = false;
  bool planplantedit = false;
  // bool mainplantedit = false;
  bool reportedbyedit = false;
  bool equipmentedit = false;
  bool startdateedit = false;
  bool enddateedit = false;
  bool priorityedit = false;
  bool shorttextedit = false;
  Dio dio = new Dio();

  FlutterLocalNotificationsPlugin localNotification;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
    var androidInitialize =
        new AndroidInitializationSettings("@drawable/splash");
    var initializationSettings =
        new InitializationSettings(android: androidInitialize);
    localNotification = new FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings,
        onSelectNotification: notificationSelected);
  }

  Future _showNotificationWithDefaultSound() async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max, priority: Priority.high);

    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await localNotification.show(
      0,
      'New Notification',
      'Notification Updated Successfully',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  Future _showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "channelId",
        "Local Notification",
        "This is the description of the Notification, you can write anything");
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails);
    await localNotification.show(0, "Notification",
        "Notification is Updated successfully", generalNotificationDetails);
  }

  Future notificationSelected(String payload) {
    Navigator.pushNamed(context, NotifListPage().id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text('⚡️Notification Details'),
      ),
      // drawer: MainDrawer(),
      body: SafeArea(
        //Lets first create the Column in which we place text field
        //Thanks for watching
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //You can see that there is no shadow
                //Now Lets add shadows
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Notification Number : ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                //Lets add first TextField
                Container(
                  // width: 250,
                  padding: EdgeInsets.only(left: 80, right: 80),
                  child: Material(
                    //elevation will add drop shadow
                    elevation: 18,

                    //This is the shadow color
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(28),
                    shadowColor: Colors.redAccent,

                    child: TextField(
                      //Letst add some docoration
                      keyboardType: TextInputType.text,
                      //onSaved: (val) => name = val,
                      onChanged: (value) {
                        number = value;
                        print(number);
                      },

                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.only(left:120),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: this.number,
                        hintText: this.number,

                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),

                        suffixIcon: IconButton(
                          icon: Icon(numberedit ? Icons.edit_off : Icons.edit),
                          onPressed: () {
                            print('edit ' + this.number);
                            setState(() {
                              numberedit = !numberedit;
                            });
                          },
                        ),
                        enabled: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Plan Plant : ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                //Lets add first TextField
                Container(
                  padding: EdgeInsets.only(left: 80, right: 80),
                  child: Material(
                    //elevation will add drop shadow
                    elevation: 18,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(28),
                    //This is the shadow color
                    shadowColor: Colors.redAccent,
                    child: TextField(
                      //Letst add some docoration
                      onChanged: (value) {
                        planplant = value;
                        print(planplant);
                      },

                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.only(left:120),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: planplant,
                        hintText: planplant,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon:
                              Icon(planplantedit ? Icons.edit_off : Icons.edit),
                          onPressed: () {
                            print('edit ' + this.planplant);
                            setState(() {
                              planplantedit = !planplantedit;
                            });
                          },
                        ),
                        enabled: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'location-acc : ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                //Lets add first TextField
                Container(
                  padding: EdgeInsets.only(left: 80, right: 80),
                  child: Material(
                    //elevation will add drop shadow
                    elevation: 18,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(28),
                    //This is the shadow color
                    shadowColor: Colors.redAccent,
                    child: TextField(
                      //Letst add some docoration

                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.only(left:120),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: locacc,
                        hintText: locacc,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        enabled: false,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Equipment ID : ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                //Lets add first TextField
                Container(
                  padding: EdgeInsets.only(left: 80, right: 80),
                  child: Material(
                    //elevation will add drop shadow
                    elevation: 18,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(28),
                    //This is the shadow color
                    shadowColor: Colors.redAccent,
                    child: TextField(
                      //Letst add some docoration
                      onChanged: (value) {
                        equipid = value;
                        //print(equipid);
                      },

                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.only(left:120),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: equipid,
                        hintText: equipid,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon:
                              Icon(equipmentedit ? Icons.edit_off : Icons.edit),
                          onPressed: () {
                            print('edit ' + this.equipid);
                            setState(() {
                              equipmentedit = !equipmentedit;
                            });
                          },
                        ),

                        enabled: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(
                //     'Company_code : ',
                //     style: TextStyle(
                //       fontSize: MediaQuery.of(context).size.height / 35,
                //       fontWeight: FontWeight.w900,
                //     ),
                //   ),
                // ),
                // //Lets add first TextField
                // Container(
                //   padding: EdgeInsets.only(left: 80, right: 80),
                //   child: Material(
                //     //elevation will add drop shadow
                //     elevation: 18,
                //     clipBehavior: Clip.antiAlias,
                //     borderRadius: BorderRadius.circular(28),
                //     //This is the shadow color
                //     shadowColor: Colors.redAccent,
                //     child: TextField(
                //       //Letst add some docoration

                //       decoration: InputDecoration(
                //         //contentPadding: EdgeInsets.only(left:120),
                //         fillColor: Colors.white,
                //         filled: true,
                //         labelText: compcode,
                //         hintText: compcode,
                //         labelStyle: TextStyle(
                //           color: Colors.black,
                //         ),
                //         enabled: false,
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'PlanGroup : ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),

                //Lets add first TextField
                Container(
                  padding: EdgeInsets.only(left: 80, right: 80),
                  child: Material(
                    //elevation will add drop shadow
                    elevation: 18,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(28),
                    //This is the shadow color
                    shadowColor: Colors.redAccent,
                    child: TextField(
                      //Letst add some docoration
                      onChanged: (value) {
                        group = value;
                        //print(equipid);
                      },
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.only(left:120),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: group,
                        hintText: group,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                              plantgroupedit ? Icons.edit_off : Icons.edit),
                          onPressed: () {
                            print('edit ' + this.group);
                            setState(() {
                              plantgroupedit = !plantgroupedit;
                            });
                          },
                        ),
                        enabled: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'NotifType : ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),

                //Lets add first TextField
                Container(
                  padding: EdgeInsets.only(left: 80, right: 80),
                  child: Material(
                    //elevation will add drop shadow
                    elevation: 18,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(28),
                    //This is the shadow color
                    shadowColor: Colors.redAccent,
                    child: TextField(
                      onChanged: (value) {
                        type = value;
                        //print(equipid);
                      },
                      //Letst add some docoration

                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.only(left:120),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: type,
                        hintText: type,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon:
                              Icon(notiftypeedit ? Icons.edit_off : Icons.edit),
                          onPressed: () {
                            print('edit ' + this.type);
                            setState(() {
                              notiftypeedit = !notiftypeedit;
                            });
                          },
                        ),
                        enabled: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Short Text : ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                //Lets add first TextField
                Container(
                  padding: EdgeInsets.only(left: 80, right: 80),
                  child: Material(
                    //elevation will add drop shadow
                    elevation: 18,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(28),
                    //This is the shadow color
                    shadowColor: Colors.redAccent,
                    child: TextField(
                      //Letst add some docoration
                      onChanged: (value) {
                        shorttext = value;
                        //print(planplant);
                      },
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.only(left:120),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: shorttext,
                        hintText: shorttext,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon:
                              Icon(shorttextedit ? Icons.edit_off : Icons.edit),
                          onPressed: () {
                            print('edit ' + this.shorttext);
                            setState(() {
                              shorttextedit = !shorttextedit;
                            });
                          },
                        ),

                        enabled: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'priortype : ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                //Lets add first TextField
                Container(
                  padding: EdgeInsets.only(left: 80, right: 80),
                  child: Material(
                    //elevation will add drop shadow
                    elevation: 18,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(28),
                    //This is the shadow color
                    shadowColor: Colors.redAccent,
                    child: TextField(
                      //Letst add some docoration

                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.only(left:120),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: priotype,
                        hintText: priotype,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        enabled: false,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Priority : ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                //Lets add first TextField
                Container(
                  padding: EdgeInsets.only(left: 80, right: 80),
                  child: Material(
                    //elevation will add drop shadow
                    elevation: 18,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(28),
                    //This is the shadow color
                    shadowColor: Colors.redAccent,
                    child: TextField(
                      //Letst add some docoration
                      onChanged: (value) {
                        priority = value;
                        //print(planplant);
                      },

                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.only(left:120),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: priority,
                        hintText: priority,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon:
                              Icon(priorityedit ? Icons.edit_off : Icons.edit),
                          onPressed: () {
                            print('edit ' + this.priority);
                            setState(() {
                              priorityedit = !priorityedit;
                            });
                          },
                        ),
                        enabled: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Created on : ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                //Lets add first TextField
                Container(
                  padding: EdgeInsets.only(left: 80, right: 80),
                  child: Material(
                    //elevation will add drop shadow
                    elevation: 18,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(28),
                    //This is the shadow color
                    shadowColor: Colors.redAccent,
                    child: TextField(
                      //Letst add some docoration

                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.only(left:120),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: createdon,
                        hintText: createdon,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        enabled: false,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Notification Date : ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                //Lets add first TextField
                Container(
                  padding: EdgeInsets.only(left: 80, right: 80),
                  child: Material(
                    //elevation will add drop shadow
                    elevation: 18,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(28),
                    //This is the shadow color
                    shadowColor: Colors.redAccent,
                    child: TextField(
                      onChanged: (value) {
                        date = value;
                        //print(equipid);
                      },
                      //Letst add some docoration

                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.only(left:120),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: date,
                        hintText: date,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon:
                              Icon(notifdateedit ? Icons.edit_off : Icons.edit),
                          onPressed: () {
                            print('edit ' + this.date);
                            setState(() {
                              notifdateedit = !notifdateedit;
                            });
                          },
                        ),
                        enabled: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Reported By : ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                //Lets add first TextField
                Container(
                  padding: EdgeInsets.only(left: 80, right: 80),
                  child: Material(
                    //elevation will add drop shadow
                    elevation: 18,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(28),
                    //This is the shadow color
                    shadowColor: Colors.redAccent,
                    child: TextField(
                      onChanged: (value) {
                        reportedby = value;
                        //print(equipid);
                      },
                      //Letst add some docoration

                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.only(left:120),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: reportedby,
                        hintText: reportedby,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                              reportedbyedit ? Icons.edit_off : Icons.edit),
                          onPressed: () {
                            print('edit ' + this.reportedby);
                            setState(() {
                              reportedbyedit = !reportedbyedit;
                            });
                          },
                        ),
                        enabled: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Start Date : ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                //Lets add first TextField
                Container(
                  padding: EdgeInsets.only(left: 80, right: 80),
                  child: Material(
                    //elevation will add drop shadow
                    elevation: 18,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(28),
                    //This is the shadow color
                    shadowColor: Colors.redAccent,
                    child: TextField(
                      //Letst add some docoration
                      onChanged: (value) {
                        startdate = value;
                        //print(startdate);
                      },
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.only(left:120),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: startdate,
                        hintText: startdate,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon:
                              Icon(startdateedit ? Icons.edit_off : Icons.edit),
                          onPressed: () {
                            print('start date edit ' + this.startdate);
                            setState(() {
                              startdateedit = !startdateedit;
                            });
                          },
                        ),
                        enabled: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'End Date : ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                //Lets add first TextField
                Container(
                  padding: EdgeInsets.only(left: 80, right: 80),
                  child: Material(
                    //elevation will add drop shadow
                    elevation: 18,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(28),
                    //This is the shadow color
                    shadowColor: Colors.redAccent,
                    child: TextField(
                      //Letst add some docoration
                      onChanged: (value) {
                        enddate = value;
                        //print(enddate);
                      },
                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.only(left:120),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: enddate,
                        hintText: enddate,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(enddateedit ? Icons.edit_off : Icons.edit),
                          onPressed: () {
                            print('edit ' + this.enddate);
                            setState(() {
                              enddateedit = !enddateedit;
                            });
                          },
                        ),

                        enabled: true,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Object No : ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                //Lets add first TextField
                Container(
                  padding: EdgeInsets.only(left: 80, right: 80),
                  child: Material(
                    //elevation will add drop shadow
                    elevation: 18,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(28),
                    //This is the shadow color
                    shadowColor: Colors.redAccent,
                    child: TextField(
                      //Letst add some docoration

                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.only(left:120),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: objectno,
                        hintText: objectno,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        enabled: false,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(
                //     'Notification time : ',
                //     style: TextStyle(
                //       fontSize: MediaQuery.of(context).size.height / 35,
                //       fontWeight: FontWeight.w900,
                //     ),
                //   ),
                // ),
                // //Lets add first TextField
                // Container(
                //   padding: EdgeInsets.only(left: 80, right: 80),
                //   child: Material(
                //     //elevation will add drop shadow
                //     elevation: 18,
                //     clipBehavior: Clip.antiAlias,
                //     borderRadius: BorderRadius.circular(28),
                //     //This is the shadow color
                //     shadowColor: Colors.redAccent,
                //     child: TextField(
                //       //Letst add some docoration

                //       decoration: InputDecoration(
                //         //contentPadding: EdgeInsets.only(left:120),
                //         fillColor: Colors.white,
                //         filled: true,
                //         labelText: notiftime,
                //         hintText: notiftime,
                //         labelStyle: TextStyle(
                //           color: Colors.black,
                //         ),
                //         enabled: false,
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 20,
                // ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Cost Center : ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                //Lets add first TextField
                Container(
                  padding: EdgeInsets.only(left: 80, right: 80),
                  child: Material(
                    //elevation will add drop shadow
                    elevation: 18,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(28),
                    //This is the shadow color
                    shadowColor: Colors.redAccent,
                    child: TextField(
                      //   onChanged: (value) {
                      //     plant = value;
                      //     //print(equipid);
                      //   },
                      //Letst add some docoration

                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.only(left:120),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: costcenter,
                        hintText: costcenter,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        // suffixIcon: IconButton(
                        //   icon:
                        //       Icon(mainplantedit ? Icons.edit_off : Icons.edit),
                        //   onPressed: () {
                        //     print('edit ' + this.plant);
                        //     setState(() {
                        //       mainplantedit = !mainplantedit;
                        //     });
                        //   },
                        // ),
                        enabled: false,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),

                Center(
                  child: Container(
                    height: 1.4 * (MediaQuery.of(context).size.height / 20),
                    width: 10 * (MediaQuery.of(context).size.width / 10),
                    margin: EdgeInsets.only(bottom: 20),
                    child: RaisedButton(
                      elevation: 5.0,
                      color: Colors.red,
                      // shape: RoundedRectangleBorder(
                      // borderRadius: BorderRadius.circular(30.0),
                      //),
                      onPressed: () async {
                        print("updated");
                        print(breakdown);
                        notifino = this.number;
                        print(notifino);
                        Future postData1() async {
                          final String pathUrl =
                              'http://192.168.157.36:8000/maintenance/notifiupdate';
                          dynamic data = {
                            "breakdown": breakdown,
                            "equipid": equipid,
                            "notifino": notifino,
                            "group": group,
                            "plant": plant,
                            "planplant": planplant,
                            "priority": priority,
                            "reportedby": reportedby,
                            "shorttext": shorttext,
                            "startdate": startdate,
                            "enddate": enddate,
                            "type": type,
                            "date": date
                          };
                          var response = await dio.post(pathUrl,
                              data: data,
                              options: Options(headers: {
                                "Content-Type": "application/json",
                              }));
                          return response.data;
                        }

                        print('posting data');
                        await postData1().then((value) {
                          print("response");
                          //value=json.decode(value);
                          print("notifino");

                          print(value);
                          final snackBar = SnackBar(
                            content: Text(
                              'Notification ' +
                                  notifino +
                                  ' is Updated Successfully',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 5),
                            shape: StadiumBorder(),
                            //margin: EdgeInsets.symmetric(vertical: 16, horizontal: 56),
                            margin: EdgeInsets.only(
                              bottom: 40,
                              left: 32,
                              right: 32,
                            ),
                            behavior: SnackBarBehavior.floating,
                            elevation: 0,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });

                        // _showNotification();
                        print("edited values");
                        print(number);
                        print(equipid);
                        print(planplant);
                        print(shorttext);
                        print(priority);
                        print(startdate);
                        print(enddate);

                        _showNotificationWithDefaultSound();
                      },

                      child: Text(
                        "Update",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: MediaQuery.of(context).size.height / 40,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void fetchdata() async {
    print("fetching" + this.number);
    Future postData() async {
      final String pathUrl = 'http://192.168.157.36:3000/mp/notdisplay';
      dynamic data = {'notification_no': this.number};
      var response = await dio.post(pathUrl,
          data: data,
          options: Options(headers: {
            "Content-Type": "application/json",
          }));
      return response.data;
    }

    print('posting data');
    await postData().then((value) {
      print("response");
      print(value);
      // print("notification display : " + value["notif_display"]);
      value = json.decode(value);
      print(value);
      print("notifino");
      setState(() {
        number = value["notifino"];
        planplant = value["planplant"];
        plant = value["mainplant"];
        locacc = value["locacc"];
        equipid = value["equipid"];
        breakdown = value["breakdown"];
        group = value["group"];
        type = value["type"];
        shorttext = value["shorttext"];
        priotype = value["priotype"];
        priority = value["priority"];
        createdon = value["createdon"];
        date = value["notifidate"];
        reportedby = value["reportedby"];
        startdate = value["startdate"];
        enddate = value["enddate"];
        objectno = value["objectno"];
        costcenter = value["costcenter"];
        notiftime = value["notiftime"];
      });
      print(value["notifino"]);
      print(value["planplant"]);
    });
  }
}
