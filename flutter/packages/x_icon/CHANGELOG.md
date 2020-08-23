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