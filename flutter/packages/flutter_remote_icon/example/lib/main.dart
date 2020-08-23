import 'package:flutter/material.dart';
import 'package:flutter_remote_icon/flutter_remote_icon.dart';
import 'package:flutter_remote_icon_example/custom_icons.dart';

void main() {
  XIcons.register("custom", CustomIcons.mapping);
  runApp(ExampleApp());
}

class ExampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Remote Icon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Remote Icon'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(child: buildBody(),),
    );
  }

  String dynamicUri = "material://Icons.title";
  String error;

  final double size = 112.0;

  Widget dynamicIconsLoader() {
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          child: XIcon(
            XIconData.fromUri(dynamicUri),
            size: size,
          ),
          margin: EdgeInsets.all(24),
        ),
        Container(
          child: buildInput(),
          padding: EdgeInsets.all(24),
        ),
        if (error != null)
          Text(
            error,
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(color: Theme.of(context).errorColor),
          )
      ],
    );
  }

  Widget buildInput() {
    return TextField(
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline5,
      decoration: InputDecoration(
          border: InputBorder.none, hintText: "enter icon name"),
      onSubmitted: (s) {
        if (XIcons.validate(s)) {
          setState(() {
            dynamicUri = s;
            error = null;
          });
        } else {
          print("invalid uri");
          setState(() {
            error = "invalid uri";
          });
        }
      },
    );
  }

  final List<String> demoUri = [
    "custom://CustomIcons.add",
    "material://Icons.person",
    "material://Icons.pause",
    "material://Icons.star",
  ];

  Widget buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [dynamicIconsLoader(), dynamicDemo()],
    );
  }

  Widget dynamicDemo() {
    return ListView.builder(
      itemBuilder: (c, i) {
        var uri = demoUri[i];
        return Container(
          padding: EdgeInsets.all(12),
          child: customIcon(uri),
        );
      },
      itemCount: demoUri.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  Widget customIcon(String uri) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '''RemoteIcon(
        RemoteIconData.fromUri("$uri")
)''',
          style: Theme.of(context)
              .textTheme
              .caption
              .copyWith(color: Theme.of(context).primaryColor),
        ),
        SizedBox(
          height: 8,
        ),
        Icon(XIconData.fromUri(uri))
      ],
    );
  }
}
