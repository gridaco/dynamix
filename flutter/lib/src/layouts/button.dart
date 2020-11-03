import 'package:dynamic/dynamic.dart';
import 'package:x_action/x_action.dart';
import 'package:json_annotation/json_annotation.dart';

//part 'button.g.dart';

@JsonSerializable()
class XButton extends XView {
  XButton(this.action);

  // TODO FIXME
  @JsonKey(ignore: true)
  XAction action;

  // region json serialization.
  /// toJson is not required
//  factory XButton.fromJson(Map<String, dynamic> json) =>
//      _$XButtonFromJson(json);
  // endregion
}
