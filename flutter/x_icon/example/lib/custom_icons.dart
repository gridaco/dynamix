import 'package:flutter/material.dart';
import 'package:x_icon/x_icon.dart';

part 'custom_icons.g.dart';

@IconMapper("custom")
class CustomIcons {
  static const IconData add = Icons.add;

  static Map<String, IconData> get mapping {
    return _CustomIconsMapping;
  }

  static IconData fromUri(String uri) => _$CustomIconsFromUri(uri);
}
