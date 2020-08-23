import 'package:flutter/material.dart';
import 'icon_data.dart';

class XIcon extends StatelessWidget {
  final XIconData icon;
  final Key key;
  final double size;
  final Color color;

  XIcon(this.icon, {this.size, this.color, this.key}): super(key: key);

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
        break;
    }
    return Text(
      "ERROR: no valid remote icon data has passed",
      style: Theme.of(context)
          .textTheme
          .caption
          .copyWith(color: Theme.of(context).errorColor),
    );
  }

  Widget _buildFontBasedIcon() {
    return Icon(
      icon.icon,
      size: size,
    );
  }
}
