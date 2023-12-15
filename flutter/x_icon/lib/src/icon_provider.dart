import 'package:flutter/widgets.dart';
import 'package:x_icon/x_icon.dart';
import 'package:x_icon/src/icon_data.dart';
import 'package:x_icon/src/utils.dart';

import 'material_icons_mapping.dart';

/// [XIcons] is a remote icon repository.
/// this is used for validations and injecting custom parser etc..
class XIcons {
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
      return _registry[namespace]!;
    } catch (e) {
      throw FlutterError(
          "namespace not registered error: remote icon failed to find any icon mapping with the provided namespace '$namespace'");
    }
  }

  /// check if current XIcons contains the mapping of provided namespace
  static bool hasNamespace(String namespace) {
    return _registry.containsKey(namespace);
  }

  static IconData fetchIcon(String uri, {XIconType? type}) {
    if (type == null) {
      type = typeFromUri(uri);
    }

    if (type == XIconType.MATERIAL_NATIVE) {
      final name = nameFromUri(uri);
      return MATERIAL_ICONS_MAPPING[name]!;
    } else if (type == XIconType.CUSTOM_FONT) {
      final namespace = namespaceFromUri(uri);
      return _registry[namespace]![uri]!;
    } else {
      throw FlutterError(
          "given uri : $uri cannot be fetched from XIcons registry with type $type");
    }
  }

  /// validates if uri is available for usage/
  /// if dry == true, it validates through logic and check if it will work or not.
  /// running validate with dry == false will actually create the widget, runs a full validation
  static validate(String uri, {bool dry = false}) {
    // todo: implement dry run
    try {
      XIcon(XIconData.fromUri(uri));
      return true;
    } catch (e) {
      return false;
    }
  }
}
