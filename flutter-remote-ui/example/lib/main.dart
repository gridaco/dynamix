import 'package:flutter/material.dart';
import 'package:flutter_remote_ui_example/screen/demo/foodle/foodle.dart';
import 'package:flutter_remote_ui_example/screen/demo/stile/stile_demo.dart';
import 'package:flutter_remote_ui_example/screen/wallet_screen.dart';
import 'package:flutter_remote_ui_example/screen/demo/youtube/youtube.dart';
import 'package:flutter_remote_ui_example/utils/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyHomePage.routeName,
      routes: buildRoute(context),
    );
  }
}

class MyHomePage extends StatefulWidget {
  static const routeName = "/home";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("select demo"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DemoItem(
                title: "Foodle",
                route: Foodle.routeName,
                cover:
                    'https://blog.luz.vc/wp-content/uploads/2019/01/food-truck-ou-food-container-2-696x356.jpg',
              ),
              DemoItem(
                title: "Wallet",
                route: WalletDemo.routeName,
                cover:
                    "https://www.loveworldplus.tv/wp-content/uploads/2019/04/bank.jpg",
              ),
              DemoItem(
                  title: "Youtube",
                  route: YoutubeDemo.routeName,
                  cover:
                      "https://marketingland.com/wp-content/ml-loads/2017/08/youtube-logo-1920-800x450.jpg"),
              DemoItem(title: "Stile", route: StileDemo.routeName, cover: null)
            ],
          ),
        ));
  }
}

class DemoItem extends StatelessWidget {
  BuildContext _context;
  final String cover;
  final String title;
  final String route;

  DemoItem({this.cover, this.title, this.route});

  _onTap() {
    Navigator.of(_context).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return GestureDetector(
        onTap: _onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: Stack(
            children: <Widget>[
              this.cover != null
                  ? Image.network(
                      this.cover,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      color: Colors.blueAccent,
                    ),
              Positioned(
                left: 24,
                bottom: 24,
                child: Text(
                  this.title,
                  style: Theme.of(context)
                      .textTheme
                      .display2
                      .copyWith(color: Colors.white),
                ),
              )
            ],
          ),
        ));
  }
}
