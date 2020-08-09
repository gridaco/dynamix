import 'package:flutter/material.dart';
import 'package:flutter_remote_ui/icons/icons.dart';

// examples
const ICON_LOCAL_ASSET_1 = "asset://assets/";
const ICON_REMOTE_RESOURCE_1 =
    "https://cdn3.iconfinder.com/data/icons/eightyshades/512/14_Add-512.png";
const FLUTTER_NATIVE_MATERIAL_ADD = "material://Icons.add";
// examples


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
