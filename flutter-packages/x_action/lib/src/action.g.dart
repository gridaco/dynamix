// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

XRouteAction _$XRouteActionFromJson(Map<String, dynamic> json) {
  return XRouteAction(
    name: json['name'] as String,
    group: json['group'] as String,
  )..data = json['data'] as Map<String, dynamic>;
}

Map<String, dynamic> _$XRouteActionToJson(XRouteAction instance) =>
    <String, dynamic>{
      'name': instance.name,
      'group': instance.group,
      'data': instance.data,
    };
