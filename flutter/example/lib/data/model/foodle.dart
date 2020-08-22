import 'package:flutter_remote_ui/flutter_remote_ui.dart' as rui;
class TruckItemLayout extends rui.XLayout<TruckItemBody>{
  TruckItemLayout({this.body}): super(body: body);
  TruckItemBody body;
}


class TruckItemBody {
  TruckItemBody({this.title, this.description, this.image, this.onTap});
  rui.XText title;
  rui.XText description;
  rui.XImage image;
  rui.XAction onTap;
}
