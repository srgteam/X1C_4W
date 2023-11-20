import 'dart:io';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_homescreen/vehicle-signals/vss_providers.dart';
import 'package:flutter_homescreen/vehicle-signals/vss_path.dart';
import 'package:flutter_homescreen/vehicle-signals/viss_methods.dart';

class VolumeSlider extends ConsumerWidget {
  final Color thumbColor;
  final Color activeColor;
  final Color inactiveColor;
  final RestartableTimer? activityTimer;

  VolumeSlider(
      {Key? key,
      required this.thumbColor,
      required this.activeColor,
      required this.inactiveColor,
      required this.activityTimer})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signal = ref.watch(vehicleSignalMediaVolumeProvider);
    return Slider(
        thumbColor: thumbColor,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
        value: signal.volume.toDouble(),
        max: 100,
        label: "Volume",
        onChangeStart: (value) {
          activityTimer?.cancel();
        },
        onChangeEnd: (value) {
          activityTimer?.reset();
        },
        onChanged: (value) {
          ref
              .read(vehicleSignalMediaVolumeProvider.notifier)
              .update(volume: value.toInt());
          WebSocket? s = ref.read(VISServerSocketProvider).socket;
          if (s != null) {
            VISS.set(
                s, ref, VSSPath.vehicleMediaVolume, value.toInt().toString());
          }
        });
  }
}
