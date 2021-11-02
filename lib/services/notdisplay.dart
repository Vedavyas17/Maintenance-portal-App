import 'dart:convert';

import 'package:flutter_app_1/model/notdisplaymodel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class notifdisplay {
  static Future<String> displayNotification(String notif_no) async {
    // print(order_id);
    final response = await http.post(
        Uri.parse('http://192.168.157.36:3000/mp/notdisplay'),
        body: {"notification_no": notif_no});
    // print(response.body);
    // Map data = json.decode(response.body);
    // List header_export = data['worder_display'];
    // List header_text = data['notification_list'];

    //   print(response.body);
    //
    //   WorkOrderListDisplay wo_details = WorkOrderListDisplay(
    //       orderid: header_export[0]['ORDERID'][0],
    //       order_type: header_export[0]['ORDER_TYPE'][0] ,
    //       plant: header_export[0]['PLANT'][0] ,
    //       funct_loc: header_export[0]['FUNCT_LOC'][0] ,
    //       comp_code: header_export[0]['COMP_CODE'][0] ,
    //       processing_group: header_export[0]['PROCESSING_GROUP'][0] ,
    //       object_class: header_export[0]['OBJECTCLASS'][0] ,
    //       start_date: header_export[0]['START_DATE'][0] ,
    //       finish_date: header_export[0]['FINISH_DATE'][0] ,
    //       production_start_date: header_export[0]['PRODUCTION_START_DATE'][0] ,
    //       production_finish_date:header_export[0]['PRODUCTION_FINISH_DATE'][0] ,
    //       production_start_time: header_export[0]['PRODUCTION_START_TIME'][0] ,
    //       production_finish_time: header_export[0]['PRODUCTION_FINISH_TIME'][0] ,
    //       currency: header_export[0]['CURRENCY'][0] ,
    //       network_profile: header_export[0]['NETWORK_PROFILE'][0] ,
    //       entered_by: header_export[0]['ENTERED_BY'][0] ,
    //       enter_date: header_export[0]['ENTER_DATE'][0] ,
    //       scenario: header_export[0]['SCENARIO'][0] ,
    //       routing_no: header_export[0]['ROUTING_NO'][0] ,
    //       reser_no: header_export[0]['RESERV_NO'][0] ,
    //       sys_status: header_export[0]['SYS_STATUS'][0] ,
    //       short_text: header_export[0]['SHORT_TEXT'][0],
    //       priotype: header_export[0]['PRIOTYPE'][0]
    //   );
    //   print(wo_details);
    return response.body;
  }
}
