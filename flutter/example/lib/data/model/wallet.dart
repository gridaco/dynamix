import 'package:flutter_remote_ui/flutter_remote_ui.dart';

class WalletLayout extends XLayout<WalletBody> {
  WalletLayout(this.body) : super(body: body);
  WalletBody body;
}

class WalletBody {
  WalletBody(this.title, this.desc, this.background, this.asset, this.action);

  XText title;
  XText desc;
  XImage background;
  XImage asset;
  Button action;
}
