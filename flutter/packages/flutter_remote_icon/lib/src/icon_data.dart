import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_remote_icon/flutter_remote_icon.dart';
import 'material_icons_mapping.dart';

/// [XIconType]
/// if this data is not provided, automatically detects the type & schema of the icon uri
enum XIconType {
  // google's material icon
  MATERIAL_NATIVE,
  // apple's cupertino icon
  // todo - not implemented
  CUPERTINO_NATIVE,
  // image from network
  REMOTE_RESOURCE,
  // image from your project's local asset
  LOCAL_ASSET,
  // icon font from your local project's custom font
  CUSTOM_FONT,
}

/// [XIconData] contains the data for dynamically loading icons registered via data sent from the server.
class XIconData {
  final String uri;
  final XIconType type;

  /// optional
  final IconData initIconData;

  IconData get icon {
    if (initIconData != null) {
      return initIconData;
    }

    /// get [IconData] via mapped string set.
    if (type == XIconType.MATERIAL_NATIVE) {
      return MATERIAL_ICONS_MAPPING[iconNameFromUri];
    } else if (type == XIconType.CUSTOM_FONT) {
      return XIcons.fetchMappingByNamespace(namespaceFromUri(uri))[uri];
    }

    throw FlutterError("no valid icon data found for provided uri : $uri");
  }

  String get iconNameFromUri {
    if (type == XIconType.MATERIAL_NATIVE) {
      final plain = uri.replaceAll(
          new RegExp(r'material://Icons.'), ''); // removes material:// prefix
      return plain;
    }
    throw Exception(
        "this icon data does not contain flutter native material icon data ");
  }

  final String asset;

  XIconData({
    @required this.uri,
    @required this.type,
    this.asset,
    this.initIconData,
  }): assert(type != null);

  factory XIconData.fromMaterialIconName(String name) {
    return XIconData(
        uri: "material://Icons.$name", type: XIconType.MATERIAL_NATIVE);
  }

  factory XIconData.fromUri(String uri) {
    if (!isValidUri(uri)) {
      throw FlutterError("$uri is not a valid icon uri format");
    }
    final namespace = namespaceFromUri(uri);
    // parse type from uri
    XIconType type;
    if (namespace == "asset") {
      type = XIconType.LOCAL_ASSET;
    } else if (namespace == "http" || namespace == "https") {
      type = XIconType.REMOTE_RESOURCE;
    } else if (namespace == "material") {
      type = XIconType.MATERIAL_NATIVE;
    } else if (XIcons.hasNamespace(namespace)) {
      type = XIconType.CUSTOM_FONT;
    }
    return XIconData(uri: uri, type: type);
  }

  factory XIconData.fromMaterialIcon(IconData icon) {
    return XIconData(
        uri: null, type: XIconType.MATERIAL_NATIVE, initIconData: icon);
  }

  factory XIconData.fromAssets(String asset) {
    return XIconData(
        uri: "asset://$asset", type: XIconType.LOCAL_ASSET, asset: asset);
  }

  factory XIconData.fromFont(String fontFamily, String icon) {
    throw UnimplementedError();
//    return RemoteIconData("");
    // todo implement
  }

  factory XIconData.fromRemote(String resource) {
    throw UnimplementedError();
    // 1. validate
//    return RemoteIconData("");
  }

  factory XIconData.fromBase64(String base64) {
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

bool isValidUri(String uri) {
  if (uri != null && uri.isNotEmpty) {
    return uri.contains("://");
  }
  return false;
}

String namespaceFromUri(String uri) {
  return uri.split("://")[0];
}
