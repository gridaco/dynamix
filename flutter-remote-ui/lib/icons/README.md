# flutter-remote-ui-icons

general remote icon loader for flutter

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