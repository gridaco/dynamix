import 'package:flutter/foundation.dart';
import 'package:flutter_remote_ui/src/data/model/Widget.dart';

class Image extends Widget
{
  Image({@required this.src});
  String src;
  ImageResourceType resourceType;
}

enum ImageResourceType{
  HEX,
  URL
}