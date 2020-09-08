# flutter XIcon [![](https://img.shields.io/badge/pub-latest-brightgreen)](https://pub.dev/packages/x_icon) [![](https://img.shields.io/badge/generator-latest-brightgreen)](https://pub.dev/packages/x_icon_generator)

> What if you decided to load icon from server? But want to use local's font icons?
>
> "general remote icon loader for flutter." (this is part of bridged's [remote-ui](https://github.com/softmarshmallow/remote-ui) project)

![](./doc/remote-icon-demo.gif)


why not to use other lib such as [flutter_icons](https://github.com/flutter-studio/flutter-icons)?
1. they do not support custom icons
2. you cannot remotely load icons.
3. not compatitable with bridged's dynamic


> Flutter remote icon enables you to load material icons (`Icons.~`) or your custom icon (`CustomIcons.~`) or remotely fetched content (svg) to your icon widget via `uri`, wich can be dynamically configured, remotely loaded.

## Installation

```yaml
dependencies:
  x_icon: latest

dev_dependencies:
  x_icon_generator: latest
  build_runner: latest
```
> for more information about  [x_icon_generator](../x_icon_generator), please refer [here](../x_icon_generator)



## Usage

**supported usage**
* loading native icons (IconData)
* loading remote icon (svg, png) into `Icon()`
* loading packaged (local) asset as Icon
* loading packaged (local) font as Icon

**example**
```dart
Widget buildRemoteIcon(){
  // var remoteIconData = new XIconData(Icons.add); // -> flutter native material icons
  // var remoteIconData = new XIconData("material://Icons.add"); // -> native material icons remotely (dynamically)
  // var remoteIconData = new XIconData("https://example.com/svg.svg");  // -> loading remote svg
  // var remoteIconData = new XIconData("assets/icons/add.png"); // -> loading local assets
  // var remoteIconData = new XIconData("custom-namespace://CustomIcons.icon_name"); // -> (requires pre-usage definition)
  var remoteIconData = new XIconData();
  return XIcon(icon: remoteIconData, color: Colors.black);
}
```

[Full example available here](./example)

**supported icons**

0.  `Icons.add` (non dynamic usage)
1.  "local://assets/image.png"
2.  "http://example.com/image.png"
3.  "https://example.com/image.png"
4.  "material://icons.name"
5.  "custom-namespace://CustomIcons.icon_name"



## register custom font icon schema
```dart
void main() {
  XIcons.register("namespace", {
    "namespace://CustomIcons.icon_name": CustomIcons.icon_name
  });
  runApp(ExampleApp());
}
```

## generate icons mapping for your own custom font IconData

in your `custom_icons.dart`
```dart
// your font based IconData class
part 'custom_icons.g.dart';

@IconMapper("namespace")
class CustomIcons{
  // ...
  static const IconData add_awesome; // ~
  static const IconData person_awesome; // ~
  // ...

  Map<String, IconData> get mapping{
    return _CustomIconsMapping;
  }

  static IconData fromUri(String uri) => _$CustomIconsFromUri(uri);
}
```

and run `flutter pub build_runner build`

will generate `custom_icons.g.dart`
```dart
part of 'custom_icons.dart';

const _CustomIconsMapping = {
  "namespace://CustomIcons.add_awesome": CustomIcons.add_awesome,
  "namespace://CustomIcons.person_awesome": CustomIcons.person_awesome,
};

IconData _$CustomIconsFromUri(String uri){
  return _CustomIconsMapping;[uri];
}
```

next, you can register the namespace and mappings easily
```dart
void main() {
  // register mapping
  XIcons.register("namespace", CustomIcons.mapping);
  runApp(ExampleApp());
}

// and use it!
Widget buildDynamicIcon(){
  return XIcon(icon: RemoteIconData("namespace://CustomIcons.person_awesome"));
}
```

> for using font as a icon please read [this blog](https://medium.com/flutterpub/how-to-use-custom-icons-in-flutter-834a079d977)



## What problem does it solve?

- https://github.com/flutter/flutter/issues/16189
