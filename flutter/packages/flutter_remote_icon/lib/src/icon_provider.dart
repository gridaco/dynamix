import 'package:flutter/widgets.dart';
import 'package:flutter_remote_icon/flutter_remote_icon.dart';
import 'package:flutter_remote_icon/src/icon_data.dart';

class IconProvider {
  static Map<String, Map<String, IconData>> _registry = {};

  /// register icon mapping with namespace
  static register(String namespace, Map<String, IconData> mapping) {
    if (_registry.containsKey(namespace)) {
      throw FlutterError(
          "conflict error: the mapping with namespace $namespace is already registered");
    } else {
      _registry[namespace] = mapping;
    }
  }

  /// fetches the icons mapping by namespace
  static Map<String, IconData> fetchMappingByNamespace(String namespace) {
    try {
      return _registry[namespace];
    } catch (e) {
      throw FlutterError(
          "namespace not registered error: remote icon failed to find any icon mapping with the provided namespace '$namespace'");
    }
  }

  static bool hasNamespace(String namespace) {
    return _registry.containsKey(namespace);
  }

  static IconData fetchIcon(String uri) {
    final namespace = namespaceFromUri(uri);
    return _registry[namespace][uri];
  }

  static validate(String uri) {
    try {
      RemoteIcon(RemoteIconData.fromUri(uri));
      return true;
    } catch (e) {
      return false;
    }
  }
}
