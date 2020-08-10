import 'package:flutter_remote_ui/flutter_remote_ui.dart';

class Image extends View
{
  Image(this.src, {this.resourceType});
  String src;
  ImageResourceType resourceType;
}

enum ImageResourceType{
  HEX,
  URL
}