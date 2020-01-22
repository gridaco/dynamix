import 'package:flutter_remote_ui_example/data/model/foodle.dart';
import 'package:flutter_remote_ui/models.dart' as RU;
import 'package:flutter_remote_ui_example/screen/demo/foodle/models.dart';
import 'package:flutter/material.dart';

var truckData = TruckData(
    name: "gony's burger",
    image:
        "https://www.canva.com/learn/wp-content/uploads/2018/03/The-Perfect-Snack-YouTube-Thumbnail-tb-800x0.jpg",
    shortDescription: "since 1999");

var truckItemLayout = (TruckData data) => TruckItemLayout(
    body: TruckItemBody(
        title: RU.Text(content: data.name),
        description: RU.Text(content: data.shortDescription),
        image: RU.Image(src: data.image),
        onTap: RU.Action()));

var truckItemView =
    (BuildContext context, TruckItemLayout layout) => GestureDetector(
        onTap: () {
          /*handle action here*/
        },
        child: Container(
          padding: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new ClipRRect(
                borderRadius: new BorderRadius.circular(2.0),
                child: Image.network(
                  layout.body.image.src,
                  height: 100.0,
                  width: 140.0,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                layout.body.title.content,
                style: Theme.of(context).textTheme.body2,
              ),
              Text(layout.body.description.content,
                  style: Theme.of(context).textTheme.overline),
            ],
          ),
        ));
