import 'package:flutter/material.dart';

import 'featured.dart';

class Foodle extends StatefulWidget {
  static const routeName = "demo/foodle";
  @override
  _FoodleState createState() => _FoodleState();
}

class _FoodleState extends State<Foodle> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    FeaturedTab(),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("foodle demo"),),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        new BottomNavigationBarItem(icon: Icon(Icons.fastfood), title: Text('Business'),),
        new BottomNavigationBarItem(icon: Icon(Icons.library_add), title: Text('Business'),),
        new BottomNavigationBarItem(icon: Icon(Icons.more_vert), title: Text('Business'),),
      ],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}

