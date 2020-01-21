import 'package:flutter/material.dart';

class Truck extends StatefulWidget {
  static const routeName = "foodle/truck";

  @override
  _TruckState createState() => _TruckState();
}

class _TruckState extends State<Truck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('truck'),
      ),
      body: Center(
        child: Text('body'),
      ),
    );
  }
}
