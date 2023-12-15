// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

XIcon _$XIconFromJson(Map<String, dynamic> json) {
  return XIcon(
    XIconData.fromJson(json['icon']),
    size: (json['size'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$XIconToJson(XIcon instance) => <String, dynamic>{
      'icon': instance.icon,
      'size': instance.size,
    };
