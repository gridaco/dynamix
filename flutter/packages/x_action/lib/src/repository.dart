import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class XActions {
  static Map<String, RouteBuilder> routes;

  static IXNavigator navigatorDelegate;

  static IXNavigator get to {
    if (navigatorDelegate == null) {
      assert(_navigators.containsKey('app') == true,
      '''Add Modular.navigatorKey in your MaterialApp;

      return MaterialApp(
        navigatorKey: Modular.navigatorKey,
        ...


      ''');
    }
    return navigatorDelegate ??
        XNavigator(_navigators['app'].currentState);
  }

  static Map<String, GlobalKey<NavigatorState>> _navigators =
      <String, GlobalKey<NavigatorState>>{};

  static List<String> currentModule = <String>[];

  static GlobalKey<NavigatorState> get navigatorKey {
    if (!_navigators.containsKey('app')) {
      _navigators.addAll({'app': GlobalKey<NavigatorState>()});
      if (!currentModule.contains("app")) {
        currentModule.add("app");
      }
    }
    return _navigators['app'];
  }
}





abstract class IXNavigator {
  NavigatorState get navigator;

  Future showDialog({
    Widget child,
    WidgetBuilder builder,
    bool barrierDismissible = true,
  });

  /// Navigate to a new screen.
  ///
  /// ```
  /// Modular.to.push(MaterialPageRoute(builder: (context) => HomePage()),);
  /// ```
  Future<T> push<T extends Object>(Route<T> route);

  /// Pop the current route off the navigator and navigate to a route.
  ///
  /// ```
  /// Modular.to.popAndPushNamed('/home');
  /// ```
  /// You could give parameters
  /// ```
  /// Modular.to.popAndPushNamed('/home', arguments: 10);
  /// ```
  Future<T> popAndPushNamed<T extends Object, TO extends Object>(
      String routeName,
      {TO result,
        Object arguments});

  /// Navigate to a route.
  ///
  /// ```
  /// Modular.to.pushNamed('/home/10');
  /// ```
  /// You could give parameters
  /// ```
  /// Modular.to.pushNamed('/home', arguments: 10);
  /// ```
  Future<T> pushNamed<T extends Object>(String routeName, {Object arguments});


  Route<T> routeNamed<T>(String name, {args});
  /// Push the route with the given name onto the navigator that most tightly
  /// encloses the given context, and then remove all the previous routes until
  /// the predicate returns true.
  ///
  /// ```
  /// Modular.to.pushNamedAndRemoveUntil('/home/10', ModalRoute.withName('/'));
  /// ```
  /// You could give parameters
  /// ```
  /// Modular.to.pushNamedAndRemoveUntil('/home', ModalRoute.withName('/'), arguments: 10);
  /// ```
  Future<T> pushNamedAndRemoveUntil<T extends Object>(
      String newRouteName, bool Function(Route<dynamic>) predicate,
      {Object arguments});

  ///Replace the current route of the navigator that most tightly encloses the
  ///given context by pushing the route named routeName and then disposing the
  ///previous route once the new route has finished animating in.
  ///
  /// ```
  /// Modular.to.pushReplacementNamed('/home/10');
  /// ```
  /// You could give parameters
  /// ```
  /// Modular.to.pushReplacementNamed('/home', arguments: 10);
  /// ```
  Future<T> pushReplacementNamed<T extends Object, TO extends Object>(
      String routeName,
      {TO result,
        Object arguments});

  ///Replace the current route of the navigator that most tightly encloses
  ///the given context by pushing the given route and then disposing
  ///the previous route once the new route has finished animating in.
  ///
  /// ```
  /// Modular.to.pushReplacement(
  ///   MaterialPageRoute(builder: (context) => HomePage())
  /// );
  /// ```
  Future<T> pushReplacement<T extends Object, TO extends Object>(
      Route<T> newRoute,
      {TO result});

  /// Removes the current Route from the stack of routes.
  ///
  /// ```
  /// Modular.to.pop();
  /// ```
  void pop<T extends Object>([T result]);

  /// The initial route cannot be popped off the navigator, which implies that
  /// this function returns true only if popping the navigator would not remove
  /// the initial route.
  ///
  /// ```
  /// Modular.to.canPop();
  /// ```
  bool canPop();

  ///Consults the current route's Route.willPop method, and acts accordingly,
  ///potentially popping the route as a result; returns whether the pop request
  ///should be considered handled.
  ///
  /// ```
  /// Modular.to.maybePop();
  /// ```
  Future<bool> maybePop<T extends Object>([T result]);

  ///Calls pop repeatedly on the navigator that most tightly encloses the given
  ///context until the predicate returns true.
  ///
  /// ```
  /// Modular.to.popUntil(ModalRoute.withName('/login'));
  /// ```
  void popUntil(bool Function(Route<dynamic>) predicate);
}




class XNavigator implements IXNavigator {
  final NavigatorState navigator;

  XNavigator(this.navigator);

  @override
  Future showDialog({
    @deprecated Widget child,
    @required WidgetBuilder builder,
    bool barrierDismissible = true,
  }) {
    return navigator.push(DialogRoute(
      pageBuilder: (buildContext, animation, secondaryAnimation) {
        final pageChild = child ?? Builder(builder: builder);
        return SafeArea(
          child: Builder(builder: (context) {
            return pageChild;
          }),
        );
      },
      barrierDismissible: barrierDismissible,
      //MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierLabel: "barier-label",
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
    ));
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }

  @override
  bool canPop() => navigator.canPop();

  @override
  Future<bool> maybePop<T extends Object>([T result]) =>
      navigator.maybePop(result);

  @override
  void pop<T extends Object>([T result]) => navigator.pop(result);

  @override
  Future<T> popAndPushNamed<T extends Object, TO extends Object>(
      String routeName,
      {TO result,
        Object arguments}) =>
      navigator.popAndPushNamed(
        routeName,
        result: result,
        arguments: arguments,
      );

  @override
  void popUntil(bool Function(Route) predicate) =>
      navigator.popUntil(predicate);

  @override
  Future<T> push<T extends Object>(Route<T> route) => navigator.push(route);

  @override
  Future<T> pushNamed<T extends Object>(String routeName, {Object arguments}) =>
      navigator.pushNamed(routeName, arguments: arguments);

  Route<T> routeNamed<T>(String name, {args}){
    return navigator.routeNamed(name, arguments: args);
  }

  @override
  Future<T> pushNamedAndRemoveUntil<T extends Object>(
      String newRouteName, bool Function(Route) predicate,
      {Object arguments}) =>
      navigator.pushNamedAndRemoveUntil(newRouteName, predicate,
          arguments: arguments);

  @override
  Future<T> pushReplacementNamed<T extends Object, TO extends Object>(
      String routeName,
      {TO result,
        Object arguments}) =>
      navigator.pushReplacementNamed(routeName,
          result: result, arguments: arguments);

  @override
  Future<T> pushReplacement<T extends Object, TO extends Object>(
      Route<T> newRoute,
      {TO result}) =>
      navigator.pushReplacement(newRoute, result: result);

}

class DialogRoute<T> extends PopupRoute<T> {
  DialogRoute({
    @required RoutePageBuilder pageBuilder,
    bool barrierDismissible = true,
    String barrierLabel,
    Color barrierColor = const Color(0x80000000),
    Duration transitionDuration = const Duration(milliseconds: 200),
    RouteTransitionsBuilder transitionBuilder,
    RouteSettings settings,
  })  : assert(barrierDismissible != null),
        _pageBuilder = pageBuilder,
        _barrierDismissible = barrierDismissible,
        _barrierLabel = barrierLabel,
        _barrierColor = barrierColor,
        _transitionDuration = transitionDuration,
        _transitionBuilder = transitionBuilder,
        super(settings: settings);

  final RoutePageBuilder _pageBuilder;

  @override
  bool get barrierDismissible => _barrierDismissible;
  final bool _barrierDismissible;

  @override
  String get barrierLabel => _barrierLabel;
  final String _barrierLabel;

  @override
  Color get barrierColor => _barrierColor;
  final Color _barrierColor;

  @override
  Duration get transitionDuration => _transitionDuration;
  final Duration _transitionDuration;

  final RouteTransitionsBuilder _transitionBuilder;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Semantics(
      child: _pageBuilder(context, animation, secondaryAnimation),
      scopesRoute: true,
      explicitChildNodes: true,
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (_transitionBuilder == null) {
      return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.linear,
          ),
          child: child);
    } // Some default transition
    return _transitionBuilder(context, animation, secondaryAnimation, child);
  }
}
