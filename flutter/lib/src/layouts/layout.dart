import 'package:flutter/foundation.dart';

abstract class XLayout<Body> {
  XLayout({@required this.body});

  String version;
  String layout;
  String variant;
  Body body;
}
