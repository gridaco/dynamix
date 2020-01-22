import 'package:flutter/foundation.dart';
import 'package:flutter_remote_ui/src/data/model/Widget.dart';

class Image extends Widget
{
  Image(this.src, {this.resourceType});
  String src;
  ImageResourceType resourceType;
}

enum ImageResourceType{
  HEX,
  URL
}