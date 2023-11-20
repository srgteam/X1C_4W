// SPDX-License-Identifier: Apache-2.0
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yaml/yaml.dart';

import 'vehicle-signals/viss_connection_widget.dart';

class GetConfig extends ConsumerStatefulWidget {
  const GetConfig({Key? key, required this.client}) : super(key: key);
  final HttpClient client;

  @override
  ConsumerState<GetConfig> createState() => _GetConfigState();
}

class _GetConfigState extends ConsumerState<GetConfig> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final configStateProvider = ref.read(ConfigStateprovider.notifier);

      String configFilePath = '/etc/xdg/AGL/homescreen_config.yaml';

      final configFile = File(configFilePath);
      configFile.readAsString().then((content) {
        final dynamic yamlMap = loadYaml(content);
        configStateProvider.update(
          read: true,
          hostname: yamlMap['hostname'],
          port: yamlMap['port'],
          kuksaAuthToken: yamlMap['kuskaAuthToken'],
        );
      }).catchError((content) {
        configStateProvider.update(read: true);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final config = ref.watch(ConfigStateprovider);
    if (!config.read) {
      return Container(
          child: const Text("Reading configuration file!",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)));
    } else if (config.hostname == "" ||
        config.port == 0 ||
        config.kuksaAuthToken == "") {
      return Container(
          child: const Text("Invalid configuration file!",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)));
    }
    return VISServerConnectionWidget(client: widget.client);
  }
}

class Config {
  Config({
    required this.read,
    required this.hostname,
    required this.port,
    required this.kuksaAuthToken,
  });
  final bool read;
  final String hostname;
  final int port;
  final String kuksaAuthToken;

  Config copywith({
    bool? read,
    String? hostname,
    int? port,
    String? kuksaAuthToken,
  }) =>
      Config(
        read: read ?? this.read,
        hostname: hostname ?? this.hostname,
        port: port ?? this.port,
        kuksaAuthToken: kuksaAuthToken ?? this.kuksaAuthToken,
      );
}

final ConfigStateprovider = StateNotifierProvider<ConfigStateNotifier, Config>(
    (ref) => ConfigStateNotifier());

class ConfigStateNotifier extends StateNotifier<Config> {
  ConfigStateNotifier() : super(_initialValue);
  static final Config _initialValue = Config(
    read: false,
    hostname: "",
    port: 0,
    kuksaAuthToken: "",
  );
  void update({
    bool? read,
    String? hostname,
    int? port,
    String? kuksaAuthToken,
  }) {
    state = state.copywith(
      read: read,
      hostname: hostname,
      port: port,
      kuksaAuthToken: kuksaAuthToken,
    );
  }
}
