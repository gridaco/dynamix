import 'package:json_annotation/json_annotation.dart';

part 'action.g.dart';

@JsonSerializable()
class XAction {
  XAction(this.name, {this.group});

  String name;
  String group;

  // region json serialization.
  /// toJson is not required
  factory XAction.fromJson(Map<String, dynamic> json) =>
      _$XActionFromJson(json);
  // endregion
}

const String GROUP_CORE_ROUTE_KEY = "ACTION_GROUP_CORE_ROUTE";
const String GROUP_CORE_BASIC_KEY = "ACTION_GROUP_CORE_BASIC";
const String GROUP_CORE_MATERIAL_KEY = "ACTION_GROUP_CORE_MATERIAL";

const String ACTION_PUSH_PAGE = "ACTION_PUSH_PAGE";
const String ACTION_POP_PAGE = "ACTION_POP_PAGE";

const String ACTION_MATERIAL_SHOW_SNACKBAR = "ACTION_MATERIAL_SHOW_SNACKBAR";
const String ACTION_MATERIAL_SHOW_DIALOG = "ACTION_MATERIAL_SHOW_DIALOG";

// region core route
class ActionPushPage extends XAction {
  ActionPushPage() : super(ACTION_PUSH_PAGE, group: GROUP_CORE_ROUTE_KEY);
}

class ActionPopPage extends XAction {
  ActionPopPage() : super(ACTION_POP_PAGE, group: GROUP_CORE_ROUTE_KEY);
}
// endregion core route

class ActionMaterialShowSnackbar extends XAction {
  ActionMaterialShowSnackbar() : super(ACTION_MATERIAL_SHOW_SNACKBAR);
}

class ActionMaterialShowDialog extends XAction {
  ActionMaterialShowDialog() : super(ACTION_MATERIAL_SHOW_DIALOG);
}
