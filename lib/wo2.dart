import 'package:flutter/material.dart';
import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class wocreated extends StatefulWidget {
  // const wocreated({Key? key}) : super(key: key);
  var desc = "";
  var duration = "";
  // var funcloc = "";
  var equip_num = "";
  var notif_no = "";
  var order_type = "";
  // var plangroup = "";
  var pers = "";
  var qty = "";
  var text = "";
  var act = "";
  // var reqendtime = "";
  // var reqstartdate = "";
  // var reqstarttime = "";
  // var shorttext = "";

  wocreated(this.desc,this.duration,this.equip_num,this.order_type,this.notif_no,this.pers,this.qty,
      this.text,this.act);

  @override
  _wocreatedState createState() => _wocreatedState(this.desc,this.duration,this.equip_num,this.notif_no,this.order_type,this.pers,this.qty,
      this.text,this.act);
}

class _wocreatedState extends State<wocreated> {
  var desc = "";
  var duration = "";
  // var funcloc = "";
  var equip_num = "";
  var notif_no = "";
  var order_type = "";
  // var plangroup = "";
  var pers = "";
  var qty = "";
  var text = "";
  var act = "";

  _wocreatedState(this.desc,this.duration,this.equip_num,this.notif_no,this.order_type,this.pers,this.qty,
      this.text,this.act);
  @override
  void initState(){
    super.initState();
    newwocreatuibcall();
  }
  Widget build(BuildContext context) {
    return Container();
  }

  void newwocreatuibcall() async {
    print("this is node call");
    print(notif_no);
    final response = await http.post(
        Uri.parse('http://192.168.21.36:8000/mp/wocreate'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        // body: data
        body: jsonEncode(<String, String>{
          "desc":desc,
          "duration":duration,
          "equip_num":equip_num,
          "notif_no":notif_no,
          "order_type":order_type,
          "pers":pers,
          "qty":qty,
          "text":text,
          "act":act


        }));




    // var data = jsonDecode(response.body);

    setState(() {
      var data = jsonDecode(response.body);print("VYAS");

      print(data);
      // notnumnew = (data["HEADER"]["NOTIF_NO"]["_text"]);
      // print(data["HEADER"]["NOTIF_NO"]["_text"]);

    });
  }}
