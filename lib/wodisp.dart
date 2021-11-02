import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ffi';
import 'package:flutter_app_1/workorder.dart';
import 'package:dio/dio.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Workorderdisplay extends StatefulWidget {
  String id = 'workorderdisplay';
  String number;
  Workorderdisplay({this.number});
  @override
  _WorkorderdisplayState createState() => _WorkorderdisplayState(number);
}

class _WorkorderdisplayState extends State<Workorderdisplay> {
  final String title = 'workorderdisplay';

  String number = '';
  _WorkorderdisplayState(this.number);

  String orderid = '';
  String ordertype = '';
  String planplant = '';
  String notifitype = '';
  String plangroup = '';
  String funcloc = '';
  String equipid = '';
  String schedtype = '';
  String priority = '';
  String mrprelevant = '';
  String currency = '';
  String objectno = '';
  String startdate = '';
  String enddate = '';
  String routingno = '';
  String shorttext = '';
  String costcenter = '';
  String priotype = '';
  String description = '';
  String numberofcapacities = '';
  String durationnormal = '';
  String workactivity = '';
  String activity = '';
  bool numberedit = false;
  bool ordertypeedit = false;
  bool equipmentedit = false;
  bool descriptionedit = false;
  bool durationnormaledit = false;
  bool notifitypeedit = false;
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
      'WorkOrder is Updated Successfully',
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
        "WorkOrder is Updated successfully", generalNotificationDetails);
  }

  Future notificationSelected(String payload) {
    Navigator.pushNamed(context, WorkOrder().id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text('⚡️Workorder Details'),
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
                    'WorkOrder Number : ',
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
                    'Order Type: ',
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
                        ordertype = value;
                        //print(planplant);
                      },

                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.only(left:120),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: ordertype,
                        hintText: ordertype,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon:
                              Icon(ordertypeedit ? Icons.edit_off : Icons.edit),
                          onPressed: () {
                            print('edit ' + this.ordertype);
                            setState(() {
                              ordertypeedit = !ordertypeedit;
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
                    'Equipment ID: ',
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
                        //print(planplant);
                      },

                      decoration: InputDecoration(
                        // contentPadding: EdgeInsets.only(left:120),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Description : ',
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
                        description = value;
                        //print(equipid);
                      },

                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.only(left:120),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: description,
                        hintText: description,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                              descriptionedit ? Icons.edit_off : Icons.edit),
                          onPressed: () {
                            print('edit ' + this.description);
                            setState(() {
                              descriptionedit = !descriptionedit;
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
                    'Duration Normal : ',
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
                        durationnormal = value;
                        //print(planplant);
                      },

                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.only(left:120),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: durationnormal,
                        hintText: durationnormal,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                              durationnormaledit ? Icons.edit_off : Icons.edit),
                          onPressed: () {
                            print('edit ' + this.durationnormal);
                            setState(() {
                              durationnormaledit = !durationnormaledit;
                            });
                          },
                        ),
                        enabled: true,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Notification Type : ',
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
                      onChanged: (value) {
                        notifitype = value;
                        //print(planplant);
                      },

                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.only(left:120),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: notifitype,
                        hintText: notifitype,
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                              notifitypeedit ? Icons.edit_off : Icons.edit),
                          onPressed: () {
                            print('edit ' + this.notifitype);
                            setState(() {
                              notifitypeedit = !notifitypeedit;
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
                        //print(planplant);
                      },
                      decoration: InputDecoration(
                          //contentPadding: EdgeInsets.only(left:120),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: planplant,
                          hintText: planplant,
                          labelStyle: TextStyle(
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Plan Group : ',
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
                        labelText: plangroup,
                        hintText: plangroup,
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
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Start Date: ',
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
                        labelText: startdate,
                        hintText: startdate,
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

                      decoration: InputDecoration(
                        //contentPadding: EdgeInsets.only(left:120),
                        fillColor: Colors.white,
                        filled: true,
                        labelText: enddate,
                        hintText: enddate,
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
                //     'Work Activity: ',
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
                //         // contentPadding: EdgeInsets.only(left:120),
                //         fillColor: Colors.white,
                //         filled: true,
                //         labelText: workactivity,
                //         hintText: workactivity,
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
                    'Currency : ',
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
                          labelText: currency,
                          hintText: currency,
                          labelStyle: TextStyle(
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Object NO : ',
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
                          labelText: objectno,
                          hintText: objectno,
                          labelStyle: TextStyle(
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text('Quantity : ',style: TextStyle(
                //         fontSize: MediaQuery.of(context).size.height / 35,
                // fontWeight: FontWeight.w900,
                //       ),),
                // ),
                // //Lets add first TextField
                // Container(
                //   padding: EdgeInsets.only(left:80,right: 80),
                //   child: Material(
                //     //elevation will add drop shadow
                //     elevation: 18,
                //     clipBehavior: Clip.antiAlias,
                //   borderRadius: BorderRadius.circular(28),
                //     //This is the shadow color
                //     shadowColor: Colors.redAccent,
                //     child: TextField(
                //       //Letst add some docoration

                //       decoration: InputDecoration(
                //         //contentPadding: EdgeInsets.only(left:120),
                //         fillColor: Colors.white,
                //         filled: true,
                //         labelText: quantity,
                //         hintText: quantity,
                //         labelStyle: TextStyle(
                //           color: Colors.black,

                //         ),
                //         enabled: false,
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Cost Center: ',
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
                        labelText: costcenter,
                        hintText: costcenter,
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
                //     'Number of Capacities : ',
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
                //         // contentPadding: EdgeInsets.only(left:120),
                //         fillColor: Colors.white,
                //         filled: true,
                //         labelText: numberofcapacities,
                //         hintText: numberofcapacities,
                //         labelStyle: TextStyle(
                //           color: Colors.black,
                //         ),
                //         enabled: false,
                //       ),
                //     ),
                //   ),
                // ),
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
                        print(shorttext);
                        orderid = this.number;
                        Future postData1() async {
                          final String pathUrl =
                              'http://192.168.157.36:8000/mp/woedit';
                          print('workorder id:' + this.number);
                          print('ordertype :' + this.ordertype);
                          print('notifitype:' + this.notifitype);
                          notifitype = notifitype[notifitype.length - 1];
                          print(notifitype);
                          print('description :' + this.description);
                          print('shorttext :' + this.shorttext);
                          print('duration normal:' + this.durationnormal);
                          dynamic data = {
                            "woid": number,
                            "type": ordertype,
                            "equip": equipid,
                            "notif_type": notifitype,
                            "desc": description,
                            "text": shorttext,
                            "nrml": durationnormal
                            // "workorderid":this.number,
                            // "ordertype":ordertype,
                            // "equipid":equipid,
                            // "notifitype":notifitype,
                            // "description":description,
                            // "shorttext":shorttext,
                            // "durationnormal":durationnormal
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
                          print("orderid");
                          print(value);

                          final snackBar = SnackBar(
                            content: Text(
                              'Workorder ' + value + ' is Updated Successfully',
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
                          // _showNotification();
                          print("edited values");
                          print(number);
                          print(ordertype);
                          print(equipid);
                          print(shorttext);
                          print(description);
                          print(notifitype);
                          print(durationnormal);
                          //print(enddate);

                          _showNotificationWithDefaultSound();
                        });
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
    Future postData() async {
      final String pathUrl = 'http://192.168.157.36:3000/mp/wodetails';
      dynamic data = {'orderid': this.number};
      var response = await dio.post(pathUrl,
          data: data,
          options: Options(headers: {
            "Content-Type": "application/json",
          }));
      return response.data;
    }

    print('posting data');
    print(this.number);
    await postData().then((value) {
      print("response");
      print(value);

      value = json.decode(value);
      print(value);
      print("ORDERID");
      setState(() {
        number = value["orderid"];
        ordertype = value["ordertype"];
        equipid = value["equipid"];
        description = value["description"];
        planplant = value["planplant"];
        notifitype = value["notifitype"];
        plangroup = value["plangroup"];
        funcloc = value["funcloc"];
        costcenter = value["costcenter"];
        startdate = value["startdate"];
        // quantity=value["QUANTITY"];
        durationnormal = value["durationnormal"];
        workactivity = value["workactivity"];
        shorttext = value["shorttext"];
        priority = value["priority"];
        priotype = value["priotype"];
        activity = value["activity"];
        enddate = value["enddate"];
        schedtype = value["schedtype"];
        numberofcapacities = value["numberofcapacities"];
        currency = value["currency"];
        //   planplant=value["planplant"];
        //   locacc=value["locacc"];
        //   equipid=value["equipid"];
        //   breakdown=value["breakdown"];
        //   group=value["group"];
        //   type=value["type"];
        //   shorttext=value["shorttext"];
        //   priotype=value["priotype"];
        //   priority=value["priority"];
        //   createdon=value["createdon"];
        //   notifidate=value["notifidate"];
        //   reportedby=value["reportedby"];
        //   startdate=value["startdate"];
        //   enddate=value["enddate"];
        objectno = value["objectno"];
        //   lang=value["lang"];
        //   costcenter=value["costcenter"];
      });
      print(value["orderid"]);
      // print(value["planplant"]);
    });
  }
}
