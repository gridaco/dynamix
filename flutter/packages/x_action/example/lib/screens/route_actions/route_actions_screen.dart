import 'package:example/screens/route_actions/action_routes_modals_and_dialogs_screen.dart';
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
            decoration: InputDecoration(
                labelText:
                    "mode (screen / fullscreen dialog /  modal / dialog)"),
            onChanged: (s) {
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
        buildActionsDemoCategoryList(),
      ],
    );
  }

  Widget buildActionsDemoCategoryList() {
    return ListView.builder(
      itemBuilder: (c, i) {
        return ListTile(
          title: Text("modals & dialogs"),
          onTap: () {
            Navigator.of(context)
                .pushNamed(ActionRoutesModalsAndDialogsScreen.routeName);
          },
        );
      },
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
    );
  }
}
