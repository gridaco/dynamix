import 'package:flutter_remote_ui/flutter_remote_ui.dart' as RU;
class TruckItemLayout extends RU.Layout<TruckItemBody>{
  TruckItemLayout({this.body}): super(body: body);
  TruckItemBody body;
}


class TruckItemBody {
  TruckItemBody({this.title, this.description, this.image, this.onTap});
  RU.Text title;
  RU.Text description;
  RU.Image image;
  RU.Action onTap;
}
