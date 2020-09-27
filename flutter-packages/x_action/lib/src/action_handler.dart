import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:x_action/src/action.dart';

/// [ActionHandler]
/// [A_T] is for type of action which extends from [XAction]
abstract class ActionHandler<A_T extends XAction> {
  final BuildContext context;
  final A_T action;

  ActionHandler(this.context, {this.action});

  factory ActionHandler.of(BuildContext context){
    throw UnimplementedError();
  }

  handle();
}
