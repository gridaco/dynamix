import 'package:flutter/material.dart';
import 'package:flutter_remote_ui_example/screen/wallet_screen.dart';
import 'package:flutter_remote_ui_example/screen/screen2.dart';
import 'package:flutter_remote_ui_example/screen/screen3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyHomePage.routeName,
      routes: {
        MyHomePage.routeName: (context) => MyHomePage(),
        Screen1.routeName: (context) => Screen1(),
        Screen2.routeName: (context) => Screen2(),
        Screen3.routeName: (context) => Screen3(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const routeName = "/home";
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _moveToWalletScreen() {
    Navigator.of(context).pushNamed(Screen1.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("home"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("wallet"),
                onPressed: _moveToWalletScreen,
              ),
              RaisedButton(
                child: Text("screen 2"),
                onPressed: (){
                  Navigator.of(context).pushNamed(Screen2.routeName);
                },
              ),
              RaisedButton(
                child: Text("screen 3"),
                onPressed: (){
                  Navigator.of(context).pushNamed(Screen3.routeName);
                },
              ),
            ],
          ),
        ));
  }
}
