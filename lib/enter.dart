import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_1/signup.dart';
import 'package:http/http.dart' as http;

class EnterPage extends StatefulWidget {
  // const EnterPage({Key? key}) : super(key: key);

  @override
  _EnterPageState createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  String result = '';
  postRequest(String username, String password)  async {
    var url = Uri.http('192.168.21.36:3000', 'employee/login');
    var response = await http.post(url, body: {
      "employeeid": username,
      "password": password
    });
    print(url);
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      // print(responseData);
      print(responseData);
      setState(() {
        result = responseData["output"];
        if (result == 'Success') {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignUpPage(),)
          );
        }
        else if (result == 'failure') {
          // showAlert(context,"Enter the Valid Login ID and Password");


        }
        else {
          // showAlert(context,"Please map yourself with any Plant to Access this portal");
        }
      });
    }
    else {
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 10,
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
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Text(
                        //   "Login to your account",
                        //   style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                        // )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 40),
                    //   child: Column(
                    //     children: <Widget>[
                    //       inputFile(label: "Employee-ID *"),
                    //       inputFile(label: "Password *", obscureText: true)
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ListView(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              controller: employeeController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Employee-ID *',
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
                                labelText: 'Password *',
                              ),
                            ),
                          ),
                          Container(
                              height: 50,
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: ElevatedButton(
                                // Color: Colors.white,
                                // color: Colors.blue,
                                child: Text('Login'),
                                onPressed: () {
                                  print(employeeController.text);
                                  print(passwordController.text);
                                  postRequest(employeeController.text,passwordController.text);

                                },
                              )),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 40),
                    //   child: Container(
                    //     padding: EdgeInsets.only(top: 3, left: 3),
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(50),
                    //         border: Border(
                    //           bottom: BorderSide(color: Colors.black),
                    //           top: BorderSide(color: Colors.black),
                    //           left: BorderSide(color: Colors.black),
                    //           right: BorderSide(color: Colors.black),
                    //         )),
                    //     child: MaterialButton(
                    //       minWidth: double.infinity,
                    //       height: 60,
                    //       onPressed: () {
                    //         print(employeeController.text);
                    //         print(passwordController.text);
                    //         postRequest(employeeController.text,passwordController.text);
                    //
                    //       },
                    //       color: Color(0xff0095FF),
                    //       elevation: 0,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(50),
                    //       ),
                    //       child: Text(
                    //         "Login",
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.w600,
                    //           fontSize: 18,
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Text(
                    //       "© Kaar Technologies 2021.",
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.w600,
                    //         fontSize: 18,
                    //       ),
                    //     ),
                    //     // Text(
                    //     //   " Our Privacy Policy may change from time to time and all updates will be posted on this page.",
                    //     // )
                    //   ],
                    // ),
                    // Container(
                    //   padding: EdgeInsets.only(top: 100),
                    //   height: 200,
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //         image: AssetImage("assets/images/background.png"),
                    //         fit: BoxFit.fitHeight),
                    //   ),
                    // )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}







