import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remote_ui_example/screen/demo/youtube/youtube.dart';
import 'package:flutter_remote_ui_example/screen/demo/instagram/instagram.dart';

WalletData dummy1 = WalletData(
    "신한 5051 (기본)",
    "해당카드로 모든 결제가 이루어집니다.",
    Colors.lightBlueAccent,
    "http://cdn.shopify.com/s/files/1/0396/0985/products/giftcardblack_1024x.png",
    "Next",
    InstagramDemo.routeName);
WalletData dummy2 = WalletData("신한 5052 (기본)", "해당카드로 모든 결제가 이루어집니다.",
    Colors.yellow.shade50, "", "Next", WalletDemo.routeName);
WalletData dummy3 = WalletData("신한 5053 (기본)", "해당카드로 모든 결제가 이루어집니다.",
    Colors.greenAccent.shade50, "", "Next", YoutubeDemo.routeName);
WalletData dummy4 = WalletData("신한 5054 (기본)", "해당카드로 모든 결제가 이루어집니다.",
    Colors.amber.shade50, "", "Next", InstagramDemo.routeName);

class WalletDemo extends StatefulWidget {
  static const routeName = "demo/wallet";

  @override
  State<StatefulWidget> createState() => _WalletDemoState();
}

class _WalletDemoState extends State<WalletDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wallet"),
        ),
        body: SingleChildScrollView(child: _buildContent()));
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        WalletItem(dummy1),
        WalletItem(dummy2),
        WalletItem(dummy3),
        WalletItem(dummy4),
      ],
    );
  }
}

class WalletItem extends StatelessWidget {
  WalletData data;
  BuildContext _context;

  WalletItem(WalletData data) {
    this.data = data;
  }

  _onPressed(String action) {
    Navigator.of(_context).pushNamed(action);
  }

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return Container(
      height: 220,
      child: Card(
          color: this.data.background,
          child: Stack(
            children: <Widget>[_buildFront(), _buildBack()],
          )),
    );
  }

  _buildBack() {
    return Align(
      alignment: AlignmentDirectional.bottomEnd,
      child: Image.network(this.data.assetUrl),
    );
  }

  _buildFront() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(this.data.title, style: Theme.of(_context).textTheme.headline1),
          Text(this.data.desc,
              style: Theme.of(_context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: Colors.grey)),
          Spacer(),
          RaisedButton(
            child: Text(this.data.buttonText),
            onPressed: () => _onPressed(this.data.buttonAction),
          )
        ],
      ),
    );
  }
}

class WalletData {
  WalletData(this.title, this.desc, this.background, this.assetUrl,
      this.buttonText, this.buttonAction);

  String title;
  String desc;
  Color background;
  String assetUrl;
  String buttonText;
  String buttonAction;
}
