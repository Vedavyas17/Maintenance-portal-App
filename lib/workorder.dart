import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_1/model/wolistmodel.dart';
import 'package:flutter_app_1/services/wolist.dart';
// import 'package:http/http.dart' as http;
import 'package:flutter_app_1/wodisp.dart';

const kBackgroundColor = Color(0xFFF8F8F8);
const kActiveIconColor = Color(0xFFE68342);
const kTextColor = Color(0xFF222B45);
const kBlueLightColor = Color(0xFFC7B8F5);
const kBlueColor = Color(0xFF817DC0);
const kShadowColor = Color(0xFFE6E6E6);

class WorkOrder extends StatefulWidget {
  String id = 'workorder';
  // const WorkOrder({Key? key}) : super(key: key);

  @override
  _WorkOrderState createState() => _WorkOrderState();
}

class _WorkOrderState extends State<WorkOrder> {
  List wo_list = <WorkOrderListDetails>[
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
        future: wolist.getWorkOrder("SA02"),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            wo_list = <WorkOrderListDetails>[
              WorkOrderListDetails(
                  orderid: '1', workcenter: '', startdate: '', enddate: '')
            ];
            Map data = jsonDecode(snapshot.data);
            List temp_wo_list = data['worder_info'];
            for (int i = 0; i < temp_wo_list.length; i++) {
              wo_list.add(WorkOrderListDetails(
                  orderid: temp_wo_list[i]['ORDERID'][0],
                  workcenter: temp_wo_list[i]['WORK_CNTR'][0],
                  startdate: temp_wo_list[i]['EARL_SCHED_START_DATE'][0],
                  enddate: temp_wo_list[i]['LATE_SCHED_FIN_DATE'][0]));
            }
            wo_list.removeAt(0);
            print(data);
            // print(snapshot.data);
          }
          return Scaffold(
            appBar: AppBar(
              title: Text("WorkOrder List"),
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
                      Navigator.pushNamed(context, '/wocreatepage');
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
              itemCount: wo_list.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Image.asset('assets/images/pm1.png')),
                    title: Text(wo_list[index].orderid +
                        " - " +
                        wo_list[index].workcenter),
                    subtitle: Text(wo_list[index].startdate +
                        " to " +
                        wo_list[index].enddate),
                    trailing: ElevatedButton(
                      // Within the `FirstScreen` widget
                      onPressed: () {
                        // Navigate to the second screen using a named route.
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Workorderdisplay(
                                number: wo_list[index].orderid)));
                        // Navigator.pushNamed(context, '/wodisplaypage',
                        //     arguments: {'orderid': wo_list[index].orderid});
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
  // display(String number)async{
  //   print(number);
  //   final response = await http.post(Uri.parse('http://192.168.21.36:3000/mp/wodetails'),
  //       body: {'orderid':number});
  //   setState(() {
  //     Map data = jsonDecode(response.body);
  //     // print(data);
  //   // Navigator.pushReplacementNamed(context, '/wodetails', arguments: data);
  //   });
  // }
}
