import 'package:flutter_remote_ui/flutter_remote_ui.dart' as rui;

class WalletLayout extends rui.Layout<WalletBody> {
  WalletLayout(this.body) : super(body: body);
  WalletBody body;
}

class WalletBody {
  WalletBody(this.title, this.desc, this.background, this.asset, this.action);

  rui.Text title;
  rui.Text desc;
  rui.Image background;
  rui.Image asset;
  rui.Button action;
}
