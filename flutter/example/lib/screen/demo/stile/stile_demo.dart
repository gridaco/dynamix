import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:math';

class StileDemo extends StatefulWidget {
  static const routeName = "/demo/stile";

  @override
  _StileDemoState createState() => _StileDemoState();
}

class _StileDemoState extends State<StileDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("stile demo"),
      ),
      body: _buildBody(),
    );
  }

  MovieCardLayoutVariants layout = MovieCardLayoutVariants.Portrait1;

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        OutlineButton(
          onPressed: () {
            setState(() {
              layout = getRandomVariant();
            });
          },
          child: Text("stile it !!"),
        ),
        MovieCard(
          layout: layout,
        ),
      ],
    );
  }
}

enum MovieCardLayoutVariants { Portrait1, Portrait2, Landscape2 }

MovieCardLayoutVariants getRandomVariant() {
  Random rnd = new Random();
  final list = MovieCardLayoutVariants.values;
  var element = list[rnd.nextInt(list.length)];
  return element;
}

class MovieCard extends StatelessWidget {
  final MovieCardLayoutVariants layout;
  static const padding = EdgeInsets.all(8);

  const MovieCard({this.layout = MovieCardLayoutVariants.Portrait1});

  @override
  Widget build(BuildContext context) {
    return buildLayout(context);
  }

  Widget buildLayout(BuildContext context) {
    Widget body;
    switch (layout) {
      case MovieCardLayoutVariants.Portrait1:
        body = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            thumbnail(context),
            Container(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  title(context),
                  genre(context),
                  price(context),
                  rating(context)
                ],
              ),
            )
          ],
        );
        break;
      case MovieCardLayoutVariants.Portrait2:
        body = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: padding,
              child: title(context),
            ),
            thumbnail(context),
            Container(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  genre(context),
                  price(context),
                  rating(context)
                ],
              ),
            )
          ],
        );
        break;
      case MovieCardLayoutVariants.Landscape2:
        body = Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            thumbnail(context, height: 120, width: 120),
            Container(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  title(context),
                  genre(context),
                  price(context),
                  rating(context)
                ],
              ),
            )
          ],
        );
        break;
    }

    return Card(
      child: Container(child: body),
    );
  }

  Widget thumbnail(BuildContext context, {double height, double width}) {
    return Image.network(
      DUMMY_POTTER_COVER,
      height: height ?? 160,
      width: width,
      fit: BoxFit.cover,
    );
  }

  Widget title(BuildContext context) {
    return Text(
      "Harry Potter and the\nPhilosopher's Stone",
      style: Theme.of(context).textTheme.subtitle1,
    );
  }

  Widget genre(BuildContext context) {
    return Text(
      "Fantasy",
      style: Theme.of(context).textTheme.caption,
    );
  }

  Widget price(BuildContext context) {
    return Text(
      "\$5.99",
      style: Theme.of(context).textTheme.headline5,
    );
  }

  Widget rating(BuildContext context) {
    return RatingBarIndicator(
      rating: 4.5,
      direction: Axis.horizontal,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 0),
      itemSize: 24.0,
      itemBuilder: (context, _) => Container(
        padding: EdgeInsets.all(0),
        child: Icon(
          Icons.star,
          color: Colors.black,
        ),
      ),
    );
  }
}

const DUMMY_POTTER_COVER =
    "https://images.justwatch.com/backdrop/52767382/s1440/harry-potter-and-the-prisoner-of-azkaban";
