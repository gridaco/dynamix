import 'package:flutter/material.dart';

class ActionDemoScreen extends StatefulWidget {
  static const routeName = "/demo/action";
  @override
  State<StatefulWidget> createState() => _ActionDemoScreenState();
}

class _ActionDemoScreenState extends State<ActionDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("actions demo"),
      ),
    );
  }
}
