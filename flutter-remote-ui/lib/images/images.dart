import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RemoteImage extends StatelessWidget {
  RemoteImage(
      {@required this.uri,
      @required this.remote,
      this.width,
      this.height,
      this.fit = BoxFit.contain,
      this.placeholderBuilder});

  final bool remote;
  final String uri;

  String get format {
    try {
      return this?.uri?.split(".")?.last?.toLowerCase();
    } catch (e) {
      return null;
    }
  }

  final double width;
  final double height;
  final BoxFit fit;
  final WidgetBuilder placeholderBuilder;

  factory RemoteImage.asset(String asset,
      {double width,
      double height,
      BoxFit fit = BoxFit.contain,
      WidgetBuilder placeholderBuilder}) {
    return RemoteImage(
      uri: asset,
      remote: false,
      width: width,
      height: height,
      fit: fit,
      placeholderBuilder: placeholderBuilder,
    );
  }

  factory RemoteImage.network(String url,
      {double width,
      double height,
      BoxFit fit = BoxFit.contain,
      WidgetBuilder placeholderBuilder}) {
    return RemoteImage(
        uri: url,
        remote: true,
        width: width,
        height: height,
        fit: fit,
        placeholderBuilder: placeholderBuilder);
  }

  @override
  Widget build(BuildContext context) {
    if (format == "svg") {
      if (remote) {
        return SvgPicture.network(
          uri,
          width: width,
          height: height,
          fit: fit,
          placeholderBuilder: placeholderBuilder,
        );
      } else {
        return SvgPicture.asset(uri,
            width: width,
            height: height,
            fit: fit,
            placeholderBuilder: placeholderBuilder);
      }
    }

    if (remote) {
      return Image.network(
        uri,
        width: width,
        height: height,
        fit: fit,
      );
    } else {
      return Image.asset(
        uri,
        width: width,
        height: height,
        fit: fit,
      );
    }
  }
}
