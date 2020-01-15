// ignore: implementation_imports
import 'package:flutter_remote_ui/src/data/model/index.dart' as RU;

class WalletLayout extends RU.Layout<WalletData>{
  WalletLayout(this.body): super();
  WalletData body;
}


class WalletData {
  WalletData(this.title, this.desc, this.background, this.asset,
      this.action);
  RU.Text title;
  RU.Text desc;
  RU.Image background;
  RU.Image asset;
  RU.Button action;
}
