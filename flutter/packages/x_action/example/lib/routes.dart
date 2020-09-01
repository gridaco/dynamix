import 'package:example/screens/first_screen.dart';
import 'package:flutter/material.dart';

buildRoute() {
  return {
    FirstScreen.routeName: (BuildContext c) => FirstScreen(),
  };
}