
import 'package:flutter/material.dart';

class TimelineDemoScreen extends StatefulWidget{
  static const routeName = "/demo/timeline";
  @override
  State<StatefulWidget> createState() => _TimelineDemoScreenState();
}


class _TimelineDemoScreenState extends State<TimelineDemoScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("timeline")
      ),
    );
  }
}