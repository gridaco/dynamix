import 'dart:ui';

/// [XColor] is a uri based color converter which accepts standard hex color format, and bridged's resource uri schema.
class XColor extends Color {
  /// [uri] can be a hex string value such like #FFFFFFF, or schema based uri, such like material://Colors.red
  final String uri;

  XColor(this.uri) : super(_getColorFromHex(_getHexFromUri(uri)));

  static String _getHexFromUri(String uri) {
    return uri;
  }

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
