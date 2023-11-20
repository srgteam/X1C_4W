// SPDX-License-Identifier: Apache-2.0
import 'dart:convert';
import 'dart:io';

import 'package:flutter_homescreen/vehicle-signals/vss_providers.dart';
import 'package:flutter_homescreen/vehicle-signals/vss_path.dart';
import 'package:flutter_homescreen/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VISS {
  static const requestId = "test-id";

  static void init(WebSocket socket, WidgetRef ref) {
    authorize(socket, ref);
    subscribe(socket, ref, VSSPath.vehicleMediaVolume);
  }

  static void update(WebSocket socket, WidgetRef ref) {
    get(socket, ref, VSSPath.vehicleMediaVolume);
  }

  static void authorize(WebSocket socket, WidgetRef ref) {
    final config = ref.read(ConfigStateprovider);

    Map<String, dynamic> map = {
      "action": "authorize",
      "tokens": config.kuksaAuthToken,
      "requestId": requestId
    };
    socket.add(jsonEncode(map));
  }

  static void get(WebSocket socket, WidgetRef ref, String path) {
    final config = ref.read(ConfigStateprovider);

    Map<String, dynamic> map = {
      "action": "get",
      "tokens": config.kuksaAuthToken,
      "path": path,
      "requestId": requestId
    };
    socket.add(jsonEncode(map));
  }

  static void set(WebSocket socket, WidgetRef ref, String path, String value) {
    final config = ref.read(ConfigStateprovider);
    Map<String, dynamic> map = {
      "action": "set",
      "tokens": config.kuksaAuthToken,
      "path": path,
      "requestId": requestId,
      "value": value
    };
    socket.add(jsonEncode(map));
  }

  static void subscribe(WebSocket socket, WidgetRef ref, String path) {
    final config = ref.read(ConfigStateprovider);

    Map<String, dynamic> map = {
      "action": "subscribe",
      "tokens": config.kuksaAuthToken,
      "path": path,
      "requestId": requestId
    };
    socket.add(jsonEncode(map));
  }

  static void parseData(WidgetRef ref, String data) {
    Map<String, dynamic> dataMap = jsonDecode(data);
    if (dataMap["action"] == "subscription" || dataMap["action"] == "get") {
      if (dataMap.containsKey("data")) {
        if ((dataMap["data"] as Map<String, dynamic>).containsKey("dp") &&
            (dataMap["data"] as Map<String, dynamic>).containsKey("path")) {
          String path = dataMap["data"]["path"];
          Map<String, dynamic> dp = dataMap["data"]["dp"];
          if (dp.containsKey("value")) {
            if (dp["value"] != "---") {
              switch (path) {
                case VSSPath.vehicleMediaVolume:
                  ref
                      .read(vehicleSignalMediaVolumeProvider.notifier)
                      .update(volume: dp["value"]);
                  break;
                case VSSPath.vehicleInsideTemperature:
                  ref
                      .read(vehicleSignalInsideTempProvider.notifier)
                      .update(temp: dp["value"]);
                  break;
                case VSSPath.vehicleOutsideTemperature:
                  ref
                      .read(vehicleSignalOutsideTempProvider.notifier)
                      .update(temp: dp["value"]);
                  break;
                default:
                  break;
              }
            } else {
              print("ERROR: Invalid VIS response, data not available");
            }
          } else {
            print("ERROR: Invalid VIS response, no 'value' key");
          }
        } else if ((!dataMap["data"] as Map<String, dynamic>)
            .containsKey("path")) {
          print("ERROR: Invalid VIS response, no 'path' key");
        } else if ((dataMap["data"] as Map<String, dynamic>)
            .containsKey("dp")) {
          print("ERROR: Invalid VIS response, no 'dp' key");
        }
      } else {
        print("ERROR: Invalid VIS response, no 'data' key");
      }
    }
  }
}
