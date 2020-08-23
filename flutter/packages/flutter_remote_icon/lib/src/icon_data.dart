import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_remote_icon/flutter_remote_icon.dart';
import 'package:flutter_remote_icon/src/utils.dart';
import 'material_icons_mapping.dart';

/// [XIconType]
/// if this data is not provided, automatically detects the type & schema of the icon uri
enum XIconType {
  // google's material icon
  MATERIAL_NATIVE,
  // apple's cupertino icon
  CUPERTINO_NATIVE,
  // image from network
  REMOTE_RESOURCE,
  // image from your project's local asset
  LOCAL_ASSET,
  // icon font from your local project's custom font
  CUSTOM_FONT,
}

/// the list of supported file formats
const SUPPORTED_RESOURCE_FORMATS = ["svg", "png", "jpg", "jpeg"];

/// [XIconData] contains the data for dynamically loading icons registered via data sent from the server.
class XIconData {
  /// the [uri] is used for representing desired resource.
  /// this can be native local material icons and also can be remote resource url. (and more)
  final String uri;

  /// [_explicitType] is used for explicitly providing the type of the uri.
  XIconType _explicitType;

  /// if [_explicitType] is provided, use it instead of parsing from uri.
  /// describes what it stands for.
  XIconType get type {
    if (_explicitType != null) {
      return _explicitType;
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
    return type;
  }

  /// get [IconData] via mapped string set.
  IconData get icon {
    if (type == XIconType.MATERIAL_NATIVE) {
      return MATERIAL_ICONS_MAPPING[name];
    } else if (type == XIconType.CUSTOM_FONT) {
      return XIcons.fetchMappingByNamespace(namespaceFromUri(uri))[uri];
    }

    // only font based uri supports icon getter. if not, throw error
    throw FlutterError(
        "no valid icon data found for provided uri : $uri. did you provided asset or remote uri for XIconData.icon usage?");
  }

  String get asset {
    return uri.split("asset://")[1];
  }

  /// [name] returns the parsed icon name from the uri. for example, if given uri is "ns://Icons.add", name will be "add"
  String get name {
    if (type == XIconType.MATERIAL_NATIVE) {
      final plain = uri.replaceAll(
          new RegExp(r'material://Icons.'), ''); // removes material:// prefix
      return plain;
    }
    throw Exception(
        "this icon data does not contain flutter native material icon data ");
  }

  XIconData({@required this.uri, XIconType type}) : this._explicitType = type;

  factory XIconData.fromMaterialIconName(String name) {
    return XIconData(
        uri: "material://Icons.$name", type: XIconType.MATERIAL_NATIVE);
  }

  factory XIconData.fromUri(String uri) {
    if (!isValidUri(uri)) {
      throw FlutterError("$uri is not a valid icon uri format");
    }
    return XIconData(uri: uri);
  }

  factory XIconData.fromAssets(String asset) {
    return XIconData(uri: "asset://$asset", type: XIconType.LOCAL_ASSET);
  }

  factory XIconData.fromRemote(String resource) {
    // 1. validate
    assert(isValidResourceUrl(resource));
    return XIconData(uri: resource, type: XIconType.LOCAL_ASSET);
  }
}
