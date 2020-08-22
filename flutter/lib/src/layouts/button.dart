import 'package:flutter_remote_ui/flutter_remote_ui.dart';
import 'package:json_annotation/json_annotation.dart';

part 'button.g.dart';

@JsonSerializable()
class XButton extends XView {
  XButton(this.action);

  XAction action;

  // region json serialization.
  /// toJson is not required
  factory XButton.fromJson(Map<String, dynamic> json) =>
      _$XButtonFromJson(json);
  // endregion
}
