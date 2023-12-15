import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget wrappedText(BuildContext context, Text text) {
  return DefaultTextStyle(
    style: Theme.of(context).textTheme.headline6,
    child: text,
  );
}

Widget themeStyleText(BuildContext context, String text) {
  return Text(
    text,
    style: Theme.of(context).textTheme.headline6,
  );
}

Widget customStyleText(BuildContext context, String text) {
  return Text(
    text,
    style: TextStyle(

    ),
  );
}
