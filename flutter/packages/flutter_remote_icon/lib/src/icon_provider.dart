import 'package:flutter/widgets.dart';

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
  static Map<String, IconData> _fetchMappingByNamespace(String namespace) {
    try {
      return _registry[namespace];
    } catch (e) {
      throw FlutterError(
          "namespace not registered error: remote icon failed to find any icon mapping with the provided namespace '$namespace'");
    }
  }
}
