import 'package:flutter/material.dart';

Widget test() {
//  return Icon(IconData(codePoint));
}

const ICON_LOCAL_ASSET_1 = "asset://assets/";
const ICON_REMOTE_RESOURCE_1 =
    "https://cdn3.iconfinder.com/data/icons/eightyshades/512/14_Add-512.png";
const FLUTTER_NATIVE_MATERIAL_ADD = "material://icons.add";

class RemoteIconData {
  final String uri;

  RemoteIconData(this.uri);

  factory RemoteIconData.fromMaterialIcon(IconData icon) {
    return RemoteIconData("");
  }

  factory RemoteIconData.fromAssets(String asset) {
    return RemoteIconData("");
  }

  factory RemoteIconData.fromFont(String fontFamily, String icon) {
    return RemoteIconData("");
    // todo implement
  }

  factory RemoteIconData.fromRemote(String resource) {
    // 1. validate
    return RemoteIconData("");
  }

  factory RemoteIconData.fromBase64(String base64) {
    throw UnimplementedError();
    // todo implement
  }
}

const SUPPORTED_RESOURCE_FORMATS = ["svg", "png", "jpg", "jpeg"];
