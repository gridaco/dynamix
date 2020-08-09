import 'package:flutter/material.dart';
import 'icons_mapping.dart';

enum RemoteIconType { MATERIAL_NATIVE, REMOTE_RESOURCE, LOCAL_ASSET }

class RemoteIconData {
  final String uri;
  final RemoteIconType type;
  final IconData initIconData; // optional
  IconData get iconData {
    if (initIconData != null) {
      return initIconData;
    }
    return ICONS_MAPPING[iconNameFromUri];
  }

  String get iconNameFromUri {
    if (type == RemoteIconType.MATERIAL_NATIVE) {
      final plain = uri.replaceAll(
          new RegExp(r'material://Icons.'), ''); // removes material:// prefix
      return plain;
    }
    throw Exception(
        "this icon data does not contain flutter native material icon data ");
  }

  final String asset;

  RemoteIconData({
    @required this.uri,
    @required this.type,
    this.asset,
    this.initIconData,
  });

  factory RemoteIconData.fromMaterialIconName(String name) {
    return RemoteIconData(
        uri: "material://Icons.$name", type: RemoteIconType.MATERIAL_NATIVE);
  }

  factory RemoteIconData.fromUri(String uri) {
    // parse type from uri

    var type;
    if (uri.contains("asset://")) {
      type = RemoteIconType.LOCAL_ASSET;
    } else if (uri.contains("http://") || uri.contains("https://")) {
      type = RemoteIconType.REMOTE_RESOURCE;
    } else if (uri.contains("material://")) {
      type = RemoteIconType.MATERIAL_NATIVE;
    }
    return RemoteIconData(uri: uri, type: type);
  }

  factory RemoteIconData.fromMaterialIcon(IconData icon) {
    return RemoteIconData(
        uri: null, type: RemoteIconType.MATERIAL_NATIVE, initIconData: icon);
  }

  factory RemoteIconData.fromAssets(String asset) {
    return RemoteIconData(
        uri: "asset://$asset", type: RemoteIconType.LOCAL_ASSET, asset: asset);
  }

  factory RemoteIconData.fromFont(String fontFamily, String icon) {
    throw UnimplementedError();
//    return RemoteIconData("");
    // todo implement
  }

  factory RemoteIconData.fromRemote(String resource) {
    throw UnimplementedError();
    // 1. validate
//    return RemoteIconData("");
  }

  factory RemoteIconData.fromBase64(String base64) {
    throw UnimplementedError();
    // todo implement
  }
}

const SUPPORTED_RESOURCE_FORMATS = [
  "svg",
  "png",
  "jpg",
  "jpeg"
]; // todo use for validation

class RemoteIcon extends StatelessWidget {
  final RemoteIconData icon;

  RemoteIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    switch (icon.type) {
      case RemoteIconType.MATERIAL_NATIVE:
        return Icon(icon.iconData);
        break;
      case RemoteIconType.REMOTE_RESOURCE:
        return Image.network(icon.uri);
        break;
      case RemoteIconType.LOCAL_ASSET:
        return Image.asset(icon.asset);
        break;
    }
    return Text("ERROR: no valid remote icon data has passed");
  }
}
