import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InstagramDemo extends StatefulWidget {
  static const routeName = "demo/instagram";
  @override
  State<StatefulWidget> createState() => _InstagramDemo();
}

class _InstagramDemo extends State<InstagramDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("instagram"),
      ),
    );
  }
}
