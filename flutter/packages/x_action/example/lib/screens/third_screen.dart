import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  static const routeName = "/third";
  @override
  State<StatefulWidget> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("first screen"),
      ),
    );
  }
}
