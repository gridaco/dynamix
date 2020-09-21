import 'package:dynamic/dynamic.dart';
import 'package:flutter/material.dart';

Widget sample() {
  return BasicTile(
    title: "title",
    description: "description",
    thumbnail: "temp-resources.bridged.xyz/project/assets/1.jpg",
  );
}

class BasicTile extends StatelessWidget {
  final String thumbnail;
  final String title;
  final String description;

  const BasicTile(
      {Key key,
      @required this.thumbnail,
      @required this.title,
      @required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: _buildShadow()),
      child: _buildBody(context),
    );
  }

  List<BoxShadow> _buildShadow() {
    return [
      BoxShadow(),
    ];
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        _buildThumbnail(context),
        _buildTitle(context),
        _buildDescription(context)
      ],
    );
  }

  Widget _buildThumbnail(BuildContext context) {
    return XImage.network(thumbnail);
  }

  Widget _buildTitle(BuildContext context) {
    return DefaultTextStyle(
        style: Theme.of(context).textTheme.headline6, child: Text(title));
  }

  Widget _buildDescription(BuildContext context) {
    return DefaultTextStyle(
        style: Theme.of(context).textTheme.headline6, child: Text(description));
  }
}
