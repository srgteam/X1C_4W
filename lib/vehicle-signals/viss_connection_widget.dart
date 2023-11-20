// SPDX-License-Identifier: Apache-2.0
import 'dart:io';
import 'package:flutter_homescreen/vehicle-signals/viss_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'viss_connected_widget.dart';

class VISServerConnectionWidget extends ConsumerWidget {
  VISServerConnectionWidget({Key? key, required this.client}) : super(key: key);
  final HttpClient client;
  late WebSocket socket;

  @override
  Widget build(BuildContext context, ref) {
    final sockConnect = ref.watch(sockConnectprovider(client));

    return sockConnect.when(
        data: (socket) {
          this.socket = socket;
          this.socket.pingInterval = const Duration(seconds: 2);
          return VISServerConnectedWidget(client: client, socket: this.socket);
        },
        error: (e, stk) {
          print(e);
          ref.refresh(sockConnectprovider(client));
          return Container(
              child: const Text('Connection Error',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)));
        },
        loading: () => Container(
            child: Text('Connected',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))));
  }
}
