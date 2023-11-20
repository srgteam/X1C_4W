// SPDX-License-Identifier: Apache-2.0
class VSSPath {
  static const String vehicleSpeed = "Vehicle.Speed";

  static const String vehicleEngineRPM =
      "Vehicle.Powertrain.CombustionEngine.Speed";

  static const String vehicleFuelLevel = "Vehicle.Powertrain.FuelSystem.Level";

  static const String vehicleInsideTemperature =
      "Vehicle.Cabin.HVAC.AmbientAirTemperature";

  static const String vehicleOutsideTemperature =
      "Vehicle.Exterior.AirTemperature";

  static const String vehicleFrontLeftTire =
      "Vehicle.Chassis.Axle.Row1.Wheel.Left.Tire.Pressure";

  static const String vehicleFrontRightTire =
      "Vehicle.Chassis.Axle.Row1.Wheel.Right.Tire.Pressure";

  static const String vehicleRearLeftTire =
      "Vehicle.Chassis.Axle.Row2.Wheel.Left.Tire.Pressure";

  static const String vehicleRearRightTire =
      "Vehicle.Chassis.Axle.Row2.Wheel.Right.Tire.Pressure";

  static const String vehicleIsChildLockActiveLeft =
      "Vehicle.Cabin.Door.Row2.Left.IsChildLockActive";

  static const String vehicleIsChildLockActiveRight =
      "Vehicle.Cabin.Door.Row2.Right.IsChildLockActive";

  static const String vehicleCurrentLongitude =
      "Vehicle.CurrentLocation.Longitude";

  static const String vehicleCurrentLatitude =
      "Vehicle.CurrentLocation.Latitude";

  static const String vehicleFuelRate = "Vehicle.OBD.FuelRate";

  static const String vehicleMediaVolume =
      "Vehicle.Cabin.Infotainment.Media.Volume";
}
