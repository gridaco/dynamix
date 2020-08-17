import 'package:flutter/material.dart';
import 'package:flutter_remote_ui_example/screen/demo/foodle/foodle.dart';
import 'package:flutter_remote_ui_example/screen/demo/search_example/search_screen.dart';
import 'package:flutter_remote_ui_example/screen/demo/stile/stile_demo.dart';
import 'package:flutter_remote_ui_example/screen/demo/timeline/timeline_demo_screen.dart';
import 'package:flutter_remote_ui_example/screen/wallet_screen.dart';
import 'package:flutter_remote_ui_example/screen/demo/youtube/youtube.dart';
import 'package:flutter_remote_ui_example/utils/routes.dart';

import 'screen/icons_demo/icons_demo_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'remote-ui',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: DemoHomePage.routeName,
      routes: buildRoute(context),
    );
  }
}

const List<DemoData> demos = [
  const DemoData(title: "remote icons", route: IconsDemoScreen.routeName),
  const DemoData(
      title: "Foodle",
      route: Foodle.routeName,
      cover:
          'https://blog.luz.vc/wp-content/uploads/2019/01/food-truck-ou-food-container-2-696x356.jpg'),
  const DemoData(
      title: "Wallet",
      route: WalletDemo.routeName,
      cover:
          "https://www.loveworldplus.tv/wp-content/uploads/2019/04/bank.jpg"),
  const DemoData(
      title: "Youtube",
      route: YoutubeDemo.routeName,
      cover:
          "https://marketingland.com/wp-content/ml-loads/2017/08/youtube-logo-1920-800x450.jpg"),
  const DemoData(title: "Stile", route: StileDemo.routeName),
  const DemoData(title: "Timeline", route: TimelineDemoScreen.routeName),
  const DemoData(title: "Search results", route: SearchScreen.routeName),
];

class DemoHomePage extends StatefulWidget {
  static const routeName = "/home";

  @override
  _DemoHomePageState createState() => _DemoHomePageState();
}

class _DemoHomePageState extends State<DemoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("select demo"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [demoListBuilder()],
          ),
        ));
  }

  Widget demoListBuilder() {
    return ListView.builder(
      itemBuilder: (c, i) {
        var demo = demos[i];
        return DemoRow(
          title: Text(demo.title),
          cover: demo.cover != null
              ? Image.network(
                  demo.cover,
                  width: double.maxFinite,
                  fit: BoxFit.fitWidth,
                )
              : null,
          onTap: () {
            Navigator.of(context).pushNamed(demo.route);
          },
        );
      },
      itemCount: demos.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}

class DemoData {
  final String cover;
  final String title;
  final String route;

  const DemoData({this.cover, @required this.title, @required this.route});
}

class DemoRow extends StatelessWidget {
  final Function onTap;
  final Widget title;
  final Widget cover;

  const DemoRow({Key key, this.onTap, this.title, this.cover})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.maxFinite,
          height: 200,
          child: Stack(
            children: <Widget>[
              this.cover != null
                  ? this.cover
                  : Container(
                      color: Colors.blueAccent,
                    ),
              Positioned(left: 24, bottom: 24, child: _title(context))
            ],
          ),
        ));
  }

  Widget _title(BuildContext context) {
    return DefaultTextStyle(
      child: this.title,
      style:
          Theme.of(context).textTheme.headline2.copyWith(color: Colors.white),
    );
  }
}
