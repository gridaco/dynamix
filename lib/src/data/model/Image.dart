import 'package:flutter_remote_ui/src/data/model/Widget.dart';

class Image extends Widget
{
  String src;
  ImageResourceType resourceType;
}

enum ImageResourceType{
  HEX,
  URL
}