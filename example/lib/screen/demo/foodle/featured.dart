import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_remote_ui_example/screen/demo/foodle/models.dart';
import 'package:flutter_remote_ui_example/screen/demo/foodle/truck.dart';

class FeaturedTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FeaturedTabState();
}

class _FeaturedTabState extends State<FeaturedTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[_buildSlider(), _buildListArea()],
      ),
    );
  }

  _buildSlider() {
    return CarouselSlider(
      aspectRatio: 16 / 9,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                  "https://www.canva.com/learn/wp-content/uploads/2018/03/The-Perfect-Snack-YouTube-Thumbnail-tb-800x0.jpg"),
            );
          },
        );
      }).toList(),
    );
  }

  _buildListArea() {
    return Column(
      children: <Widget>[
        _buildTruckListRow(),
        _buildTruckListRow(),
        _buildMenuListRow(),
      ],
    );
  }

  Widget _buildTruckListRow() {
    return Section(
        title: "내주변 푸드트럭 모음!",
        description: "옆거리에서 만나봐요",
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                TruckItem(),
                TruckItem(),
                TruckItem(),
              ],
            )));
  }


  Widget _buildMenuListRow() {
    List<Widget> list = [];
    menuList.forEach((d){
      list.add(MenuItem(d));
    });

    return Section(
        title: "인기 파스타 모음!",
        description: "토마토? 아니면 크림?",
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: list
            )));
  }
}

class Section extends StatelessWidget {
  Widget child;
  String title;
  String description;

  Section({@required this.child, this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  description,
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.subhead,
                ),
              ],
            ),
          ),
          Container(
            child: child,
          )
        ]);
  }
}

class TruckItem extends StatelessWidget {
  BuildContext _context;

  _moveToDetail() {
    Navigator.of(_context).pushNamed(Truck.routeName);
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return GestureDetector(
        onTap: _moveToDetail,
        child: Container(
          padding: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
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
              Text(
                "Hook and Ladder",
                style: Theme.of(context).textTheme.body2,
              ),
              Text("150m", style: Theme.of(context).textTheme.overline),
            ],
          ),
        ));
  }
}

class MenuItem extends StatelessWidget {
  BuildContext _context;
  MenuData data;
  MenuItem(this.data);

  _moveToDetail() {
    Navigator.of(_context).pushNamed(Truck.routeName);
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return GestureDetector(
        onTap: _moveToDetail,
        child: Container(
          width: 122.0,
          padding: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new ClipRRect(
                borderRadius: new BorderRadius.circular(2.0),
                child: Image.network(
                  data.image,
                  height: 170.0,
                  width: 122.0,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                data.name,
                style: Theme.of(context).textTheme.body2,
              ),
              Text("150m", style: Theme.of(context).textTheme.overline),
            ],
          ),
        ));
  }
}
