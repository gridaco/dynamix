import 'package:flutter_remote_ui/flutter_remote_ui.dart' as RU;

class WalletLayout extends RU.Layout<WalletBody> {
  WalletLayout(this.body) : super(body: body);
  WalletBody body;
}

class WalletBody {
  WalletBody(this.title, this.desc, this.background, this.asset, this.action);

  RU.Text title;
  RU.Text desc;
  RU.Image background;
  RU.Image asset;
  RU.Button action;
}
