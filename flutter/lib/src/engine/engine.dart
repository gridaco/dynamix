import 'package:flutter/material.dart';
import 'package:dynamic/dynamic.dart';

@Deprecated("not implemented")
class XTranslatorBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

// todo get custom de-serializer from provider

/// XTranslator is a primary translator/mapper/engine for decoding data from remote server, (or internal formed ui data)
class XTranslator {
  static XView translate(Map<String, dynamic> data) {
    /// handle by type
    /// -> since dart does not support generic instance de-serialization, we should handle the dynamic remote ui via some custom mapping.
    final String fieldType = data["type"] as String;
    final fieldData = data;
    // the field data's type must be json serializable type, which is currently -> `Map<String, dynamic>`
    //    assert(fieldData.runtimeType is Map<String, dynamic>);
    // region button
    if (fieldType == "button") {
      return XButton.fromJson(fieldData);
    }

    // endregion button

    // region text
    if (fieldType == "text") {
      return XText.fromJson(fieldData);
    }
    // endregion text

    // region avatar
    if (fieldType == "avatar") {}
    // endregion avatar

    return null;
  }
}
