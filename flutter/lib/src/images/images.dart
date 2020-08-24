import 'package:flutter/material.dart';
import 'package:x_icon/x_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// [XImageMode] indicates the mode of the [XImage].
enum XImageMode{
  REMOTE,
  ASSET,
  FILE
}

class XImage extends StatelessWidget {
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

  XImage(
      {@required this.uri,
      @required this.remote,
      this.width,
      this.height,
      this.fit = BoxFit.contain,
      this.placeholderBuilder,
      this.overrideWidget});

  factory XImage.asset(String asset,
      {double width,
      double height,
      BoxFit fit = BoxFit.contain,
      WidgetBuilder placeholderBuilder}) {
    return XImage(
      uri: asset,
      remote: false,
      width: width,
      height: height,
      fit: fit,
      placeholderBuilder: placeholderBuilder,
    );
  }

  factory XImage.network(String url,
      {double width,
      double height,
      BoxFit fit = BoxFit.contain,
      WidgetBuilder placeholderBuilder}) {
    return XImage(
        uri: url,
        remote: true,
        width: width,
        height: height,
        fit: fit,
        placeholderBuilder: placeholderBuilder);
  }

  factory XImage.icon(
    String icon, {
    double width,
    double height,
  }) {
    return XImage(
      uri: null,
      remote: true,
      width: width,
      height: height,
      overrideWidget:
          XIcon(XIconData(icon)),
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
