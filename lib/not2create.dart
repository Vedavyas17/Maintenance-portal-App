import 'package:flutter/material.dart';
import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class notcreated extends StatefulWidget {
  // const notcreated({Key? key}) : super(key: key);
  var breakdown = "";//
  var equiid = "";//
  // var funcloc = "";
  var notiftype = "";//
  var partfunc = "";
  var partner = "";
  // var plangroup = "";
  var planplant = "";//
  var priority = "";//
  var reportedby = "";//
  var reqenddate = "";//
  var reqendtime = "";
  var reqstartdate = "";//
  var reqstarttime = "";
  var shorttext = "";//

  notcreated(this.breakdown,this.equiid,this.notiftype,this.planplant,this.priority,this.reqenddate,this.reqendtime,
      this.reqstartdate,this.reqstarttime,this.shorttext);

  @override
  _notcreatedState createState() => _notcreatedState(this.breakdown,this.equiid,this.notiftype,this.planplant,this.priority,this.reqenddate,this.reqendtime,
      this.reqstartdate,this.reqstarttime,this.shorttext);
}

class _notcreatedState extends State<notcreated> {
  var breakdowncc = "";
  var equiidcc = "";
  // var funcloccc= "";
  var notiftypecc = "";
  // var partfunccc = "";
  // var partnercc = "";
  // var plangroupcc = "";
  var planplantcc = "";
  var prioritycc = "";
  // var reportedbycc = "";
  var reqenddatecc = "";
  var reqendtimecc = "";
  var reqstartdatecc = "";
  var reqstarttimecc = "";
  var shorttextcc = "";
  // var notnumnew="";

  _notcreatedState(this.equiidcc,this.breakdowncc,this.notiftypecc,this.planplantcc,this.prioritycc,
      this.reqenddatecc,this.reqendtimecc,this.reqstartdatecc,this.reqstarttimecc,this.shorttextcc);
  @override
  // void initState(){
  //   super.initState();
  //   newnotficreatuibcall();
  // });
  void initState(){
    super.initState();
    newnotficreatuibcall();
  }
  Widget build(BuildContext context) {
    return Container();
  }
  void newnotficreatuibcall() async {
    print("this is node call");
    print(breakdowncc);
    final response = await http.post(
        Uri.parse('http://192.168.21.36:8000/mp/notcreate'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        // body: data
        body: jsonEncode(<String, String>{
        "break":breakdowncc,
        "end_date":reqenddatecc,
        "end_time":reqendtimecc,
        "equi_id":equiidcc,
        "notif_type":notiftypecc,
        "plant":planplantcc,
        "priority":prioritycc,
        "text":shorttextcc,
        "start_date":reqstartdatecc,
        "start_time":reqstarttimecc,
          // 'BREAKDOWN_IND': breakdowncc,
          // 'EQUI_ID': equiidcc,
          // 'FUNCLOC': funcloccc,
          // "NOTIF_TYPE": notiftypecc,
          // "PARTFUNC":partfunccc,
          // "PARTNER":partnercc,
          // "PLANGROUP":plangroupcc,
          // "PLANPLANT":planplantcc,
          // "PRIORITY":prioritycc,
          // "REPORTEDBY":reportedbycc,
          // "REQ_END_DATE":reqenddatecc,
          // "REQ_END_TIME":reqendtimecc,
          // "REQ_START_DATE":reqstartdatecc,
          // "REQ_START_TIME":reqstarttimecc,
          // "SHORTTEXT":shorttextcc

        }));




    // var data = jsonDecode(response.body);

    setState(() {
      var data = jsonDecode(response.body);print("VEDA");

      print(data);
      // notnumnew = (data["HEADER"]["NOTIF_NO"]["_text"]);
      // print(data["HEADER"]["NOTIF_NO"]["_text"]);

    });
}}
