import 'package:flutter_remote_icon/src/icon_data.dart';
import 'package:flutter_remote_icon/src/icon_provider.dart';

bool isValidUri(String uri) {
  // todo: consider updating logic using URI#parse
  if (uri != null && uri.isNotEmpty) {
    return uri.contains("://");
  }
  return false;
}

/// parses the schema from given uri
String namespaceFromUri(String uri) {
  return Uri.parse(uri).scheme;
}

/// [isValidResourceUrl] is a function for checking the given url (resource) is valid. for loading
bool isValidResourceUrl(String resource) {
  // todo: some additional logic might be also helpful.
  return Uri.parse(resource).isAbsolute;
}


XIconType typeFromUri(String uri){
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


/// [nameFromUri] returns the parsed icon name from the uri. for example, if given uri is "ns://Icons.add", name will be "add"
String nameFromUri(String uri){
  final type = typeFromUri(uri);
  if (type == XIconType.MATERIAL_NATIVE) {
    final plain = uri.replaceAll(
        new RegExp(r'material://Icons.'), ''); // removes material:// prefix
    return plain;
  }
  throw Exception(
      "this icon data does not contain flutter native material icon data ");
}