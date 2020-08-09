import 'widget.dart';

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