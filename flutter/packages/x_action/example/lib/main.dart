import 'package:example/screens/route_actions/route_actions_screen.dart';

import 'routes.dart';
import 'package:flutter/material.dart';
import 'package:x_action/x_action.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: XActions.navigatorKey,
      routes: buildRoute(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String pushUri = "material://push.route.actions/first?a=b";
  String popUri = "material://pop.route.actions/first?a=b";

  void _invokeAction() {
    RouteHandler.handle(XRouteAction.fromUri(pushUri));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildDemoEntries(),
            Text(
              'prompt',
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (s) {
                pushUri = s;
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _invokeAction,
        tooltip: 'Increment',
        child: Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  buildDemoEntries() {
    return ListTile(
      title: Text("route actions"),
      onTap: () {
        XRouteAction(route: RouteActionsScreen.routeName).invoke();
      },
    );
  }
}
