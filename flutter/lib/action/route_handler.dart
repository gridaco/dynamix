import 'package:flutter/material.dart';
import 'package:flutter_remote_ui/action/action_handler.dart';

class RouteHandler extends ActionHandler {
  RouteHandler(BuildContext context, {ActionData actionData})
      : super(context, actionData: actionData);

  factory RouteHandler.of(BuildContext context, {ActionData actionData}) {
    return RouteHandler(context, actionData: actionData);
  }

  @override
  handle() {
    Navigator.of(context).pushNamed(actionData.route);
  }
}
