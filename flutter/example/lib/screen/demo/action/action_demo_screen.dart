import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:socket_io/socket_io.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ActionDemoScreen extends StatefulWidget {
  static const routeName = "/demo/action";

  @override
  State<StatefulWidget> createState() {
    return _ActionDemoScreenState();
  }
}

class _ActionDemoScreenState extends State<ActionDemoScreen>
    with AfterLayoutMixin {
  @override
  void initState() {
    super.initState();
    RpcRepository(context);
  }

  @override
  void afterFirstLayout(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("actions demo"),
      ),
    );
  }
}

class RpcRepository {
  final BuildContext context;

  RpcRepository(this.context) {
    _listenSocketNewsEvents();
  }

  static IO.Socket _socket;

  void _listenSocketNewsEvents() {
    _socket = IO.io('ws://localhost:3001/client', <String, dynamic>{
      'transports': ['websocket'],
    });
    // region life cycle
    _socket.on('connect', (_) {
      print("socket io client connected");
    });
    _socket.on('connecting', (data) => print("connecting"));
    _socket.on('reconnect', (data) => print("reconnect"));
    _socket.on('reconnect_attempt', (data) => print("reconnect_attempt"));
    _socket.on('reconnect_failed', (data) => print("reconnect_failed"));
    _socket.on('reconnect_error', (data) => print("reconnect_error"));
    _socket.on('reconnecting', (data) => print("reconnecting"));
    // endregion life cycle

    _socket.on("news", (event) {
      print(event);
      showDialog(
          context: context,
          builder: (c) {
            return AlertDialog(
              title: Text("remotely loaded dialog"),
              content: Text("press close button to dismiss"),
            );
          });
    });
  }
}
