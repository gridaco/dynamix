import 'package:flutter/foundation.dart';

class Action{
  Action(this.name, {this.group});
  String name;
  String group;
}

const String GROUP_CORE_ROUTE_KEY = "ACTION_GROUP_CORE_ROUTE";
const String GROUP_CORE_BASIC_KEY = "ACTION_GROUP_CORE_BASIC";
const String GROUP_CORE_MATERIAL_KEY = "ACTION_GROUP_CORE_MATERIAL";

const String ACTION_PUSH_PAGE = "ACTION_PUSH_PAGE";
const String ACTION_POP_PAGE = "ACTION_POP_PAGE";

const String ACTION_MATERIAL_SHOW_SNACKBAR = "ACTION_MATERIAL_SHOW_SNACKBAR";
const String ACTION_MATERIAL_SHOW_DIALOG = "ACTION_MATERIAL_SHOW_DIALOG";


// region core route
class ActionPushPage extends Action{
  ActionPushPage(): super(ACTION_PUSH_PAGE, group: GROUP_CORE_ROUTE_KEY);
}

class ActionPopPage extends Action{
  ActionPopPage(): super(ACTION_POP_PAGE, group: GROUP_CORE_ROUTE_KEY);
}
// endregion core route


class ActionMaterialShowSnackbar extends Action{
  ActionMaterialShowSnackbar() : super(ACTION_MATERIAL_SHOW_SNACKBAR);

}

class ActionMaterialShowDialog extends Action{
  ActionMaterialShowDialog() : super(ACTION_MATERIAL_SHOW_DIALOG);

}