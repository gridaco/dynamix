// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icon_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

XIconData _$XIconDataFromJson(Map<String, dynamic> json) {
  return XIconData(
    json['uri'] as String,
    type: _$enumDecodeNullable(_$XIconTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$XIconDataToJson(XIconData instance) => <String, dynamic>{
      'uri': instance.uri,
      'type': _$XIconTypeEnumMap[instance.type],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$XIconTypeEnumMap = {
  XIconType.MATERIAL_NATIVE: 'MATERIAL_NATIVE',
  XIconType.CUPERTINO_NATIVE: 'CUPERTINO_NATIVE',
  XIconType.REMOTE_RESOURCE: 'REMOTE_RESOURCE',
  XIconType.LOCAL_ASSET: 'LOCAL_ASSET',
  XIconType.CUSTOM_FONT: 'CUSTOM_FONT',
};
