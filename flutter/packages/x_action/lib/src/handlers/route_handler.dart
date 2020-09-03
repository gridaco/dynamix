import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:x_action/src/action.dart';
import 'package:x_action/src/repository.dart';
import 'package:x_action/x_action.dart';

class RouteHandler {
  static handle(XRouteAction action) {
    // todo use custom built route handler
//    Modular.to.pushNamed(action.route);
//    Modular.to.pushNamed("/second");
    XActions.to.pushNamed(action.route);
//    Navigator.of(XActions.context).pushNamed(action.route);
  }
}
