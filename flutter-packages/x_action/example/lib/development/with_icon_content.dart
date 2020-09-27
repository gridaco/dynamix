import 'package:dynamic/dynamic.dart';
import 'package:flutter/material.dart';

class ModalWithIconContent extends StatelessWidget {
  final XIconData icon;
  final String title;
  final XButton action;

  const ModalWithIconContent(
      {Key key,
      @required this.icon,
      @required this.title,
      @required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "title",
            style: Theme.of(context).textTheme.headline5,
          ),
          Expanded(
            child: Center(
              child: Icon(Icons.check_circle_outline, size: 64),
            ),
          ),
          Container(
              width: double.maxFinite,
              child: FlatButton(
                height: 64,
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onPressed: () {},
                child: Text(
                  "ok",
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}
