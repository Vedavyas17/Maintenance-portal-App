import 'package:flutter/material.dart';

class WoCreatePage extends StatefulWidget {
  // const WoCreatePage({Key? key}) : super(key: key);

  @override
  _WoCreatePageState createState() => _WoCreatePageState();
}

class _WoCreatePageState extends State<WoCreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title:Text(
        "WorkOrder Create")
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              // controller: ORDERID_controller,
                decoration: InputDecoration(
                  labelText: 'ORDER ID',
                  border: OutlineInputBorder(),
                )
            ),
          ),
        ],
      ),
    );
  }
}
