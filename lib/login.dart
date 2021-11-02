import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_1/signup.dart';

import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  // const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String result = '';
  postRequest(String username, String password) async {
    var url = Uri.http('192.168.157.36:3000', 'mp/login');
    var response = await http
        .post(url, body: {"employeeid": username, "password": password});
    print(url);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      // print(responseData);
      print(responseData);
      setState(() {
        result = responseData["output"];
        if (result == 'Success') {
          Navigator.pushNamed(context, '/signuppage');
        } else if (result == 'failure') {
          // showAlert(context,"Enter the Valid Login ID and Password");

        } else {
          // showAlert(context,"Please map yourself with any Plant to Access this portal");
        }
      });
    } else {
      result = "Failure";
      print("Error occured at get request");
    }
  }

  @override
  TextEditingController employeeController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 6,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"))),
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(
                        color: Color(0xffFF3B5F),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Login to your account",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: employeeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Employee ID',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    // Color: Colors.white,
                    // color: Colors.blue,
                    child: Text('Login', style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      print(employeeController.text);
                      print(passwordController.text);
                      postRequest(
                          employeeController.text, passwordController.text);
                    },
                  )),
            ],
          ),
        ));
  }
}

Widget inputFile({label, obscureText = false, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]),
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[400]))),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
