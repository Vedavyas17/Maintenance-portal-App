import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_app_1/notlist.dart';
// import 'package:maintainence/screens/notif_display.dart';
// import 'package:maintainence/screens/display_notif.dart';

class NotifCreate extends StatefulWidget {
  String id = "notifcreate";

  @override
  _NotifCreateState createState() => _NotifCreateState();
}

class _NotifCreateState extends State<NotifCreate> {
  final String title = 'notificationcreate';
  FlutterLocalNotificationsPlugin localNotification;
  String down;
  String equip;
  String group;
  String notif_date;
  String planplant;
  String notif_type;
  String plant;
  String priority;
  String reportedby;
  String text;
  String start_date;
  String end_date;
  // String planplant;
  Dio dio = new Dio();
  Future postData() async {
    final String pathUrl = 'http://192.168.157.36:8000/mp/notifcreate01';
    dynamic data = {
      "down": down,
      "equip": equip,
      "notif_date": notif_date,
      "notif_type": notif_type,
      "group": group,
      "planplant": planplant,
      "plant": plant,
      "priority": priority,
      "reportedby": reportedby,
      "end_date": end_date,
      "start_date": start_date,
      "text": text
    };
    var response = await dio.post(pathUrl,
        data: data,
        options: Options(headers: {
          "Content-Type": "application/json",
        }));
    return response.data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var androidInitialize = new AndroidInitializationSettings('splash');
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
      'Notification Created Successfully',
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
        "Notification is created successfully", generalNotificationDetails);
  }

  Future notificationSelected(String payload) {
    Navigator.pushNamed(context, '/notifpage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
                //Implement logout functionality
              }),
        ],
        title: Text('⚡️Notification Display'),
      ),
      //  drawer: MainDrawer(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Material(
          elevation: 28,
          //This is the shadow color
          shadowColor: Colors.redAccent,

          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(28),

          child: Form(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  AppBar(
                    leading: Icon(Icons.notifications),
                    elevation: 0,
                    title: Text('Create Notification'),
                    backgroundColor: Colors.redAccent,
                    centerTitle: true,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Material(
                      //elevation will add drop shadow
                      elevation: 18,
                      //This is the shadow color
                      shadowColor: Colors.purple,
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(8),
                      child: TextField(
                        //Letst add some docoration
                        onChanged: (value) {
                          equip = value;
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Equipment ID',
                          hintText: 'PUMP2',
                          //icon: Icon(Icons.person),
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: Material(
                      //elevation will add drop shadow
                      elevation: 18,
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(8),
                      //This is the shadow color
                      shadowColor: Colors.purple,
                      child: TextField(
                        //Letst add some docoration
                        keyboardType: TextInputType.text,
                        //onSaved: (val) => name = val,
                        onChanged: (value) {
                          down = value;
                          //print(name);
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Breakdown',
                          hintText: 'X',
                          //icon: Icon(Icons.person),
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: Material(
                      //elevation will add drop shadow
                      elevation: 18,
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(8),
                      //This is the shadow color
                      shadowColor: Colors.purple,
                      child: TextField(
                        //Letst add some docoration
                        keyboardType: TextInputType.text,
                        //onSaved: (val) => name = val,
                        onChanged: (value) {
                          notif_date = value;
                          //print(name);
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: ' Notification Date',
                          hintText: 'Enter date',
                          //icon: Icon(Icons.person),
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: Material(
                      //elevation will add drop shadow
                      elevation: 18,
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(8),
                      //This is the shadow color
                      shadowColor: Colors.purple,
                      child: TextField(
                        //Letst add some docoration
                        keyboardType: TextInputType.text,
                        //onSaved: (val) => name = val,
                        onChanged: (value) {
                          notif_type = value;
                          //print(name);
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: ' Notification Type',
                          hintText: 'Enter type',
                          //icon: Icon(Icons.person),
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: Material(
                      //elevation will add drop shadow
                      elevation: 18,
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(8),
                      //This is the shadow color
                      shadowColor: Colors.purple,
                      child: TextField(
                        //Letst add some docoration
                        keyboardType: TextInputType.text,
                        //onSaved: (val) => name = val,
                        onChanged: (value) {
                          group = value;
                          //print(name);
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: ' Plant group',
                          hintText: 'Enter group',
                          //icon: Icon(Icons.person),
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: Material(
                      //elevation will add drop shadow
                      elevation: 18,
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(8),
                      //This is the shadow color
                      shadowColor: Colors.purple,
                      child: TextField(
                        //Letst add some docoration
                        keyboardType: TextInputType.text,
                        //onSaved: (val) => name = val,
                        onChanged: (value) {
                          planplant = value;
                          //print(name);
                        },

                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Plant',
                          hintText: 'Enter plant',

                          //icon: Icon(Icons.person),
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: Material(
                      //elevation will add drop shadow
                      elevation: 18,
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(8),
                      //This is the shadow color
                      shadowColor: Colors.purple,
                      child: TextField(
                        //Letst add some docoration
                        keyboardType: TextInputType.text,
                        //onSaved: (val) => name = val,
                        onChanged: (value) {
                          plant = value;
                          //print(name);
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: ' Main Plant',
                          hintText: 'Enter plant',
                          //icon: Icon(Icons.person),
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: Material(
                      //elevation will add drop shadow
                      elevation: 18,
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(8),
                      //This is the shadow color
                      shadowColor: Colors.purple,
                      child: TextField(
                        //Letst add some docoration
                        keyboardType: TextInputType.text,
                        //onSaved: (val) => name = val,
                        onChanged: (value) {
                          priority = value;
                          //print(name);
                        },

                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Priority',
                          hintText: 'Enter priority',

                          //icon: Icon(Icons.person),
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: Material(
                      //elevation will add drop shadow
                      elevation: 18,
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(8),
                      //This is the shadow color
                      shadowColor: Colors.purple,
                      child: TextField(
                        //Letst add some docoration
                        keyboardType: TextInputType.text,
                        //onSaved: (val) => name = val,
                        onChanged: (value) {
                          reportedby = value;
                          //print(name);
                        },

                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Reported By',
                          hintText: '',

                          //icon: Icon(Icons.person),
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: Material(
                      //elevation will add drop shadow
                      elevation: 18,
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(8),
                      //This is the shadow color
                      shadowColor: Colors.purple,
                      child: TextField(
                        //Letst add some docoration
                        keyboardType: TextInputType.text,
                        //onSaved: (val) => name = val,
                        onChanged: (value) {
                          start_date = value;
                          //print(name);
                        },

                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Start Date',
                          hintText: 'Enter start date',
                          //icon: Icon(Icons.person),
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: Material(
                      //elevation will add drop shadow
                      elevation: 18,
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(8),
                      //This is the shadow color
                      shadowColor: Colors.purple,
                      child: TextField(
                        //Letst add some docoration
                        keyboardType: TextInputType.text,
                        //onSaved: (val) => name = val,
                        onChanged: (value) {
                          end_date = value;
                          //print(name);
                        },

                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'End Date',
                          hintText: 'Enter end date',
                          //icon: Icon(Icons.person),
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: Material(
                      //elevation will add drop shadow
                      elevation: 18,
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(8),
                      //This is the shadow color
                      shadowColor: Colors.purple,
                      child: TextField(
                        //Letst add some docoration
                        keyboardType: TextInputType.text,
                        //onSaved: (val) => name = val,
                        onChanged: (value) {
                          text = value;
                          //print(name);
                        },

                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Short Text',
                          hintText: 'Enter Short Text',

                          //icon: Icon(Icons.person),
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 1.4 * (MediaQuery.of(context).size.height / 20),
                    width: 5 * (MediaQuery.of(context).size.width / 10),
                    margin: EdgeInsets.only(bottom: 20),
                    child: RaisedButton(
                      elevation: 5.0,
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: () async {
                        print('posting data');
                        print('breakdown:' + down);
                        print("equipid:" + equip);
                        print("type:" + notif_type);
                        print("group:" + group);
                        print("date:" + notif_date);
                        print("plant:" + plant);
                        print("priority:" + priority);
                        print("reportedby:" + reportedby);
                        print("startdate:" + start_date);
                        // print("starttime:" + reqstarttime);
                        print("endate:" + end_date);
                        // print("endtime" + reqendtime);
                        print("shorttext:" + text);
                        print("plan plant:" + planplant);

                        print('posting data');

                        await postData().then((value) {
                          print("response NOTIFICATION NUMBER");
                          print(value);

                          final snackBar = SnackBar(
                            content: Text(
                              'Notification is Created and Notification Number: ' +
                                  value,
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
                          //_showNotification();
                          _showNotificationWithDefaultSound();
                          //final snackBar = SnackBar(content: Text('Invalid user id and password'));
                          //ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      },
                      child: Text(
                        "Create",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: MediaQuery.of(context).size.height / 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
