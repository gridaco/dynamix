// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

XIconData _$XIconDataFromJson(Map<String, dynamic> json) {
  return XIconData();
}

Map<String, dynamic> _$XIconDataToJson(XIconData instance) =>
    <String, dynamic>{};

XIcon _$XIconFromJson(Map<String, dynamic> json) {
  return XIcon(
    json['icon'] == null
        ? null
        : XIconData.fromJson(json['icon'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$XIconToJson(XIcon instance) => <String, dynamic>{
      'icon': instance.icon,
    };
