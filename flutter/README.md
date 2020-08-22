# flutter_remote_ui [![](https://img.shields.io/badge/pub-latest-brightgreen)](https://pub.dev/packages/flutter_remote_ui)

remote ui client for flutter

## What is "remote-ui" ?

What is "remote-ui". why and when to use?

## Installation

```shell script
# https://pub.dev/packages/flutter_remote_ui
dependencies:
  flutter_remote_ui: latest
```

Remote-ui is a cross platform ui structure standard, so you can develop with more consistency, integrity, maintainability.



Here are key features of 'remote-ui'

* Realtime reflecting ui.
* Write once, run accross all platform. (with your favorite framework)
* All data & logic on serverside. Send only the ui data.
* Centerization of logics. Lesser code, easier to maintain.
* Native performance. (No performance affection.)



**Core concept of remote-ui is..**

pretty much every app in this world follows below steps.

1. app definition (business design). What we are going to make? Who is it for?
2. model definition (data schema design). What data should we be obtaining? what data should we provide to users?
3. ui design (actual interface design). How are we going to show our data on to the screen? How will our form look like?



## Is "remote-ui" for everyone?

☺️ No. you don't need to use remote ui for making your app.

Since we have a very small community, you will have less support and troubling while developing production level application.





## How does it work?

Looking inside foodle - an foodtruck app as an example.

The framework works with 3 layers.

* Data layer (data which holds the naked data. Think as DB)
* Layout Data layer (layout data which maps naked data to view)
* View layer (the ui that draws layout data as is)



**Data**

```dart
var truckData = TruckData(
    name: "gony's burger",
    image: "https://~.jpg",
    shortDescription: "since 1999");
```



**Widgets & Layout**
> Note. since flutter's widget and remote-ui's widget naming is identical, we choose to use the prefix token "X". e.g. XText is remote ui's text instance

```dart
var truckItemLayout = (TruckData data) => TruckItemLayout(
    body: TruckItemBody(
        title: RU.Text(data.name),
        description: RU.Text(data.shortDescription),
        image: RU.Image(data.image),
        onTap: RU.Action(null)));
```



**View**

```dart
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
  action.handle();
}

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
```

In this way, you can dynamically change what to show in the card. or even change the card type as you want. without any updates from the app.

you can decide which actoin to trigger when the card is tapped.

Theoretically, if all the scenarios are pre-defined. you won't ever have to update your app for the app update. It will magically happen via changing the configurations for the ui.



## How to contribute

this project is still under development, not beta ready.

If you like the concept. like what we are trying to accomplish. please feel free to contact us for contribution.

woojoo@softmarshmallow.com



©2020 Bridged design. development since 2019.9
