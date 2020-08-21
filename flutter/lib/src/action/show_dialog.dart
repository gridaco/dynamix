import 'package:flutter/material.dart';
import 'action_handler.dart';

class DialogHandler extends ActionHandler {
  DialogHandler(BuildContext context, {ActionData actionData})
      : super(context, actionData: actionData);

  factory DialogHandler.of(BuildContext context) {
    return DialogHandler(context);
  }

  @override
  handle() {
    super.handle();
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
