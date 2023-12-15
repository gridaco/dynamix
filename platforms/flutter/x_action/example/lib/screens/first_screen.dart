import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  static const routeName = "/first";
  @override
  State<StatefulWidget> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("first screen"),
      ),
    );
  }
}
