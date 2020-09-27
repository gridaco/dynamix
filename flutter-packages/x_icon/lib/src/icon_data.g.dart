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

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$XIconTypeEnumMap = {
  XIconType.MATERIAL_NATIVE: 'MATERIAL_NATIVE',
  XIconType.CUPERTINO_NATIVE: 'CUPERTINO_NATIVE',
  XIconType.REMOTE_RESOURCE: 'REMOTE_RESOURCE',
  XIconType.LOCAL_ASSET: 'LOCAL_ASSET',
  XIconType.CUSTOM_FONT: 'CUSTOM_FONT',
};
