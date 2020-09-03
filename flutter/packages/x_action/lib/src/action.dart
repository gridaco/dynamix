import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:x_action/src/handlers/handlers.dart';
import 'package:x_action/src/parser.dart';
import 'package:x_uri/x_uri.dart';

part 'action.g.dart';

abstract class XAction {
  String name;
  String group;
  Map<String, dynamic> data;

  XAction({this.name, this.group});

  factory XAction.fromUri(String uri) {
    return XActionUriParser.parse(uri);
  }

  invoke();
}

@JsonSerializable()
class XRouteAction extends XAction {
  XRouteAction({
    String name,
    String group,
    this.route,
  }) : super(name: name, group: group);

  String route;

  String get uri {
    return "${Schema.material}://$route";
  }

  // region json serialization.
  /// toJson is not required
  factory XRouteAction.fromJson(Map<String, dynamic> json) =>
      _$XRouteActionFromJson(json);

  // endregion

  factory XRouteAction.fromUri(String uri) {
    final _uri = Uri.parse(uri);
    print(_uri.scheme);
    print(_uri.path);
    return XRouteAction(route: _uri.path);
  }

  @override
  invoke() {
    RouteHandler.handle(this);
  }
}

class XCustomAction extends XAction {
  @override
  invoke() {
    throw UnimplementedError();
  }
}

const String GROUP_CORE_ROUTE_KEY = "ACTION_GROUP_CORE_ROUTE";
const String GROUP_CORE_BASIC_KEY = "ACTION_GROUP_CORE_BASIC";
const String GROUP_CORE_MATERIAL_KEY = "ACTION_GROUP_CORE_MATERIAL";

const String ACTION_PUSH_PAGE = "ACTION_PUSH_PAGE";
const String ACTION_POP_PAGE = "ACTION_POP_PAGE";

const String ACTION_MATERIAL_SHOW_SNACKBAR = "ACTION_MATERIAL_SHOW_SNACKBAR";
const String ACTION_MATERIAL_SHOW_DIALOG = "ACTION_MATERIAL_SHOW_DIALOG";

// region core route
class ActionPushPage extends XRouteAction {
  ActionPushPage() : super(name: ACTION_PUSH_PAGE, group: GROUP_CORE_ROUTE_KEY);
}

class ActionPopPage extends XRouteAction {
  ActionPopPage() : super(name: ACTION_POP_PAGE, group: GROUP_CORE_ROUTE_KEY);
}
// endregion core route

class ActionMaterialShowSnackbar extends XRouteAction {
  ActionMaterialShowSnackbar() : super(name: ACTION_MATERIAL_SHOW_SNACKBAR);
}

class ActionMaterialShowDialog extends XRouteAction {
  ActionMaterialShowDialog() : super(name: ACTION_MATERIAL_SHOW_DIALOG);
}
