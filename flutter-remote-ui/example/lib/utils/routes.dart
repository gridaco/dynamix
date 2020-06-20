import 'package:flutter/material.dart';
import 'package:flutter_remote_ui_example/main.dart';
import 'package:flutter_remote_ui_example/screen/demo/foodle/foodle.dart';
import 'package:flutter_remote_ui_example/screen/demo/foodle/truck.dart';
import 'package:flutter_remote_ui_example/screen/demo/stile/stile_demo.dart';
import 'package:flutter_remote_ui_example/screen/demo/youtube/video_detail.dart';
import 'package:flutter_remote_ui_example/screen/demo/instagram/instagram.dart';
import 'package:flutter_remote_ui_example/screen/demo/youtube/youtube.dart';
import 'package:flutter_remote_ui_example/screen/wallet_screen.dart';

buildRoute(BuildContext context) {
  return {
    MyHomePage.routeName: (context) => MyHomePage(),
    WalletDemo.routeName: (context) => WalletDemo(),
    YoutubeDemo.routeName: (context) => YoutubeDemo(),
    VideoDetail.routeName: (context) => VideoDetail(),
    InstagramDemo.routeName: (context) => InstagramDemo(),
    Foodle.routeName: (context) => Foodle(),
    Truck.routeName: (context) => Truck(),
    StileDemo.routeName: (context) => StileDemo(),
  };
}
