import 'package:flutter/material.dart';

class NotEditPage extends StatefulWidget {
  // const WoEditPage({Key? key}) : super(key: key);

  @override
  _NotEditPageState createState() => _NotEditPageState();
}

class _NotEditPageState extends State<NotEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Edit'),
      ),
    );
  }
}
