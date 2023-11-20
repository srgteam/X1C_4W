// SPDX-License-Identifier: Apache-2.0
import 'dart:async';
import 'dart:io';

import 'package:flutter_homescreen/vehicle-signals/viss_config.dart';
import 'package:flutter_homescreen/vehicle-signals/viss_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_homescreen/vehicle-signals/vss_providers.dart';

class VISServerConnectedWidget extends ConsumerStatefulWidget {
  const VISServerConnectedWidget(
      {Key? key, required this.client, required this.socket})
      : super(key: key);
  final WebSocket socket;
  final HttpClient client;

  @override
  ConsumerState<VISServerConnectedWidget> createState() =>
      _VISServerConnectedWidgetState();
}

class _VISServerConnectedWidgetState
    extends ConsumerState<VISServerConnectedWidget> {
  late Timer _timer;

  void _updateSocket() {
    ref.read(VISServerSocketProvider.notifier).update(widget.socket);
  }

  @override
  void initState() {
    super.initState();
    VISS.init(widget.socket, ref);
    Future.delayed(Duration.zero, () => _updateSocket());
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (widget.socket.readyState == 3) {
        ref.refresh(sockConnectprovider(widget.client));
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.socket.listen(
        (data) {
          VISS.parseData(ref, data);
        },
        onError: (e, stk) {
          print(e.toString());
          ref.refresh(sockConnectprovider(widget.client));
        },
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    widget.socket.close(786887, "Connection lost with server!");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
