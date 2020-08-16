import 'package:flutter/material.dart';
import 'package:flutter_remote_icon/flutter_remote_icon.dart';
import 'package:flutter_remote_icon_example/custom_icons.dart';

void main() {
  IconProvider.register("custom", CustomIcons.mapping);
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Remote Icon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Remote Icon'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: [customIcon()],
    );
  }

  Widget customIcon() {
    final uri = "custom://CustomIcons.add";
    return Column(
      children: [Text(uri), RemoteIcon(RemoteIconData.fromUri(uri))],
    );
  }
}
