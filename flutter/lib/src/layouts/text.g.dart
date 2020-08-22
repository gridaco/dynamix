// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

XText _$XTextFromJson(Map<String, dynamic> json) {
  return XText(
    json['text'] as String,
  )
    ..type = json['type'] as String
    ..key = json['key'] as String;
}

Map<String, dynamic> _$XTextToJson(XText instance) => <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'text': instance.text,
    };
