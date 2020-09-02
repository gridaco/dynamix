import 'package:flutter/widgets.dart';

class XActions {
  // fixme not a good patter. reference
  // region
  static BuildContext _context;

  static setApp(BuildContext context) {
    _context = context;
  }

  static BuildContext get context {
    return _context;
  }

  // endregion

  static Map<String, GlobalKey<NavigatorState>> _navigators =
      <String, GlobalKey<NavigatorState>>{};
}
