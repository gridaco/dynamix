import 'dart:convert';

import 'package:flutter/material.dart';

class ActionData {
  ActionData({this.rawData});

  final String rawData;

  Map<String, dynamic> get map {
    return json.decode(rawData);
  }

  String get route {
    return map["data"]["route"] as String;
  }

  factory ActionData.fromBuilt(String builtString) {
    return ActionData(rawData: builtString);
  }
}

class ActionHandler {
  final BuildContext context;
  final ActionData actionData;

  ActionHandler(this.context, {this.actionData});

  factory ActionHandler.of(BuildContext context) {
    return ActionHandler(context);
  }

  handle() {}
}
