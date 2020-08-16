import 'package:flutter/widgets.dart';
import 'package:flutter_remote_icon/flutter_remote_icon.dart';

part 'custom_icons.g.dart';

@IconMapper("custom")
class CustomIcons {
  static const IconData first_icon = null;

  Map<String, IconData> get mapping {
    return _CustomIconsMapping;
  }

  static IconData fromUri(String uri) => _$CustomIconsFromUri(uri);
}
