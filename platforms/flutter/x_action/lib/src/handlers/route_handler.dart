import 'package:x_action/src/action.dart';
import 'package:x_action/src/repository.dart';
import 'package:x_action/x_action.dart';

class RouteHandler {
  static handle(XRouteAction action) {
    // todo use custom built route handler
//    Modular.to.pushNamed(action.route);
//    Modular.to.pushNamed("/second");

    bool fullscreenDialog = action.presenter == "fullscreendialog";
    XActions.to.pushNamed(action.route!);

    final a = XActions.to.routeNamed(action.route!);

    print(a);
    XActions.to.push<Object>(a as dynamic);
    // showDialog(context: null)
    // showBottomSheet(context: null, builder: null)
    // showModalBottomSheet(context: null, builder: null)
    // Navigator.of(context).pushNamed(route)
  }
}
