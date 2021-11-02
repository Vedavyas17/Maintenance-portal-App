import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_app_1/model/wolistmodel.dart';

class wolist {
  static Future<String> getWorkOrder(String data) async {
    print("in");
    final response = await http.post(
        Uri.parse('http://192.168.157.36:3000/mp/worder'),
        body: {"plant": data});
    return response.body;
  }
}
