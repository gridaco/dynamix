// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

XAction _$XActionFromJson(Map<String, dynamic> json) {
  return XAction(
    json['name'] as String,
    group: json['group'] as String,
  );
}

Map<String, dynamic> _$XActionToJson(XAction instance) => <String, dynamic>{
      'name': instance.name,
      'group': instance.group,
    };
