import 'package:flutter/material.dart';
import 'icon_data.dart';
export 'icon_data.dart';

class RemoteIcon extends StatelessWidget {
  final RemoteIconData icon;
  final double size;

  RemoteIcon(this.icon, {this.size});

  @override
  Widget build(BuildContext context) {
    IconThemeData iconTheme = IconTheme.of(context);
    if (size != null) {
      iconTheme = iconTheme.copyWith(size: size);
    }

    switch (icon.type) {
      case RemoteIconType.AUTOMATIC:
        return Icon(
          icon.icon,
          size: size,
        );
        break;
      case RemoteIconType.MATERIAL_NATIVE:
        return Icon(
          icon.icon,
          size: size,
        );
        break;
      case RemoteIconType.REMOTE_RESOURCE:
        return Image.network(icon.uri,
            width: iconTheme.size, height: iconTheme.size);
        break;
      case RemoteIconType.LOCAL_ASSET:
        return Image.asset(icon.asset,
            width: iconTheme.size, height: iconTheme.size);
        break;
      case RemoteIconType.CUSTOM_FONT:
        return Icon(icon.icon);
        break;
      case RemoteIconType.CUPERTINO_NATIVE:
        // TODO: Handle this case.
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
}
