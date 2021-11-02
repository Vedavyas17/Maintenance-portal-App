import 'package:flutter/material.dart';

class NotCreatePage extends StatefulWidget {
  // const NotCreatePage({Key? key}) : super(key: key);

  @override
  _NotCreatePageState createState() => _NotCreatePageState();
}

class _NotCreatePageState extends State<NotCreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Create'),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
                // controller: ORDERID_controller,
                decoration: InputDecoration(
                  labelText: 'NOTIFICATION NO ',
                  border: OutlineInputBorder(),
                )
            ),
          ),
        ],
      ),
    );
  }
}
