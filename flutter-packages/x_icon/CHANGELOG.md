## [0.0.1] - Initial release

## [0.1.0] - (in development)

RemoteIconData as factory or as `IconData`

```dart
// from
Icon(RemoteIconData.fromUri("~").icon);
// to
Icon(RemoteIconData.fromUri("~"));


// from
RemoteIcon(icon: RemoteIconData.fromUri("~").icon);

// to
RemoteIcon.fromUri("~");
```

## [0.0.4] - major updates

RemoteIconData -> XIconData
RemoteIcon -> XIcon

both supports fromJson

XIconData now extends from IconData, so you can use it like so. Icon(XIconData("uri"))

## [0.0.5] - flutter 2.0 support (null safety)
