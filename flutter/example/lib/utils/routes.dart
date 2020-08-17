import 'package:flutter/material.dart';
import 'package:flutter_remote_ui_example/main.dart';
import 'package:flutter_remote_ui_example/screen/demo/foodle/foodle.dart';
import 'package:flutter_remote_ui_example/screen/demo/foodle/truck.dart';
import 'package:flutter_remote_ui_example/screen/demo/search_example/search_screen.dart';
import 'package:flutter_remote_ui_example/screen/demo/stile/stile_demo.dart';
import 'package:flutter_remote_ui_example/screen/demo/timeline/timeline_demo_screen.dart';
import 'package:flutter_remote_ui_example/screen/demo/youtube/video_detail.dart';
import 'package:flutter_remote_ui_example/screen/demo/instagram/instagram.dart';
import 'package:flutter_remote_ui_example/screen/demo/youtube/youtube.dart';
import 'package:flutter_remote_ui_example/screen/icons_demo/icons_demo_screen.dart';
import 'package:flutter_remote_ui_example/screen/wallet_screen.dart';


buildRoute(BuildContext context) {
  return {
    DemoHomePage.routeName: (context) => DemoHomePage(),
    IconsDemoScreen.routeName: (context) => IconsDemoScreen(),
    WalletDemo.routeName: (context) => WalletDemo(),
    YoutubeDemo.routeName: (context) => YoutubeDemo(),
    VideoDetail.routeName: (context) => VideoDetail(),
    InstagramDemo.routeName: (context) => InstagramDemo(),
    Foodle.routeName: (context) => Foodle(),
    Truck.routeName: (context) => Truck(),
    StileDemo.routeName: (context) => StileDemo(),
    SearchScreen.routeName: (context) => SearchScreen(),
    TimelineDemoScreen.routeName: (context) => TimelineDemoScreen(),
  };
}
