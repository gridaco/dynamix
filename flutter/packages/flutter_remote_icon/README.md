# flutter-remote-icon [![](https://img.shields.io/badge/pub-latest-brightgreen)](https://pub.dev/packages/flutter_remote_icon)

> general remote icon loader for flutter. (this is part of bridged's [remote-ui](https://github.com/softmarshmallow/remote-ui) project)

## Installation
```yaml
dependencies:
  flutter_remote_icon: latest
```

* loading native icons (IconData)
* loading remote icon (svg, png) into `Icon()`
* loading packaged (local) asset as Icon
* loading packaged (local) font as Icon

```dart
Widget buildRemoteIcon(){
  // var remoteIconData = new RemoteIconData(Icons.add); // -> native material icons  
  // var remoteIconData = new RemoteIconData("https://example.com/svg.svg");  // -> loading remote svg
  // var remoteIconData = new RemoteIconData("assets/icons/add.png"); // ->
  // var remoteIconData = new RemoteIconData(""); // -> (requires pre-usage definition)
  var remoteIconData = new RemoteIconData();
  return RemoteIcon(icon: remoteIconData, color: Colors.black);
}
```

1. "local://assets/~"
2.  "http://~"
3.  "https://~"
4.  "material://icons.name"



## register custom font icon schema


## generate icons mapping for your own font IconData

```dart
// your font based IconData class
class AwesomeIcons{
  // ...
  IconData add_awesome;
  IconData person_awesome;
  // ...
}
```

> for using font as a icon please read [this blog](https://medium.com/flutterpub/how-to-use-custom-icons-in-flutter-834a079d977)