import 'package:flutter/material.dart';

class AppstoreDemoScreen extends StatefulWidget {
  AppstoreDemoScreen({Key key}) : super(key: key);

  @override
  _AppstoreDemoScreenState createState() => _AppstoreDemoScreenState();
}

class _AppstoreDemoScreenState extends State<AppstoreDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("appstore"),
      ),
    );
  }
}
