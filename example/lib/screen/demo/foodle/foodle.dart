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
      'Index 2: Business',
    ),
    Text(
      'Index 3: More',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        bottom: false,
        child: Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.fastfood),
                title: Text('Featured'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.library_add),
                title: Text('Business'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz),
                title: Text('More'),
              ),
            ],
            onTap: _onItemTapped,
          ),
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
