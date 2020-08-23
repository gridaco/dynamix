import 'package:flutter/material.dart' as m;
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
class XIconData extends IconData {
  /// the [uri] is used for representing desired resource.
  /// this can be native local material icons and also can be remote resource url. (and more)
  final String uri;

//  final double size;
//  final Color color;

  /// [_explicitType] is used for explicitly providing the type of the uri.
  final XIconType _explicitType;

  /// if [_explicitType] is provided, use it instead of parsing from uri.
  /// describes what it stands for.
  XIconType get type {
    if (_explicitType != null) {
      return _explicitType;
    }
    return typeFromUri(uri);
  }

  /// get [IconData] via mapped string set.
  IconData get icon {
    try {
      return XIcons.fetchIcon(uri, type: type);
    } catch (e) {
      // only font based uri supports icon getter. if not, throw error
      throw FlutterError(
          "no valid icon data found for provided uri : $uri. did you provided asset or remote uri for XIconData.icon usage?");
    }
  }

  String get asset {
    return uri.split("asset://")[1];
  }

  /// [name] returns the parsed icon name from the uri. for example, if given uri is "ns://Icons.add", name will be "add"
  String get name {
    return nameFromUri(uri);
  }

  static IconData _fetchIconDataForConstructor(String uri) {
    try {
      return XIcons.fetchIcon(uri);
    } catch (e) {}
    return m.Icons.error;
  }

  XIconData(this.uri, {XIconType type})
      : this._explicitType = type,
        super(
          _fetchIconDataForConstructor(uri).codePoint,
          fontFamily: _fetchIconDataForConstructor(uri).fontFamily,
          fontPackage: _fetchIconDataForConstructor(uri).fontPackage,
        );

  factory XIconData.fromMaterialIconName(String name) {
    return XIconData("material://Icons.$name", type: XIconType.MATERIAL_NATIVE);
  }

  factory XIconData.fromUri(String uri) {
    if (!isValidUri(uri)) {
      throw FlutterError("$uri is not a valid icon uri format");
    }
    return XIconData(uri);
  }

  factory XIconData.fromAssets(String asset) {
    return XIconData("asset://$asset", type: XIconType.LOCAL_ASSET);
  }

  factory XIconData.fromRemote(String resource) {
    // 1. validate
    assert(isValidResourceUrl(resource));
    return XIconData(resource, type: XIconType.LOCAL_ASSET);
  }
}
