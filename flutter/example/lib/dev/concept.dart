import 'package:flutter_remote_ui_example/data/model/foodle.dart';
import 'package:flutter_remote_ui/flutter_remote_ui.dart' as RU;
import 'package:flutter_remote_ui_example/screen/demo/foodle/models.dart';
import 'package:flutter/material.dart';

var truckData = TruckData(
    name: "gony's burger",
    image:
        "https://www.canva.com/learn/wp-content/uploads/2018/03/The-Perfect-Snack-YouTube-Thumbnail-tb-800x0.jpg",
    shortDescription: "since 1999");

var truckItemLayout = (TruckData data) => TruckItemLayout(
    body: TruckItemBody(
        title: RU.Text(data.name),
        description: RU.Text(data.shortDescription),
        image: RU.Image(data.image),
        onTap: RU.Action(null)));


// region view segments
var titleText = (BuildContext context, RU.Text text) => Text(
  text.content,
  style: Theme.of(context).textTheme.body2,
);

var descriptionText = (BuildContext context, RU.Text text) => Text(
  text.content,
  style: Theme.of(context).textTheme.overline,
);

var coverImage = (RU.Image image) => Image.network(
  image.src,
  height: 100.0,
  width: 140.0,
  fit: BoxFit.cover,
);

Function onTapAction = (RU.Action action) => {
  // handle action
};
// endregion view segments

var truckItemView =
    (BuildContext context, TruckItemLayout layout) => GestureDetector(
        onTap: onTapAction(layout.body.onTap),
        child: Container(
          padding: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new ClipRRect(
                borderRadius: new BorderRadius.circular(2.0),
                child: coverImage(layout.body.image)
              ),
              titleText(context, layout.body.title),
              descriptionText(context, layout.body.description),
            ],
          ),
        ));
