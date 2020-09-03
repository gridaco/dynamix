import 'package:flutter/material.dart';
import 'package:x_action/x_action.dart';

class RouteActionsScreen extends StatefulWidget {
  static const routeName = "/demo/route";

  @override
  State<StatefulWidget> createState() => _RouteActionsScreenState();
}

class _RouteActionsScreenState extends State<RouteActionsScreen> {
  XRouteAction action = XRouteAction();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("actions.route"),
      ),
      body: SingleChildScrollView(
        child: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(24),
          child: Text("${action.uri}"),
        ),
        Container(
          margin: EdgeInsets.all(24),
          child: TextField(
            decoration: InputDecoration(labelText: "route"),
            onChanged: (s) {
              setState(() {
                action.route = s;
              });
            },
          ),
        ),
        Container(
          margin: EdgeInsets.all(24),
          child: TextField(
            decoration:
                InputDecoration(labelText: "mode (screen / fullscreen dialog /  modal / dialog)"),
            onChanged: (s){
              action.presenter = s;
            },
          ),
        ),
        Container(
            margin: EdgeInsets.all(24),
            child: RaisedButton(
                child: Text("invoke !"),
                onPressed: () {
                  action.invoke();
                })),
      ],
    );
  }
}
