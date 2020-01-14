import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoDetail extends StatefulWidget {
  static const routeName = "demo/youtube/detail";

  @override
  State<StatefulWidget> createState() => _VideoDetail();
}

class _VideoDetail extends State<VideoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("detail"),),
      body: SingleChildScrollView(
        child: Column(children: _buildList()),
      ),
    );
  }

  List<Widget> _buildList() {
    return [
      SmallVideoItem(),
      SmallVideoItem(),
      SmallVideoItem(),
      SmallVideoItem(),
    ];
  }
}

class SmallVideoItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 120,
                height: 80,
                child: Image.network(
                  "https://cdn.dribbble.com/users/1311712/screenshots/8120949/media/d2afcefe2c88a16cf2c9d99fefca3012.png",
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "title holder",
                  style: Theme.of(context).textTheme.subhead,
                ),
                Text("descripton holder",
                    style: Theme.of(context).textTheme.body2),
              ],
            ),
          )
        ],
      ),
    );
  }
}
