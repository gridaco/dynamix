import 'package:flutter/material.dart';
import 'package:x_action/src/action.dart';
import 'package:x_action/x_action.dart';

class DialogHandler extends ActionHandler {
  DialogHandler(BuildContext context, {XAction? actionData})
      : super(context, action: actionData);

  factory DialogHandler.of(BuildContext context) {
    return DialogHandler(context);
  }

  @override
  handle() {
    showDialog(
        context: context,
        builder: (c) {
          return AlertDialog(
            title: Text("alert dialog"),
            content: Text("content"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("cancel"))
            ],
          );
        });
  }
}
