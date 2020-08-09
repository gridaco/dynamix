import 'package:flutter/material.dart';
import 'package:flutter_remote_ui/icons/icons.dart';

class IconsDemoScreen extends StatefulWidget {
  static const routeName = "/demo/remote-icon";

  @override
  State<StatefulWidget> createState() => _IconsDemoScreenState();
}

class _IconsDemoScreenState extends State<IconsDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("remote icons"),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return RemoteIcon(RemoteIconData.fromUri("material://Icons.add"));
  }
}
