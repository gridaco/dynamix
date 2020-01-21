import 'package:flutter/material.dart';

class FeaturedTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FeaturedTabState();
}

class _FeaturedTabState extends State<FeaturedTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildScrollListRow(),
          _buildScrollListRow(),
          _buildScrollListRow(),
          _buildScrollListRow(),
        ],
      ),
    ));
  }

  Widget _buildScrollListRow() {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("옆거리에서 만나봐요",  style: Theme.of(context).textTheme.caption,),
                Text("내주변 푸드트럭 모음!",  style: Theme.of(context).textTheme.subhead,),
              ],
            ),
          ),
          Container(
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      ScrollListItem(),
                      ScrollListItem(),
                      ScrollListItem(),
                    ],
                  )))
        ],
      );
  }
}

class ScrollListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new ClipRRect(
            borderRadius: new BorderRadius.circular(2.0),
            child: Image.network(
              "https://www.canva.com/learn/wp-content/uploads/2018/03/The-Perfect-Snack-YouTube-Thumbnail-tb-800x0.jpg",
              height: 100.0,
              width: 140.0,
              fit: BoxFit.cover,
            ),
          ),
          Text("Hook and Ladder", style: Theme.of(context).textTheme.body2,),
          Text("150m", style: Theme.of(context).textTheme.overline),
        ],
      ),
    );
  }
}
