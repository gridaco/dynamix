import 'package:dynamic/dynamic.dart';
import 'package:example/development/with_icon_content.dart';
import 'package:flutter/material.dart';

class ActionRoutesModalsAndDialogsScreen extends StatefulWidget {
  static const routeName = "/actions/route/modals-and-dialogs";

  @override
  State<StatefulWidget> createState() =>
      _ActionRoutesModalsAndDialogsScreenState();
}

class _ActionRoutesModalsAndDialogsScreenState
    extends State<ActionRoutesModalsAndDialogsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("modal route actions library"),
      ),
      body: SingleChildScrollView(
        child: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        FlatButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (c) {
                    return ModalWithIconContent(icon: XIconData("material://Icons."),);
                  });
            },
            child: Text("show icon modal bottom sheet"))
      ],
    );
  }
}
