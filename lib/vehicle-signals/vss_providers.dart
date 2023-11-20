// SPDX-License-Identifier: Apache-2.0
//import 'dart:ffi';
import 'dart:io';
import 'package:meta/meta.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class VISServerSocket {
  const VISServerSocket({required this.socket});

  final WebSocket? socket;

  VISServerSocket copyWith({WebSocket? socket}) {
    return VISServerSocket(socket: socket ?? this.socket);
  }
}

class VISServerSocketNotifier extends StateNotifier<VISServerSocket> {
  VISServerSocketNotifier() : super(_initialValue);

  static final VISServerSocket _initialValue = VISServerSocket(socket: null);

  void update(WebSocket socket) {
    state = state.copyWith(socket: socket);
  }
}

final VISServerSocketProvider =
    StateNotifierProvider<VISServerSocketNotifier, VISServerSocket>((ref) {
  return VISServerSocketNotifier();
});

// Media Volume

@immutable
class VehicleSignalMediaVolume {
  const VehicleSignalMediaVolume({required this.volume});

  final int volume;

  VehicleSignalMediaVolume copyWith({int? volume}) {
    return VehicleSignalMediaVolume(volume: volume ?? this.volume);
  }
}

class VehicleSignalMediaVolumeNotifier
    extends StateNotifier<VehicleSignalMediaVolume> {
  VehicleSignalMediaVolumeNotifier() : super(_initialValue);

  static final VehicleSignalMediaVolume _initialValue =
      VehicleSignalMediaVolume(volume: 50);

  void update({int? volume}) {
    int? n = volume;
    if (n != null) {
      n = n.toUnsigned(8);
      if (n > 100) n = 100;
    }
    state = state.copyWith(volume: n);
  }
}

//final vehicleSignalMediaVolumeProvider = StateNotifierProvider<
//    VehicleSignalMediaVolumeNotifier, VehicleSignalMediaVolume>((ref) {
//  return VehicleSignalMediaVolumeNotifier();
//});

final vehicleSignalMediaVolumeProvider = StateNotifierProvider<
    VehicleSignalMediaVolumeNotifier,
    VehicleSignalMediaVolume>((ref) => VehicleSignalMediaVolumeNotifier());

// Inside Temperature

@immutable
class VehicleSignalInsideTemp {
  const VehicleSignalInsideTemp({required this.temp});

  final double temp;

  VehicleSignalInsideTemp copyWith({double? temp}) {
    return VehicleSignalInsideTemp(temp: temp ?? this.temp);
  }
}

class VehicleSignalInsideTempNotifier
    extends StateNotifier<VehicleSignalInsideTemp> {
  VehicleSignalInsideTempNotifier() : super(_initialValue);

  static final VehicleSignalInsideTemp _initialValue =
      VehicleSignalInsideTemp(temp: 25);

  void update({double? temp}) {
    state = state.copyWith(temp: temp);
  }
}

final vehicleSignalInsideTempProvider = StateNotifierProvider<
    VehicleSignalInsideTempNotifier, VehicleSignalInsideTemp>(
  (ref) => VehicleSignalInsideTempNotifier(),
);

// Outside Temperature

@immutable
class VehicleSignalOutsideTemp {
  const VehicleSignalOutsideTemp({required this.temp});

  final double temp;

  VehicleSignalOutsideTemp copyWith({double? temp}) {
    return VehicleSignalOutsideTemp(temp: temp ?? this.temp);
  }
}

class VehicleSignalOutsideTempNotifier
    extends StateNotifier<VehicleSignalOutsideTemp> {
  VehicleSignalOutsideTempNotifier() : super(_initialValue);

  static final VehicleSignalOutsideTemp _initialValue =
      VehicleSignalOutsideTemp(temp: 32);

  void update({double? temp}) {
    state = state.copyWith(temp: temp);
  }
}

final vehicleSignalOutsideTempProvider = StateNotifierProvider<
    VehicleSignalOutsideTempNotifier, VehicleSignalOutsideTemp>(
  (ref) => VehicleSignalOutsideTempNotifier(),
);
