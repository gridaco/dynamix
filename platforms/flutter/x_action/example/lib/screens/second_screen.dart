import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  static const routeName = "/second";
  @override
  State<StatefulWidget> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("first screen"),
      ),
    );
  }
}
