import 'package:example/screens/first_screen.dart';
import 'package:example/screens/route_actions_screen.dart';
import 'package:example/screens/second_screen.dart';
import 'package:example/screens/third_screen.dart';
import 'package:flutter/material.dart';

import 'screens/third_screen.dart';

buildRoute() {
  return {
    RouteActionsScreen.routeName: (BuildContext c) => RouteActionsScreen(),
    FirstScreen.routeName: (BuildContext c) => FirstScreen(),
    SecondScreen.routeName: (BuildContext c) => SecondScreen(),
    ThirdScreen.routeName: (BuildContext c) => ThirdScreen(),
  };
}
