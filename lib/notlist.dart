import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/model/notlistmodel.dart';
import 'package:flutter_app_1/notifdisplay.dart';
import 'package:flutter_app_1/services/notlistservice.dart';

const kBackgroundColor = Color(0xFFF8F8F8);

class NotifListPage extends StatefulWidget {
  String id = 'notiflistpage';
  // const NotifListPage({Key? key}) : super(key: key);

  @override
  _NotifListPageState createState() => _NotifListPageState();
}

class _NotifListPageState extends State<NotifListPage> {
  List not_list = <NotifListDetails>[
    // WorkOrderListDetails(
    //     orderid: '', workcenter: '', startdate: '', enddate: '')
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder<String>(
        future: notiflist.getNotification("2021-07-20", "SA02", "010"),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            not_list = <NotifListDetails>[
              NotifListDetails(
                  notification_no: '',
                  equipment: '',
                  notifdate: '',
                  notiftime: '')
            ];
            Map data = jsonDecode(snapshot.data);
            List temp_not_list = data['notif_list'];
            for (int i = 0; i < temp_not_list.length; i++) {
              not_list.add(NotifListDetails(
                  notification_no: temp_not_list[i]['NOTIFICAT'][0],
                  equipment: temp_not_list[i]['DESCRIPT'][0],
                  notifdate: temp_not_list[i]['NOTIFDATE'][0],
                  notiftime: temp_not_list[i]['NOTIFTIME'][0]));
            }
            not_list.removeAt(0);
            print(data);
            // print(snapshot.data);
          }
          return Scaffold(
            appBar: AppBar(
              title: Text("Notifications List"),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kBackgroundColor)),
                    // Within the `FirstScreen` widget
                    onPressed: () {
                      // Navigate to the second screen using a named route.
                      Navigator.pushNamed(context, '/notcreatepage');
                    },
                    child: Text(
                      'ADD',
                      style: TextStyle(
                          color: Color(0xffFF3B5F),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            body: ListView.builder(
              itemCount: not_list.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Image.asset('assets/images/pm2.png')),
                    title: Text(not_list[index].notification_no +
                        " - " +
                        not_list[index].equipment),
                    subtitle: Text(not_list[index].notifdate +
                        " at " +
                        not_list[index].notiftime),
                    trailing: ElevatedButton(
                      // Within the `FirstScreen` widget
                      onPressed: () {
                        // Navigate to the second screen using a named route.
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NotifDisplay(
                                number: not_list[index].notification_no)));
                        // Navigator.pushNamed(context, '/notifdisplay',
                        //     arguments: {
                        //       'notification_no': not_list[index].notification_no
                        //     });
                      },
                      child: Text('VIEW'),
                    ),
                  ),
                );
              },
            ),
          );

          //       return Scaffold(
          //         appBar: AppBar(
          //           elevation: 0,
          //           brightness: Brightness.light,
          //           backgroundColor: kBlueLightColor,
          //           leading: IconButton(
          //             onPressed: () {
          //               Navigator.pop(context);
          //             },
          //             icon: Icon(
          //               Icons.arrow_back_ios,
          //               size: 20,
          //               color: Colors.white,
          //             ),
          //           ),
          //         ),
          //         body: Stack(
          //           children: <Widget>[
          //             Container(
          //               height: size.height * .45,
          //               decoration: BoxDecoration(
          //                 color: kBlueLightColor,
          //                 image: DecorationImage(
          //                   image: AssetImage("assets/images/example-1.png"),
          //                   fit: BoxFit.fitWidth,
          //                 ),
          //               ),
          //             ),
          //             SafeArea(
          //                 child: Padding(
          //                   padding: const EdgeInsets.symmetric(horizontal: 20),
          //                   child: SingleChildScrollView(
          //                     child: Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: <Widget>[
          //                         // SizedBox(
          //                         //   height: size.height * 0.05,
          //                         // ),
          //                         Text(
          //                           "WorkOrder",
          //                           style: Theme.of(context)
          //                               .textTheme
          //                               .headline4
          //                               .copyWith(fontWeight: FontWeight.w900),
          //                         ),
          //                         SizedBox(height: 10),
          //                         Text(
          //                           "Create and Change Work Order",
          //                           style: TextStyle(fontWeight: FontWeight.bold),
          //                         ),
          //                         SizedBox(height: 10),
          //                         SizedBox(
          //                           width: size.width * .6, // it just take 60% of total width
          //                           child: Text(
          //                             "A customer uses a work order to contract a supplier to produce a particular quantity of a product and to deliver that quantity by a particular date/time or by various dates/times to the customer.",
          //                           ),
          //                         ),
          //  ListView.builder(
          // itemCount: wo_list.length,
          // itemBuilder: (context, index) {
          // return Card(
          // child: ListTile(
          // leading: Padding(padding: EdgeInsets.all(7.0),
          // child: Image.asset('assets/hammer.png')),
          // title: Text(
          // wo_list[index].orderid + " - " + wo_list[index].workcenter
          // ),
          // subtitle: Text(wo_list[index].startdate + " to " +
          // wo_list[index].enddate),
          // trailing: Icon(Icons.remove_red_eye,
          // color: Color.fromRGBO(41, 42, 62, 1.0),),
          // onTap: () {
          // Navigator.pushNamed(context, '/workorderDetails',arguments:
          // {
          // 'orderid':wo_list[index].orderid
          // });
          // },
          // ),
          // );
          // },)
          //                       ],
          //                     ),
          //                   ),
          //                 ))
          //           ],
          //         ),
          //       );
        });
  }
}
