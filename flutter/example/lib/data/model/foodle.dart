import 'package:flutter_remote_ui/flutter_remote_ui.dart' as rui;
class TruckItemLayout extends rui.Layout<TruckItemBody>{
  TruckItemLayout({this.body}): super(body: body);
  TruckItemBody body;
}


class TruckItemBody {
  TruckItemBody({this.title, this.description, this.image, this.onTap});
  rui.Text title;
  rui.Text description;
  rui.Image image;
  rui.Action onTap;
}
