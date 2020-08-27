import 'package:flutter/material.dart';

/// [XColors] is a app level scoped global color repository to load material colors by string, name, bridged's resource uri, or register your own color mapping.
/// **needs to be implemented**
class XColors {
  static const MATERIAL_COLORS = {
    "red": Colors.red,
    "blue": Colors.blue,
    "green": Colors.green,
  };

  static Color fetch(String uri) {
    return MATERIAL_COLORS[uri];
  }
}
