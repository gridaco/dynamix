import 'package:flutter/material.dart';
import 'package:x_action/src/action.dart';
import 'package:x_action/x_action.dart';

class RouteHandler extends ActionHandler<XRouteAction> {
  RouteHandler(BuildContext context, {XRouteAction route})
      : super(context, action: route);

  factory RouteHandler.of(BuildContext context, {XRouteAction route}) {
    return RouteHandler(context, route: route);
  }

  @override
  handle() {
    Navigator.of(context).pushNamed(action.route);
  }
}
