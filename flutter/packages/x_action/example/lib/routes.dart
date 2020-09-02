import 'package:example/screens/first_screen.dart';
import 'package:example/screens/second_screen.dart';
import 'package:example/screens/third_screen.dart';
import 'package:flutter/material.dart';

import 'screens/third_screen.dart';

buildRoute() {
  return {
    FirstScreen.routeName: (BuildContext c) => FirstScreen(),
    SecondScreen.routeName: (BuildContext c) => SecondScreen(),
    ThirdScreen.routeName: (BuildContext c) => ThirdScreen(),
  };
}