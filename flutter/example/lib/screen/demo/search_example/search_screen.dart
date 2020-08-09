import 'package:flutter/material.dart';

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
        title: Text("data"),
      ),
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
        return SearchResultRow();
      },
      itemCount: 12,
    );
  }
}

class SearchResultRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
