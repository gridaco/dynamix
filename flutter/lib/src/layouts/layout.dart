
import 'package:flutter/foundation.dart';

abstract class Layout<Body>{
  Layout({@required this.body});
  String version;
  String layout;
  String variant;
  Body body;
}