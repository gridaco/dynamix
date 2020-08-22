// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'button.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

XButton _$XButtonFromJson(Map<String, dynamic> json) {
  return XButton(
    json['action'] == null
        ? null
        : XAction.fromJson(json['action'] as Map<String, dynamic>),
  )
    ..type = json['type'] as String
    ..key = json['key'] as String;
}

Map<String, dynamic> _$XButtonToJson(XButton instance) => <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'action': instance.action,
    };
