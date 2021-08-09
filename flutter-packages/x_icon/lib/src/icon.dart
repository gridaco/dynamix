import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'icon_data.dart';

part 'icon.g.dart';

@JsonSerializable()
class XIcon extends StatelessWidget {
  @JsonKey(name: "icon")
  final XIconData icon;
  @JsonKey(ignore: true)
  final Key? key;
  @JsonKey(name: "size")
  final double? size;
  @JsonKey(ignore: true, name: "color") // todo : use custom XColor object.
  final Color? color;

  XIcon(this.icon, {this.size, this.color, this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconThemeData iconTheme =
        IconTheme.of(context).copyWith(size: size, color: color);

    switch (icon.type) {
      case XIconType.MATERIAL_NATIVE:
        return _buildFontBasedIcon();
      case XIconType.CUSTOM_FONT:
        return _buildFontBasedIcon();
      case XIconType.REMOTE_RESOURCE:
        return Image.network(
          icon.uri,
          width: iconTheme.size,
          height: iconTheme.size,
          color: color,
          colorBlendMode: BlendMode.color,
        );
      case XIconType.LOCAL_ASSET:
        return Image.asset(
          icon.asset,
          width: iconTheme.size,
          height: iconTheme.size,
          color: color,
          colorBlendMode: BlendMode.color,
        );
      case XIconType.CUPERTINO_NATIVE:
        throw FlutterError("cupertino icons are not yet supported");
      default:
        break;
    }

    TextStyle? errorStyle;
    if (Theme.of(context) != null) {
      var themeData = Theme.of(context);
      if (themeData.textTheme != null) {
        var textTheme = themeData.textTheme;
        errorStyle =
            textTheme.caption!.copyWith(color: Theme.of(context).errorColor);
      }
    }
    return Text(
      "ERROR: no valid remote icon data has passed",
      style: errorStyle,
    );
  }

  Widget _buildFontBasedIcon() {
    return Icon(
      icon.icon,
      size: size,
    );
  }

  factory XIcon.fromJson(json) => _$XIconFromJson(json);
}
