import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_app_1/model/notlistmodel.dart';

class notiflist {
  static Future<String> getNotification(
      String data1, String data2, String data3) async {
    print("in");
    final response = await http.post(
        Uri.parse('http://192.168.157.36:3000/mp/notlist'),
        body: {"notification": data1, "plant": data2, "group": data3});
    return response.body;
  }
}
