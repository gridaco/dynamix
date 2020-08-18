import 'package:flutter/material.dart';
import 'package:flutter_remote_ui/flutter_remote_ui.dart' as rui;

class SearchScreen extends StatefulWidget {
  static const routeName = "/demo/search";

  @override
  State<StatefulWidget> createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("search result"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSearchResults(),
        ],
      ),
    );
  }

  Widget buildSearchResults() {
    return ListView.builder(
      itemBuilder: (c, i) {
        return SearchResultRow(
          icon:
              Icon(rui.RemoteIconData.fromUri("material://Icons.person").icon),
          title: Text("data"),
          subtitle: Text("sub"),
          onTap: () {},
        );
      },
      itemCount: 12,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}

@rui.LayoutConvert("search-result-row")
class SearchResultRow extends StatelessWidget {
  final Widget title;
  final Widget subtitle;
  final Widget icon;
  final Function onTap;

  const SearchResultRow(
      {Key key, this.title, this.subtitle, this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: title,
      subtitle: subtitle,
    );
  }
}
