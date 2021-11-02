import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_app_1/workorder.dart';

// import 'package:maintainence/screens/wo_display.dart';

class WoCreate extends StatefulWidget {
  String id = 'wocreate';
  // const WoCreate({ Key? key }) : super(key: key);

  @override
  _WoCreateState createState() => _WoCreateState();
}

class _WoCreateState extends State<WoCreate> {
  final String title = 'workordercreate';
  FlutterLocalNotificationsPlugin localNotification;

  String desc = '';
  String duration = '';
  String equip = '';
  String notif_type = '';
  String order_type = '';
  String text = '';
  String act = '';

  Dio dio = new Dio();
  Future postData() async {
    final String pathUrl = 'http://192.168.157.36:8000/mp/wocreate01';
    dynamic data = {
      "desc": desc,
      "duration": duration,
      "equip": equip,
      "notif_type": notif_type,
      "order_type": order_type,
      "text": text,
      "act": act
    };

    var response = await dio.post(pathUrl,
        data: data,
        options: Options(headers: {
          "Content-Type": "application/json",
        }));
    return response.data;
    print(response.data);
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
      'Work Order is Created Successfully',
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
        "Workorder is created successfully", generalNotificationDetails);
  }

  Future notificationSelected(String payload) {
    Navigator.pushNamed(context, '/wopage');
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
        title: Text('⚡️Workorder Creation'),
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
                    title: Text('Create WorkOrder'),
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
                          hintText: 'AA000007',
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
                          order_type = value;
                          //print(name);
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Order Type',
                          hintText: 'PM01',
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
                          desc = value;
                          //print(name);
                        },
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Description',
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
                          notif_type = value;
                          //print(name);
                        },

                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Notification Type',
                          hintText: '1',

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
                          duration = value;
                          //print(name);
                        },

                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Duration Normal',
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
                          text = value;
                          //print(name);
                        },

                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Short Text',
                          hintText: '',

                          //icon: Icon(Icons.person),
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 10, bottom: 24),
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
                          act = value;
                          //print(name);
                        },

                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Work Activity',
                          hintText: '',

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
                        print('notification type:' + notif_type);
                        print("equipid:" + equip);
                        print("ordertype:" + order_type);
                        print("descrition:" + text);
                        print("workactivity:" + act);
                        print("duration normal:" + duration);

                        print("Description:" + desc);

                        print('posting data');

                        await postData().then((value) {
                          print("response NOTIFICATION NUMBER");
                          print(value);

                          final snackBar = SnackBar(
                            content: Text(
                              'Workorder is Created and Notification Number: ' +
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
                        // _showNotificationWithDefaultSound();
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
