import 'package:flutter_remote_icon/flutter_remote_icon.dart';
import 'package:json_annotation/json_annotation.dart';

part 'icon.g.dart';

@JsonSerializable()
class XIconData extends RemoteIconData {
  XIconData();

  factory XIconData.fromJson(json) => _$XIconDataFromJson(json);
}

@JsonSerializable()
class XIcon extends RemoteIcon {
  XIcon(this.icon) : super(icon);

  final XIconData icon;

  factory XIcon.fromJson(json) => _$XIconFromJson(json);
}
