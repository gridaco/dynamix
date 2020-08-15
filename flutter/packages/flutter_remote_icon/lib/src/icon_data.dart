import 'package:flutter/widgets.dart';
import 'material_icons_mapping.dart';

/// RemoteIconType
enum RemoteIconType {
  // automatically detects the type & schema of the icon uri
  // todo - not implemented
  AUTOMATIC,
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
  // todo - not implemented
  CUSTOM_FONT,
}

/// [RemoteIconData] contains the data for dynamically loading icons registered via data sent from the server.
class RemoteIconData {
  final String uri;
  final RemoteIconType type;

  /// optional
  final IconData initIconData;

  IconData get icon {
    if (initIconData != null) {
      return initIconData;
    }

    /// get [IconData] via mapped string set.
    return MATERIAL_ICONS_MAPPING[iconNameFromUri];
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
