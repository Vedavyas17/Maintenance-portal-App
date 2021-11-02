import 'package:flutter/material.dart';

class WoEditPage extends StatefulWidget {
  // const WoEditPage({Key? key}) : super(key: key);

  @override
  _WoEditPageState createState() => _WoEditPageState();
}

class _WoEditPageState extends State<WoEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WorkOrder Update'),
      ),
    );
  }
}
