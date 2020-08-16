import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_remote_icon/flutter_remote_icon.dart';

part 'custom_icons.g.dart';

@IconMapper("custom")
class CustomIcons {
  static const IconData add = Icons.add;

  static Map<String, IconData> get mapping {
    return _CustomIconsMapping;
  }

  static IconData fromUri(String uri) => _$CustomIconsFromUri(uri);
}
