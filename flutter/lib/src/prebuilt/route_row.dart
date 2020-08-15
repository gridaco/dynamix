import 'package:flutter/material.dart';

class RouteRow extends StatelessWidget {
  final Widget avatar;
  final Widget title;
  final Widget subtitle;
  final Widget trailing;
  final String route;

  const RouteRow(
      {Key key,
      this.avatar,
      @required this.title,
      this.subtitle,
      this.trailing,
      @required this.route})
      : assert(title != null && route != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: avatar,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
    );
  }
}
