import 'package:flutter/widgets.dart';
import 'package:x_action/src/action.dart';
import 'package:x_action/src/repository.dart';
import 'package:x_action/x_action.dart';

class RouteHandler {
  static handle(XRouteAction action) {
    Navigator.of(XActions.context).pushNamed(action.route);
  }
}
