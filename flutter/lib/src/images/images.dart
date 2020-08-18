import 'package:flutter/material.dart';
import 'package:flutter_remote_icon/flutter_remote_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RemoteImage extends StatelessWidget {
  final bool remote;
  final String uri;

  /// if override is provided, it overrides every thing and draws the icon instead of image.
  final Widget overrideWidget;

  String get format {
    try {
      return this?.uri?.split(".")?.last?.toLowerCase();
    } catch (e) {
      return null;
    }
  }

  bool get hasOverride {
    return overrideWidget != null;
  }

  final double width;
  final double height;
  final BoxFit fit;
  final WidgetBuilder placeholderBuilder;

  RemoteImage(
      {@required this.uri,
      @required this.remote,
      this.width,
      this.height,
      this.fit = BoxFit.contain,
      this.placeholderBuilder,
      this.overrideWidget});

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

  factory RemoteImage.icon(
    String icon, {
    double width,
    double height,
  }) {
    return RemoteImage(
      uri: null,
      remote: true,
      width: width,
      height: height,
      overrideWidget:
          RemoteIcon(RemoteIconData(uri: icon, type: RemoteIconType.AUTOMATIC)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (hasOverride) {
      return overrideWidget;
    }
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
