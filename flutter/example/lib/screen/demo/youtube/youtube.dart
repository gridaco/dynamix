import 'package:flutter/material.dart';
import 'package:flutter_remote_ui_example/screen/demo/youtube/video_detail.dart';
import 'package:dynamic/dynamic.dart';

class YoutubeDemo extends StatefulWidget {
  static const routeName = "demo/youtube";

  @override
  State<StatefulWidget> createState() => _YoutubeDemo();
}

class _YoutubeDemo extends State<YoutubeDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YouTube"),
      ),
      body: SingleChildScrollView(
        child: Column(children: _buildVideoItems()),
      ),
    );
  }

  List<Widget> _buildVideoItems() {
    return [
      YoutubeVideoItem(VideoItemData(
          videoThumbnail:
              "https://cdn.dribbble.com/users/59947/screenshots/9408058/media/0dd06dee6a596296e60cd58ee86c7e82.jpg",
          publisherThumbnail:
              "https://cdn.dribbble.com/users/14268/avatars/small/764193ea1bc7f0edf846eeda47048538.jpg?1549567039")),
      YoutubeVideoItem(VideoItemData(
          videoThumbnail:
              "https://cdn.dribbble.com/users/14268/screenshots/9394315/media/719b99855dee635c8c19b188bc7b65c1.png",
          publisherThumbnail:
              "https://cdn.dribbble.com/users/60166/avatars/small/411f676c38eea48e0c6382e6d250c9e3.jpg?1534485559")),
      YoutubeVideoItem(VideoItemData(
          videoThumbnail:
              "https://cdn.dribbble.com/users/14268/screenshots/9339110/shot-cropped-1578359158912.png",
          publisherThumbnail:
              "https://cdn.dribbble.com/users/1311712/avatars/small/2c04d79964fb0576b4011640c3d29ccc.png?1575251075")),
    ];
  }
}

class YoutubeVideoItem extends StatelessWidget {
  final VideoItemData data;

  YoutubeVideoItem(this.data);

  _moveToDetail(BuildContext context) {
    Navigator.of(context).pushNamed(VideoDetail.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 220,
                    child: Image.network(
                      data.videoThumbnail,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              onTap: () {
                _moveToDetail(context);
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(data.publisherThumbnail),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("title container",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(fontWeight: FontWeight.w800)),
                      Text("description container",
                          style: Theme.of(context).textTheme.bodyText2),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  child: Icon(Icons.more_vert),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class VideoItemData {
  VideoItemData(
      {this.videoThumbnail,
      this.publisherThumbnail,
      this.title,
      this.description,
      this.moreAction});

  String videoThumbnail;
  String publisherThumbnail;
  String title;
  String description;
  List<XAction> moreAction;
}
