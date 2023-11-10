import 'dart:convert';
import 'dart:developer';

void tryCatch(Function? f) {
  try {
    f?.call();
  } catch (e, stack) {
    log('$e');
    log('$stack');
  }
}

class FFConvert {
  FFConvert._();
  static T? Function<T extends Object?>(dynamic value) convert =
  <T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return json.decode(value.toString()) as T?;
  };
}

T? asT<T extends Object?>(dynamic value, [T? defaultValue]) {
  if (value is T) {
    return value;
  }
  try {
    if (value != null) {
      final String valueS = value.toString();
      if ('' is T) {
        return valueS as T;
      } else if (0 is T) {
        return int.parse(valueS) as T;
      } else if (0.0 is T) {
        return double.parse(valueS) as T;
      } else if (false is T) {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else {
        return FFConvert.convert<T>(value);
      }
    }
  } catch (e, stackTrace) {
    log('asT<$T>', error: e, stackTrace: stackTrace);
    //return defaultValue;
  }
  if ('' is T) {
    return '' as T;
  } else if (0 is T) {
    return 0 as T;
  } else if (0.0 is T) {
    return 0.0 as T;
  } else if (false is T) {
    return false as T;
  }
  return defaultValue;
}

class ObjectSubcribe886333 {
  ObjectSubcribe886333({
    required this.eventtime,
    required this.status,
  });

  factory ObjectSubcribe886333.fromJson(Map<String, dynamic> json) => ObjectSubcribe886333(
    eventtime:
    json.containsKey('eventtime') ? asT<double>(json['eventtime'])! : 0,
    status: json.containsKey('status')
        ? json['status'] == null
        ? null
        : Status60.fromJson(asT<Map<String, dynamic>>(json['status'])!)
        : null,
  );

  double eventtime;
  Status60? status;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'eventtime': eventtime,
    'status': status,
  };
}

class Status60 {
  Status60({
    required this.gcodeMove,
    required this.toolhead,
    required this.configfile,
    required this.extruder,
    required this.heaterBed,
    required this.fan,
    required this.idleTimeout,
    required this.virtualSdcard,
    required this.printStats,
    required this.displayStatus,
    required this.temperatureSensor8,
    required this.temperatureSensorA61450,
    required this.bedMesh,
  });

  factory Status60.fromJson(Map<String, dynamic> json) => Status60(
    gcodeMove: json.containsKey('gcode_move')
        ? json['gcode_move'] == null
        ? null
        : GcodeMove07.fromJson(
        asT<Map<String, dynamic>>(json['gcode_move'])!)
        : null,
    toolhead: json.containsKey('toolhead')
        ? json['toolhead'] == null
        ? null
        : Toolhead67.fromJson(
        asT<Map<String, dynamic>>(json['toolhead'])!)
        : null,
    configfile: json.containsKey('configfile')
        ? json['configfile'] == null
        ? null
        : Configfile84.fromJson(
        asT<Map<String, dynamic>>(json['configfile'])!)
        : null,
    extruder: json.containsKey('extruder')
        ? json['extruder'] == null
        ? null
        : Extruder04.fromJson(
        asT<Map<String, dynamic>>(json['extruder'])!)
        : null,
    heaterBed: json.containsKey('heater_bed')
        ? json['heater_bed'] == null
        ? null
        : HeaterBed28.fromJson(
        asT<Map<String, dynamic>>(json['heater_bed'])!)
        : null,
    fan: json.containsKey('fan')
        ? json['fan'] == null
        ? null
        : Fan91.fromJson(asT<Map<String, dynamic>>(json['fan'])!)
        : null,
    idleTimeout: json.containsKey('idle_timeout')
        ? json['idle_timeout'] == null
        ? null
        : IdleTimeout60.fromJson(
        asT<Map<String, dynamic>>(json['idle_timeout'])!)
        : null,
    virtualSdcard: json.containsKey('virtual_sdcard')
        ? json['virtual_sdcard'] == null
        ? null
        : VirtualSdcard31.fromJson(
        asT<Map<String, dynamic>>(json['virtual_sdcard'])!)
        : null,
    printStats: json.containsKey('print_stats')
        ? json['print_stats'] == null
        ? null
        : PrintStats13.fromJson(
        asT<Map<String, dynamic>>(json['print_stats'])!)
        : null,
    displayStatus: json.containsKey('display_status')
        ? json['display_status'] == null
        ? null
        : DisplayStatus48.fromJson(
        asT<Map<String, dynamic>>(json['display_status'])!)
        : null,
    temperatureSensor8: json.containsKey('temperature_sensor 怪兽8温度')
        ? json['temperature_sensor 怪兽8温度'] == null
        ? null
        : TemperatureSensor822.fromJson(asT<Map<String, dynamic>>(
        json['temperature_sensor 怪兽8温度'])!)
        : null,
    temperatureSensorA61450: json
        .containsKey('temperature_sensor A6-1450温度')
        ? json['temperature_sensor A6-1450温度'] == null
        ? null
        : TemperatureSensorA6145030.fromJson(asT<Map<String, dynamic>>(
        json['temperature_sensor A6-1450温度'])!)
        : null,
    bedMesh: json.containsKey('bed_mesh')
        ? json['bed_mesh'] == null
        ? null
        : BedMesh52.fromJson(
        asT<Map<String, dynamic>>(json['bed_mesh'])!)
        : null,
  );

  GcodeMove07? gcodeMove;
  Toolhead67? toolhead;
  Configfile84? configfile;
  Extruder04? extruder;
  HeaterBed28? heaterBed;
  Fan91? fan;
  IdleTimeout60? idleTimeout;
  VirtualSdcard31? virtualSdcard;
  PrintStats13? printStats;
  DisplayStatus48? displayStatus;
  TemperatureSensor822? temperatureSensor8;
  TemperatureSensorA6145030? temperatureSensorA61450;
  BedMesh52? bedMesh;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode_move': gcodeMove,
    'toolhead': toolhead,
    'configfile': configfile,
    'extruder': extruder,
    'heater_bed': heaterBed,
    'fan': fan,
    'idle_timeout': idleTimeout,
    'virtual_sdcard': virtualSdcard,
    'print_stats': printStats,
    'display_status': displayStatus,
    'temperature_sensor 怪兽8温度': temperatureSensor8,
    'temperature_sensor A6-1450温度': temperatureSensorA61450,
    'bed_mesh': bedMesh,
  };
}

class GcodeMove07 {
  GcodeMove07({
    required this.speedFactor,
    required this.speed,
    required this.extrudeFactor,
    required this.absoluteCoordinates,
    required this.absoluteExtrude,
    required this.homingOrigin,
    required this.position,
    required this.gcodePosition,
  });

  factory GcodeMove07.fromJson(Map<String, dynamic> json) {
    List<double>? homingOrigin =
    json['homing_origin'] is List ? <double>[] : null;
    if (homingOrigin != null) {
      for (final dynamic item in json['homing_origin']!) {
        if (item != null) {
          tryCatch(() {
            homingOrigin?.add(asT<double>(item)!);
          });
        }
      }
    }

    if (homingOrigin == null) {
      homingOrigin = <double>[];
    }

    List<double>? position = json['position'] is List ? <double>[] : null;
    if (position != null) {
      for (final dynamic item in json['position']!) {
        if (item != null) {
          tryCatch(() {
            position?.add(asT<double>(item)!);
          });
        }
      }
    }

    if (position == null) {
      position = <double>[];
    }

    List<double>? gcodePosition =
    json['gcode_position'] is List ? <double>[] : null;
    if (gcodePosition != null) {
      for (final dynamic item in json['gcode_position']!) {
        if (item != null) {
          tryCatch(() {
            gcodePosition?.add(asT<double>(item)!);
          });
        }
      }
    }

    if (gcodePosition == null) {
      gcodePosition = <double>[];
    }
    return GcodeMove07(
      speedFactor: json.containsKey('speed_factor')
          ? asT<double>(json['speed_factor'])!
          : 0,
      speed: json.containsKey('speed') ? asT<double>(json['speed'])! : 0,
      extrudeFactor: json.containsKey('extrude_factor')
          ? asT<double>(json['extrude_factor'])!
          : 0,
      absoluteCoordinates: json.containsKey('absolute_coordinates')
          ? asT<bool>(json['absolute_coordinates'])!
          : false,
      absoluteExtrude: json.containsKey('absolute_extrude')
          ? asT<bool>(json['absolute_extrude'])!
          : false,
      homingOrigin: homingOrigin,
      position: position,
      gcodePosition: gcodePosition,
    );
  }

  double speedFactor;
  double speed;
  double extrudeFactor;
  bool absoluteCoordinates;
  bool absoluteExtrude;
  List<double>? homingOrigin;
  List<double>? position;
  List<double>? gcodePosition;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'speed_factor': speedFactor,
    'speed': speed,
    'extrude_factor': extrudeFactor,
    'absolute_coordinates': absoluteCoordinates,
    'absolute_extrude': absoluteExtrude,
    'homing_origin': homingOrigin,
    'position': position,
    'gcode_position': gcodePosition,
  };
}

class Toolhead67 {
  Toolhead67({
    required this.homedAxes,
    required this.printTime,
    required this.estimatedPrintTime,
    required this.extruder,
    required this.position,
    required this.maxVelocity,
    required this.maxAccel,
    required this.maxAccelToDecel,
    required this.squareCornerVelocity,
  });

  factory Toolhead67.fromJson(Map<String, dynamic> json) {
    List<double>? position = json['position'] is List ? <double>[] : null;
    if (position != null) {
      for (final dynamic item in json['position']!) {
        if (item != null) {
          tryCatch(() {
            position?.add(asT<double>(item)!);
          });
        }
      }
    }

    if (position == null) {
      position = <double>[];
    }
    return Toolhead67(
      homedAxes: json.containsKey('homed_axes')
          ? asT<String>(json['homed_axes'])!
          : '',
      printTime:
      json.containsKey('print_time') ? asT<double>(json['print_time'])! : 0,
      estimatedPrintTime: json.containsKey('estimated_print_time')
          ? asT<double>(json['estimated_print_time'])!
          : 0,
      extruder:
      json.containsKey('extruder') ? asT<String>(json['extruder'])! : '',
      position: position,
      maxVelocity: json.containsKey('max_velocity')
          ? asT<double>(json['max_velocity'])!
          : 0,
      maxAccel:
      json.containsKey('max_accel') ? asT<double>(json['max_accel'])! : 0,
      maxAccelToDecel: json.containsKey('max_accel_to_decel')
          ? asT<double>(json['max_accel_to_decel'])!
          : 0,
      squareCornerVelocity: json.containsKey('square_corner_velocity')
          ? asT<double>(json['square_corner_velocity'])!
          : 0,
    );
  }

  String homedAxes;
  double printTime;
  double estimatedPrintTime;
  String extruder;
  List<double>? position;
  double maxVelocity;
  double maxAccel;
  double maxAccelToDecel;
  double squareCornerVelocity;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'homed_axes': homedAxes,
    'print_time': printTime,
    'estimated_print_time': estimatedPrintTime,
    'extruder': extruder,
    'position': position,
    'max_velocity': maxVelocity,
    'max_accel': maxAccel,
    'max_accel_to_decel': maxAccelToDecel,
    'square_corner_velocity': squareCornerVelocity,
  };
}

class Configfile84 {
  Configfile84({
    required this.config,
    required this.settings,
    required this.saveConfigPending,
  });

  factory Configfile84.fromJson(Map<String, dynamic> json) => Configfile84(
    config: json.containsKey('config')
        ? json['config'] == null
        ? null
        : Config75.fromJson(asT<Map<String, dynamic>>(json['config'])!)
        : null,
    settings: json.containsKey('settings')
        ? json['settings'] == null
        ? null
        : Settings41.fromJson(
        asT<Map<String, dynamic>>(json['settings'])!)
        : null,
    saveConfigPending: json.containsKey('save_config_pending')
        ? asT<bool>(json['save_config_pending'])!
        : false,
  );

  Config75? config;
  Settings41? settings;
  bool saveConfigPending;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'config': config,
    'settings': settings,
    'save_config_pending': saveConfigPending,
  };
}

class Config75 {
  Config75({
    required this.gcodeMacroUserVariables,
    this.respond,
    required this.gcodeMacroProbeVariables,
    required this.gcodeMacroKlickyCheckVariablesVersion,
    required this.gcodeMacroKlickydebug,
    required this.gcodeMacroExitPoint,
    required this.gcodeMacroEntryPoint,
    required this.gcodeMacroHomingVariables,
    required this.gcodeMacroAttachProbeLock,
    required this.gcodeMacroDockProbeUnlock,
    required this.gcodeMacroProbeUnlock,
    required this.gcodeMacroProbeLock,
    required this.gcodeMacroDeployklickydock,
    required this.gcodeMacroRetractklickydock,
    required this.gcodeMacroAttachProbe,
    required this.gcodeMacroDockProbe,
    required this.gcodeMacroProbeCalibrate,
    required this.gcodeMacroProbeAccuracy,
    required this.forceMove,
    required this.homingOverride,
    required this.gcodeMacroUmbilicalPath,
    required this.gcodeMacroHomeZ,
    required this.gcodeMacroCheckprobe,
    required this.gcodeMacroSetprobestate,
    required this.gcodeMacroParkToolhead,
    required this.gcodeMacroKlickyStatusReady,
    required this.gcodeMacroKlickyStatusBusy,
    required this.gcodeMacroKlickyStatusLeveling,
    required this.gcodeMacroKlickyStatusHoming,
    required this.gcodeMacroKlickyStatusCleaning,
    required this.gcodeMacroKlickyStatusMeshing,
    required this.gcodeMacroKlickyStatusCalibratingZ,
    required this.gcodeMacroBedMeshCalibrate,
    required this.gcodeMacroZTiltAdjust,
    required this.mcu,
    required this.printer,
    required this.stepperX,
    required this.stepperY,
    required this.stepperZ,
    required this.stepperZ1,
    required this.stepperZ2,
    required this.extruder,
    required this.heaterBed,
    required this.fan,
    required this.heaterFanFan1,
    required this.idleTimeout,
    required this.bedMesh,
    required this.temperatureSensor8,
    required this.temperatureSensorA61450,
    required this.delayedGcodeKinematicPosition,
    this.excludeObject,
    required this.gcodeArcs,
    required this.verifyHeaterHeaterBed,
    required this.inputShaper,
    required this.probe,
    required this.zTilt,
    required this.tmc2209StepperX,
    required this.tmc2209StepperY,
    required this.tmc2209StepperZ,
    required this.tmc2209Extruder,
    required this.tmc2209StepperZ1,
    required this.tmc2209StepperZ2,
    required this.boardPins,
    required this.display,
    required this.outputPinBeeper,
    required this.neopixelFysetcMini12864,
    required this.gcodeMacroG32,
    required this.gcodeMacroPrintStart,
    required this.gcodeMacroPrintEnd,
    required this.virtualSdcard,
    this.pauseResume,
    required this.gcodeMacroCancelPrint,
    this.displayStatus,
  });

  factory Config75.fromJson(Map<String, dynamic> json) => Config75(
    gcodeMacroUserVariables: json.containsKey('gcode_macro _User_Variables')
        ? json['gcode_macro _User_Variables'] == null
        ? null
        : GcodeMacroUserVariables41.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro _User_Variables'])!)
        : null,
    respond: json.containsKey('respond')
        ? asT<Map<String, dynamic>?>(json['respond'])
        : null,
    gcodeMacroProbeVariables: json
        .containsKey('gcode_macro _Probe_Variables')
        ? json['gcode_macro _Probe_Variables'] == null
        ? null
        : GcodeMacroProbeVariables11.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro _Probe_Variables'])!)
        : null,
    gcodeMacroKlickyCheckVariablesVersion: json
        .containsKey('gcode_macro _klicky_check_variables_version')
        ? json['gcode_macro _klicky_check_variables_version'] == null
        ? null
        : GcodeMacroKlickyCheckVariablesVersion65.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _klicky_check_variables_version'])!)
        : null,
    gcodeMacroKlickydebug: json.containsKey('gcode_macro _KlickyDebug')
        ? json['gcode_macro _KlickyDebug'] == null
        ? null
        : GcodeMacroKlickydebug08.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro _KlickyDebug'])!)
        : null,
    gcodeMacroExitPoint: json.containsKey('gcode_macro _exit_point')
        ? json['gcode_macro _exit_point'] == null
        ? null
        : GcodeMacroExitPoint76.fromJson(
        asT<Map<String, dynamic>>(json['gcode_macro _exit_point'])!)
        : null,
    gcodeMacroEntryPoint: json.containsKey('gcode_macro _entry_point')
        ? json['gcode_macro _entry_point'] == null
        ? null
        : GcodeMacroEntryPoint72.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro _entry_point'])!)
        : null,
    gcodeMacroHomingVariables:
    json.containsKey('gcode_macro _Homing_Variables')
        ? json['gcode_macro _Homing_Variables'] == null
        ? null
        : GcodeMacroHomingVariables11.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _Homing_Variables'])!)
        : null,
    gcodeMacroAttachProbeLock:
    json.containsKey('gcode_macro Attach_Probe_Lock')
        ? json['gcode_macro Attach_Probe_Lock'] == null
        ? null
        : GcodeMacroAttachProbeLock70.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro Attach_Probe_Lock'])!)
        : null,
    gcodeMacroDockProbeUnlock:
    json.containsKey('gcode_macro Dock_Probe_Unlock')
        ? json['gcode_macro Dock_Probe_Unlock'] == null
        ? null
        : GcodeMacroDockProbeUnlock34.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro Dock_Probe_Unlock'])!)
        : null,
    gcodeMacroProbeUnlock: json.containsKey('gcode_macro _Probe_Unlock')
        ? json['gcode_macro _Probe_Unlock'] == null
        ? null
        : GcodeMacroProbeUnlock24.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro _Probe_Unlock'])!)
        : null,
    gcodeMacroProbeLock: json.containsKey('gcode_macro _Probe_Lock')
        ? json['gcode_macro _Probe_Lock'] == null
        ? null
        : GcodeMacroProbeLock62.fromJson(
        asT<Map<String, dynamic>>(json['gcode_macro _Probe_Lock'])!)
        : null,
    gcodeMacroDeployklickydock:
    json.containsKey('gcode_macro _DeployKlickyDock')
        ? json['gcode_macro _DeployKlickyDock'] == null
        ? null
        : GcodeMacroDeployklickydock68.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _DeployKlickyDock'])!)
        : null,
    gcodeMacroRetractklickydock:
    json.containsKey('gcode_macro _RetractKlickyDock')
        ? json['gcode_macro _RetractKlickyDock'] == null
        ? null
        : GcodeMacroRetractklickydock79.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _RetractKlickyDock'])!)
        : null,
    gcodeMacroAttachProbe: json.containsKey('gcode_macro Attach_Probe')
        ? json['gcode_macro Attach_Probe'] == null
        ? null
        : GcodeMacroAttachProbe05.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro Attach_Probe'])!)
        : null,
    gcodeMacroDockProbe: json.containsKey('gcode_macro Dock_Probe')
        ? json['gcode_macro Dock_Probe'] == null
        ? null
        : GcodeMacroDockProbe59.fromJson(
        asT<Map<String, dynamic>>(json['gcode_macro Dock_Probe'])!)
        : null,
    gcodeMacroProbeCalibrate: json
        .containsKey('gcode_macro PROBE_CALIBRATE')
        ? json['gcode_macro PROBE_CALIBRATE'] == null
        ? null
        : GcodeMacroProbeCalibrate28.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro PROBE_CALIBRATE'])!)
        : null,
    gcodeMacroProbeAccuracy: json.containsKey('gcode_macro PROBE_ACCURACY')
        ? json['gcode_macro PROBE_ACCURACY'] == null
        ? null
        : GcodeMacroProbeAccuracy69.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro PROBE_ACCURACY'])!)
        : null,
    forceMove: json.containsKey('force_move')
        ? json['force_move'] == null
        ? null
        : ForceMove07.fromJson(
        asT<Map<String, dynamic>>(json['force_move'])!)
        : null,
    homingOverride: json.containsKey('homing_override')
        ? json['homing_override'] == null
        ? null
        : HomingOverride49.fromJson(
        asT<Map<String, dynamic>>(json['homing_override'])!)
        : null,
    gcodeMacroUmbilicalPath: json.containsKey('gcode_macro _Umbilical_Path')
        ? json['gcode_macro _Umbilical_Path'] == null
        ? null
        : GcodeMacroUmbilicalPath69.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro _Umbilical_Path'])!)
        : null,
    gcodeMacroHomeZ: json.containsKey('gcode_macro _Home_Z_')
        ? json['gcode_macro _Home_Z_'] == null
        ? null
        : GcodeMacroHomeZ82.fromJson(
        asT<Map<String, dynamic>>(json['gcode_macro _Home_Z_'])!)
        : null,
    gcodeMacroCheckprobe: json.containsKey('gcode_macro _CheckProbe')
        ? json['gcode_macro _CheckProbe'] == null
        ? null
        : GcodeMacroCheckprobe72.fromJson(
        asT<Map<String, dynamic>>(json['gcode_macro _CheckProbe'])!)
        : null,
    gcodeMacroSetprobestate: json.containsKey('gcode_macro _SetProbeState')
        ? json['gcode_macro _SetProbeState'] == null
        ? null
        : GcodeMacroSetprobestate55.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro _SetProbeState'])!)
        : null,
    gcodeMacroParkToolhead: json.containsKey('gcode_macro _Park_Toolhead')
        ? json['gcode_macro _Park_Toolhead'] == null
        ? null
        : GcodeMacroParkToolhead81.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro _Park_Toolhead'])!)
        : null,
    gcodeMacroKlickyStatusReady:
    json.containsKey('gcode_macro _klicky_status_ready')
        ? json['gcode_macro _klicky_status_ready'] == null
        ? null
        : GcodeMacroKlickyStatusReady28.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _klicky_status_ready'])!)
        : null,
    gcodeMacroKlickyStatusBusy:
    json.containsKey('gcode_macro _klicky_status_busy')
        ? json['gcode_macro _klicky_status_busy'] == null
        ? null
        : GcodeMacroKlickyStatusBusy63.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _klicky_status_busy'])!)
        : null,
    gcodeMacroKlickyStatusLeveling:
    json.containsKey('gcode_macro _klicky_status_leveling')
        ? json['gcode_macro _klicky_status_leveling'] == null
        ? null
        : GcodeMacroKlickyStatusLeveling60.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _klicky_status_leveling'])!)
        : null,
    gcodeMacroKlickyStatusHoming:
    json.containsKey('gcode_macro _klicky_status_homing')
        ? json['gcode_macro _klicky_status_homing'] == null
        ? null
        : GcodeMacroKlickyStatusHoming55.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _klicky_status_homing'])!)
        : null,
    gcodeMacroKlickyStatusCleaning:
    json.containsKey('gcode_macro _klicky_status_cleaning')
        ? json['gcode_macro _klicky_status_cleaning'] == null
        ? null
        : GcodeMacroKlickyStatusCleaning00.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _klicky_status_cleaning'])!)
        : null,
    gcodeMacroKlickyStatusMeshing:
    json.containsKey('gcode_macro _klicky_status_meshing')
        ? json['gcode_macro _klicky_status_meshing'] == null
        ? null
        : GcodeMacroKlickyStatusMeshing45.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _klicky_status_meshing'])!)
        : null,
    gcodeMacroKlickyStatusCalibratingZ:
    json.containsKey('gcode_macro _klicky_status_calibrating_z')
        ? json['gcode_macro _klicky_status_calibrating_z'] == null
        ? null
        : GcodeMacroKlickyStatusCalibratingZ75.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _klicky_status_calibrating_z'])!)
        : null,
    gcodeMacroBedMeshCalibrate:
    json.containsKey('gcode_macro BED_MESH_CALIBRATE')
        ? json['gcode_macro BED_MESH_CALIBRATE'] == null
        ? null
        : GcodeMacroBedMeshCalibrate79.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro BED_MESH_CALIBRATE'])!)
        : null,
    gcodeMacroZTiltAdjust: json.containsKey('gcode_macro Z_TILT_ADJUST')
        ? json['gcode_macro Z_TILT_ADJUST'] == null
        ? null
        : GcodeMacroZTiltAdjust54.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro Z_TILT_ADJUST'])!)
        : null,
    mcu: json.containsKey('mcu')
        ? json['mcu'] == null
        ? null
        : Mcu60.fromJson(asT<Map<String, dynamic>>(json['mcu'])!)
        : null,
    printer: json.containsKey('printer')
        ? json['printer'] == null
        ? null
        : Printer24.fromJson(
        asT<Map<String, dynamic>>(json['printer'])!)
        : null,
    stepperX: json.containsKey('stepper_x')
        ? json['stepper_x'] == null
        ? null
        : StepperX35.fromJson(
        asT<Map<String, dynamic>>(json['stepper_x'])!)
        : null,
    stepperY: json.containsKey('stepper_y')
        ? json['stepper_y'] == null
        ? null
        : StepperY01.fromJson(
        asT<Map<String, dynamic>>(json['stepper_y'])!)
        : null,
    stepperZ: json.containsKey('stepper_z')
        ? json['stepper_z'] == null
        ? null
        : StepperZ29.fromJson(
        asT<Map<String, dynamic>>(json['stepper_z'])!)
        : null,
    stepperZ1: json.containsKey('stepper_z1')
        ? json['stepper_z1'] == null
        ? null
        : StepperZ104.fromJson(
        asT<Map<String, dynamic>>(json['stepper_z1'])!)
        : null,
    stepperZ2: json.containsKey('stepper_z2')
        ? json['stepper_z2'] == null
        ? null
        : StepperZ272.fromJson(
        asT<Map<String, dynamic>>(json['stepper_z2'])!)
        : null,
    extruder: json.containsKey('extruder')
        ? json['extruder'] == null
        ? null
        : Extruder87.fromJson(
        asT<Map<String, dynamic>>(json['extruder'])!)
        : null,
    heaterBed: json.containsKey('heater_bed')
        ? json['heater_bed'] == null
        ? null
        : HeaterBed97.fromJson(
        asT<Map<String, dynamic>>(json['heater_bed'])!)
        : null,
    fan: json.containsKey('fan')
        ? json['fan'] == null
        ? null
        : Fan71.fromJson(asT<Map<String, dynamic>>(json['fan'])!)
        : null,
    heaterFanFan1: json.containsKey('heater_fan fan1')
        ? json['heater_fan fan1'] == null
        ? null
        : HeaterFanFan198.fromJson(
        asT<Map<String, dynamic>>(json['heater_fan fan1'])!)
        : null,
    idleTimeout: json.containsKey('idle_timeout')
        ? json['idle_timeout'] == null
        ? null
        : IdleTimeout86.fromJson(
        asT<Map<String, dynamic>>(json['idle_timeout'])!)
        : null,
    bedMesh: json.containsKey('bed_mesh')
        ? json['bed_mesh'] == null
        ? null
        : BedMesh13.fromJson(
        asT<Map<String, dynamic>>(json['bed_mesh'])!)
        : null,
    temperatureSensor8: json.containsKey('temperature_sensor 怪兽8温度')
        ? json['temperature_sensor 怪兽8温度'] == null
        ? null
        : TemperatureSensor861.fromJson(asT<Map<String, dynamic>>(
        json['temperature_sensor 怪兽8温度'])!)
        : null,
    temperatureSensorA61450: json
        .containsKey('temperature_sensor A6-1450温度')
        ? json['temperature_sensor A6-1450温度'] == null
        ? null
        : TemperatureSensorA6145086.fromJson(asT<Map<String, dynamic>>(
        json['temperature_sensor A6-1450温度'])!)
        : null,
    delayedGcodeKinematicPosition:
    json.containsKey('delayed_gcode KINEMATIC_POSITION')
        ? json['delayed_gcode KINEMATIC_POSITION'] == null
        ? null
        : DelayedGcodeKinematicPosition46.fromJson(
        asT<Map<String, dynamic>>(
            json['delayed_gcode KINEMATIC_POSITION'])!)
        : null,
    excludeObject: json.containsKey('exclude_object')
        ? asT<Map<String, dynamic>?>(json['exclude_object'])
        : null,
    gcodeArcs: json.containsKey('gcode_arcs')
        ? json['gcode_arcs'] == null
        ? null
        : GcodeArcs08.fromJson(
        asT<Map<String, dynamic>>(json['gcode_arcs'])!)
        : null,
    verifyHeaterHeaterBed: json.containsKey('verify_heater heater_bed')
        ? json['verify_heater heater_bed'] == null
        ? null
        : VerifyHeaterHeaterBed54.fromJson(asT<Map<String, dynamic>>(
        json['verify_heater heater_bed'])!)
        : null,
    inputShaper: json.containsKey('input_shaper')
        ? json['input_shaper'] == null
        ? null
        : InputShaper21.fromJson(
        asT<Map<String, dynamic>>(json['input_shaper'])!)
        : null,
    probe: json.containsKey('probe')
        ? json['probe'] == null
        ? null
        : Probe13.fromJson(asT<Map<String, dynamic>>(json['probe'])!)
        : null,
    zTilt: json.containsKey('z_tilt')
        ? json['z_tilt'] == null
        ? null
        : ZTilt04.fromJson(asT<Map<String, dynamic>>(json['z_tilt'])!)
        : null,
    tmc2209StepperX: json.containsKey('tmc2209 stepper_x')
        ? json['tmc2209 stepper_x'] == null
        ? null
        : Tmc2209StepperX78.fromJson(
        asT<Map<String, dynamic>>(json['tmc2209 stepper_x'])!)
        : null,
    tmc2209StepperY: json.containsKey('tmc2209 stepper_y')
        ? json['tmc2209 stepper_y'] == null
        ? null
        : Tmc2209StepperY33.fromJson(
        asT<Map<String, dynamic>>(json['tmc2209 stepper_y'])!)
        : null,
    tmc2209StepperZ: json.containsKey('tmc2209 stepper_z')
        ? json['tmc2209 stepper_z'] == null
        ? null
        : Tmc2209StepperZ78.fromJson(
        asT<Map<String, dynamic>>(json['tmc2209 stepper_z'])!)
        : null,
    tmc2209Extruder: json.containsKey('tmc2209 extruder')
        ? json['tmc2209 extruder'] == null
        ? null
        : Tmc2209Extruder34.fromJson(
        asT<Map<String, dynamic>>(json['tmc2209 extruder'])!)
        : null,
    tmc2209StepperZ1: json.containsKey('tmc2209 stepper_z1')
        ? json['tmc2209 stepper_z1'] == null
        ? null
        : Tmc2209StepperZ175.fromJson(
        asT<Map<String, dynamic>>(json['tmc2209 stepper_z1'])!)
        : null,
    tmc2209StepperZ2: json.containsKey('tmc2209 stepper_z2')
        ? json['tmc2209 stepper_z2'] == null
        ? null
        : Tmc2209StepperZ216.fromJson(
        asT<Map<String, dynamic>>(json['tmc2209 stepper_z2'])!)
        : null,
    boardPins: json.containsKey('board_pins')
        ? json['board_pins'] == null
        ? null
        : BoardPins95.fromJson(
        asT<Map<String, dynamic>>(json['board_pins'])!)
        : null,
    display: json.containsKey('display')
        ? json['display'] == null
        ? null
        : Display01.fromJson(
        asT<Map<String, dynamic>>(json['display'])!)
        : null,
    outputPinBeeper: json.containsKey('output_pin beeper')
        ? json['output_pin beeper'] == null
        ? null
        : OutputPinBeeper39.fromJson(
        asT<Map<String, dynamic>>(json['output_pin beeper'])!)
        : null,
    neopixelFysetcMini12864: json.containsKey('neopixel fysetc_mini12864')
        ? json['neopixel fysetc_mini12864'] == null
        ? null
        : NeopixelFysetcMini1286414.fromJson(asT<Map<String, dynamic>>(
        json['neopixel fysetc_mini12864'])!)
        : null,
    gcodeMacroG32: json.containsKey('gcode_macro G32')
        ? json['gcode_macro G32'] == null
        ? null
        : GcodeMacroG3249.fromJson(
        asT<Map<String, dynamic>>(json['gcode_macro G32'])!)
        : null,
    gcodeMacroPrintStart: json.containsKey('gcode_macro PRINT_START')
        ? json['gcode_macro PRINT_START'] == null
        ? null
        : GcodeMacroPrintStart05.fromJson(
        asT<Map<String, dynamic>>(json['gcode_macro PRINT_START'])!)
        : null,
    gcodeMacroPrintEnd: json.containsKey('gcode_macro PRINT_END')
        ? json['gcode_macro PRINT_END'] == null
        ? null
        : GcodeMacroPrintEnd16.fromJson(
        asT<Map<String, dynamic>>(json['gcode_macro PRINT_END'])!)
        : null,
    virtualSdcard: json.containsKey('virtual_sdcard')
        ? json['virtual_sdcard'] == null
        ? null
        : VirtualSdcard65.fromJson(
        asT<Map<String, dynamic>>(json['virtual_sdcard'])!)
        : null,
    pauseResume: json.containsKey('pause_resume')
        ? asT<Map<String, dynamic>?>(json['pause_resume'])
        : null,
    gcodeMacroCancelPrint: json.containsKey('gcode_macro CANCEL_PRINT')
        ? json['gcode_macro CANCEL_PRINT'] == null
        ? null
        : GcodeMacroCancelPrint13.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro CANCEL_PRINT'])!)
        : null,
    displayStatus: json.containsKey('display_status')
        ? asT<Map<String, dynamic>?>(json['display_status'])
        : null,
  );

  GcodeMacroUserVariables41? gcodeMacroUserVariables;
  Map<String, dynamic>? respond;
  GcodeMacroProbeVariables11? gcodeMacroProbeVariables;
  GcodeMacroKlickyCheckVariablesVersion65?
  gcodeMacroKlickyCheckVariablesVersion;
  GcodeMacroKlickydebug08? gcodeMacroKlickydebug;
  GcodeMacroExitPoint76? gcodeMacroExitPoint;
  GcodeMacroEntryPoint72? gcodeMacroEntryPoint;
  GcodeMacroHomingVariables11? gcodeMacroHomingVariables;
  GcodeMacroAttachProbeLock70? gcodeMacroAttachProbeLock;
  GcodeMacroDockProbeUnlock34? gcodeMacroDockProbeUnlock;
  GcodeMacroProbeUnlock24? gcodeMacroProbeUnlock;
  GcodeMacroProbeLock62? gcodeMacroProbeLock;
  GcodeMacroDeployklickydock68? gcodeMacroDeployklickydock;
  GcodeMacroRetractklickydock79? gcodeMacroRetractklickydock;
  GcodeMacroAttachProbe05? gcodeMacroAttachProbe;
  GcodeMacroDockProbe59? gcodeMacroDockProbe;
  GcodeMacroProbeCalibrate28? gcodeMacroProbeCalibrate;
  GcodeMacroProbeAccuracy69? gcodeMacroProbeAccuracy;
  ForceMove07? forceMove;
  HomingOverride49? homingOverride;
  GcodeMacroUmbilicalPath69? gcodeMacroUmbilicalPath;
  GcodeMacroHomeZ82? gcodeMacroHomeZ;
  GcodeMacroCheckprobe72? gcodeMacroCheckprobe;
  GcodeMacroSetprobestate55? gcodeMacroSetprobestate;
  GcodeMacroParkToolhead81? gcodeMacroParkToolhead;
  GcodeMacroKlickyStatusReady28? gcodeMacroKlickyStatusReady;
  GcodeMacroKlickyStatusBusy63? gcodeMacroKlickyStatusBusy;
  GcodeMacroKlickyStatusLeveling60? gcodeMacroKlickyStatusLeveling;
  GcodeMacroKlickyStatusHoming55? gcodeMacroKlickyStatusHoming;
  GcodeMacroKlickyStatusCleaning00? gcodeMacroKlickyStatusCleaning;
  GcodeMacroKlickyStatusMeshing45? gcodeMacroKlickyStatusMeshing;
  GcodeMacroKlickyStatusCalibratingZ75? gcodeMacroKlickyStatusCalibratingZ;
  GcodeMacroBedMeshCalibrate79? gcodeMacroBedMeshCalibrate;
  GcodeMacroZTiltAdjust54? gcodeMacroZTiltAdjust;
  Mcu60? mcu;
  Printer24? printer;
  StepperX35? stepperX;
  StepperY01? stepperY;
  StepperZ29? stepperZ;
  StepperZ104? stepperZ1;
  StepperZ272? stepperZ2;
  Extruder87? extruder;
  HeaterBed97? heaterBed;
  Fan71? fan;
  HeaterFanFan198? heaterFanFan1;
  IdleTimeout86? idleTimeout;
  BedMesh13? bedMesh;
  TemperatureSensor861? temperatureSensor8;
  TemperatureSensorA6145086? temperatureSensorA61450;
  DelayedGcodeKinematicPosition46? delayedGcodeKinematicPosition;
  Map<String, dynamic>? excludeObject;
  GcodeArcs08? gcodeArcs;
  VerifyHeaterHeaterBed54? verifyHeaterHeaterBed;
  InputShaper21? inputShaper;
  Probe13? probe;
  ZTilt04? zTilt;
  Tmc2209StepperX78? tmc2209StepperX;
  Tmc2209StepperY33? tmc2209StepperY;
  Tmc2209StepperZ78? tmc2209StepperZ;
  Tmc2209Extruder34? tmc2209Extruder;
  Tmc2209StepperZ175? tmc2209StepperZ1;
  Tmc2209StepperZ216? tmc2209StepperZ2;
  BoardPins95? boardPins;
  Display01? display;
  OutputPinBeeper39? outputPinBeeper;
  NeopixelFysetcMini1286414? neopixelFysetcMini12864;
  GcodeMacroG3249? gcodeMacroG32;
  GcodeMacroPrintStart05? gcodeMacroPrintStart;
  GcodeMacroPrintEnd16? gcodeMacroPrintEnd;
  VirtualSdcard65? virtualSdcard;
  Map<String, dynamic>? pauseResume;
  GcodeMacroCancelPrint13? gcodeMacroCancelPrint;
  Map<String, dynamic>? displayStatus;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode_macro _User_Variables': gcodeMacroUserVariables,
    'respond': respond,
    'gcode_macro _Probe_Variables': gcodeMacroProbeVariables,
    'gcode_macro _klicky_check_variables_version':
    gcodeMacroKlickyCheckVariablesVersion,
    'gcode_macro _KlickyDebug': gcodeMacroKlickydebug,
    'gcode_macro _exit_point': gcodeMacroExitPoint,
    'gcode_macro _entry_point': gcodeMacroEntryPoint,
    'gcode_macro _Homing_Variables': gcodeMacroHomingVariables,
    'gcode_macro Attach_Probe_Lock': gcodeMacroAttachProbeLock,
    'gcode_macro Dock_Probe_Unlock': gcodeMacroDockProbeUnlock,
    'gcode_macro _Probe_Unlock': gcodeMacroProbeUnlock,
    'gcode_macro _Probe_Lock': gcodeMacroProbeLock,
    'gcode_macro _DeployKlickyDock': gcodeMacroDeployklickydock,
    'gcode_macro _RetractKlickyDock': gcodeMacroRetractklickydock,
    'gcode_macro Attach_Probe': gcodeMacroAttachProbe,
    'gcode_macro Dock_Probe': gcodeMacroDockProbe,
    'gcode_macro PROBE_CALIBRATE': gcodeMacroProbeCalibrate,
    'gcode_macro PROBE_ACCURACY': gcodeMacroProbeAccuracy,
    'force_move': forceMove,
    'homing_override': homingOverride,
    'gcode_macro _Umbilical_Path': gcodeMacroUmbilicalPath,
    'gcode_macro _Home_Z_': gcodeMacroHomeZ,
    'gcode_macro _CheckProbe': gcodeMacroCheckprobe,
    'gcode_macro _SetProbeState': gcodeMacroSetprobestate,
    'gcode_macro _Park_Toolhead': gcodeMacroParkToolhead,
    'gcode_macro _klicky_status_ready': gcodeMacroKlickyStatusReady,
    'gcode_macro _klicky_status_busy': gcodeMacroKlickyStatusBusy,
    'gcode_macro _klicky_status_leveling': gcodeMacroKlickyStatusLeveling,
    'gcode_macro _klicky_status_homing': gcodeMacroKlickyStatusHoming,
    'gcode_macro _klicky_status_cleaning': gcodeMacroKlickyStatusCleaning,
    'gcode_macro _klicky_status_meshing': gcodeMacroKlickyStatusMeshing,
    'gcode_macro _klicky_status_calibrating_z':
    gcodeMacroKlickyStatusCalibratingZ,
    'gcode_macro BED_MESH_CALIBRATE': gcodeMacroBedMeshCalibrate,
    'gcode_macro Z_TILT_ADJUST': gcodeMacroZTiltAdjust,
    'mcu': mcu,
    'printer': printer,
    'stepper_x': stepperX,
    'stepper_y': stepperY,
    'stepper_z': stepperZ,
    'stepper_z1': stepperZ1,
    'stepper_z2': stepperZ2,
    'extruder': extruder,
    'heater_bed': heaterBed,
    'fan': fan,
    'heater_fan fan1': heaterFanFan1,
    'idle_timeout': idleTimeout,
    'bed_mesh': bedMesh,
    'temperature_sensor 怪兽8温度': temperatureSensor8,
    'temperature_sensor A6-1450温度': temperatureSensorA61450,
    'delayed_gcode KINEMATIC_POSITION': delayedGcodeKinematicPosition,
    'exclude_object': excludeObject,
    'gcode_arcs': gcodeArcs,
    'verify_heater heater_bed': verifyHeaterHeaterBed,
    'input_shaper': inputShaper,
    'probe': probe,
    'z_tilt': zTilt,
    'tmc2209 stepper_x': tmc2209StepperX,
    'tmc2209 stepper_y': tmc2209StepperY,
    'tmc2209 stepper_z': tmc2209StepperZ,
    'tmc2209 extruder': tmc2209Extruder,
    'tmc2209 stepper_z1': tmc2209StepperZ1,
    'tmc2209 stepper_z2': tmc2209StepperZ2,
    'board_pins': boardPins,
    'display': display,
    'output_pin beeper': outputPinBeeper,
    'neopixel fysetc_mini12864': neopixelFysetcMini12864,
    'gcode_macro G32': gcodeMacroG32,
    'gcode_macro PRINT_START': gcodeMacroPrintStart,
    'gcode_macro PRINT_END': gcodeMacroPrintEnd,
    'virtual_sdcard': virtualSdcard,
    'pause_resume': pauseResume,
    'gcode_macro CANCEL_PRINT': gcodeMacroCancelPrint,
    'display_status': displayStatus,
  };
}

class GcodeMacroUserVariables41 {
  GcodeMacroUserVariables41({
    required this.variableVerbose,
    required this.variableTravelSpeed,
    required this.variableDockSpeed,
    required this.variableReleaseSpeed,
    required this.variableZDropSpeed,
    required this.variableSafeZ,
    required this.variableEnableZHop,
    required this.variableMaxBedY,
    required this.variableMaxBedX,
    required this.variableZEndstopX,
    required this.variableZEndstopY,
    required this.variableDocklocationY,
    required this.variableDocklocationX,
    required this.variableDocklocationZ,
    required this.variableDockmoveX,
    required this.variableDockmoveY,
    required this.variableDockmoveZ,
    required this.variableAttachmoveX,
    required this.variableAttachmoveY,
    required this.variableAttachmoveZ,
    required this.variableUmbilical,
    required this.variableUmbilicalX,
    required this.variableUmbilicalY,
    required this.variableVersion,
    required this.variableAttachmove2X,
    required this.variableAttachmove2Y,
    required this.variableAttachmove2Z,
    required this.gcode,
  });

  factory GcodeMacroUserVariables41.fromJson(Map<String, dynamic> json) =>
      GcodeMacroUserVariables41(
        variableVerbose: json.containsKey('variable_verbose')
            ? asT<String>(json['variable_verbose'])!
            : '',
        variableTravelSpeed: json.containsKey('variable_travel_speed')
            ? asT<String>(json['variable_travel_speed'])!
            : '',
        variableDockSpeed: json.containsKey('variable_dock_speed')
            ? asT<String>(json['variable_dock_speed'])!
            : '',
        variableReleaseSpeed: json.containsKey('variable_release_speed')
            ? asT<String>(json['variable_release_speed'])!
            : '',
        variableZDropSpeed: json.containsKey('variable_z_drop_speed')
            ? asT<String>(json['variable_z_drop_speed'])!
            : '',
        variableSafeZ: json.containsKey('variable_safe_z')
            ? asT<String>(json['variable_safe_z'])!
            : '',
        variableEnableZHop: json.containsKey('variable_enable_z_hop')
            ? asT<String>(json['variable_enable_z_hop'])!
            : '',
        variableMaxBedY: json.containsKey('variable_max_bed_y')
            ? asT<String>(json['variable_max_bed_y'])!
            : '',
        variableMaxBedX: json.containsKey('variable_max_bed_x')
            ? asT<String>(json['variable_max_bed_x'])!
            : '',
        variableZEndstopX: json.containsKey('variable_z_endstop_x')
            ? asT<String>(json['variable_z_endstop_x'])!
            : '',
        variableZEndstopY: json.containsKey('variable_z_endstop_y')
            ? asT<String>(json['variable_z_endstop_y'])!
            : '',
        variableDocklocationY: json.containsKey('variable_docklocation_y')
            ? asT<String>(json['variable_docklocation_y'])!
            : '',
        variableDocklocationX: json.containsKey('variable_docklocation_x')
            ? asT<String>(json['variable_docklocation_x'])!
            : '',
        variableDocklocationZ: json.containsKey('variable_docklocation_z')
            ? asT<String>(json['variable_docklocation_z'])!
            : '',
        variableDockmoveX: json.containsKey('variable_dockmove_x')
            ? asT<String>(json['variable_dockmove_x'])!
            : '',
        variableDockmoveY: json.containsKey('variable_dockmove_y')
            ? asT<String>(json['variable_dockmove_y'])!
            : '',
        variableDockmoveZ: json.containsKey('variable_dockmove_z')
            ? asT<String>(json['variable_dockmove_z'])!
            : '',
        variableAttachmoveX: json.containsKey('variable_attachmove_x')
            ? asT<String>(json['variable_attachmove_x'])!
            : '',
        variableAttachmoveY: json.containsKey('variable_attachmove_y')
            ? asT<String>(json['variable_attachmove_y'])!
            : '',
        variableAttachmoveZ: json.containsKey('variable_attachmove_z')
            ? asT<String>(json['variable_attachmove_z'])!
            : '',
        variableUmbilical: json.containsKey('variable_umbilical')
            ? asT<String>(json['variable_umbilical'])!
            : '',
        variableUmbilicalX: json.containsKey('variable_umbilical_x')
            ? asT<String>(json['variable_umbilical_x'])!
            : '',
        variableUmbilicalY: json.containsKey('variable_umbilical_y')
            ? asT<String>(json['variable_umbilical_y'])!
            : '',
        variableVersion: json.containsKey('variable_version')
            ? asT<String>(json['variable_version'])!
            : '',
        variableAttachmove2X: json.containsKey('variable_attachmove2_x')
            ? asT<String>(json['variable_attachmove2_x'])!
            : '',
        variableAttachmove2Y: json.containsKey('variable_attachmove2_y')
            ? asT<String>(json['variable_attachmove2_y'])!
            : '',
        variableAttachmove2Z: json.containsKey('variable_attachmove2_z')
            ? asT<String>(json['variable_attachmove2_z'])!
            : '',
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String variableVerbose;
  String variableTravelSpeed;
  String variableDockSpeed;
  String variableReleaseSpeed;
  String variableZDropSpeed;
  String variableSafeZ;
  String variableEnableZHop;
  String variableMaxBedY;
  String variableMaxBedX;
  String variableZEndstopX;
  String variableZEndstopY;
  String variableDocklocationY;
  String variableDocklocationX;
  String variableDocklocationZ;
  String variableDockmoveX;
  String variableDockmoveY;
  String variableDockmoveZ;
  String variableAttachmoveX;
  String variableAttachmoveY;
  String variableAttachmoveZ;
  String variableUmbilical;
  String variableUmbilicalX;
  String variableUmbilicalY;
  String variableVersion;
  String variableAttachmove2X;
  String variableAttachmove2Y;
  String variableAttachmove2Z;
  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'variable_verbose': variableVerbose,
    'variable_travel_speed': variableTravelSpeed,
    'variable_dock_speed': variableDockSpeed,
    'variable_release_speed': variableReleaseSpeed,
    'variable_z_drop_speed': variableZDropSpeed,
    'variable_safe_z': variableSafeZ,
    'variable_enable_z_hop': variableEnableZHop,
    'variable_max_bed_y': variableMaxBedY,
    'variable_max_bed_x': variableMaxBedX,
    'variable_z_endstop_x': variableZEndstopX,
    'variable_z_endstop_y': variableZEndstopY,
    'variable_docklocation_y': variableDocklocationY,
    'variable_docklocation_x': variableDocklocationX,
    'variable_docklocation_z': variableDocklocationZ,
    'variable_dockmove_x': variableDockmoveX,
    'variable_dockmove_y': variableDockmoveY,
    'variable_dockmove_z': variableDockmoveZ,
    'variable_attachmove_x': variableAttachmoveX,
    'variable_attachmove_y': variableAttachmoveY,
    'variable_attachmove_z': variableAttachmoveZ,
    'variable_umbilical': variableUmbilical,
    'variable_umbilical_x': variableUmbilicalX,
    'variable_umbilical_y': variableUmbilicalY,
    'variable_version': variableVersion,
    'variable_attachmove2_x': variableAttachmove2X,
    'variable_attachmove2_y': variableAttachmove2Y,
    'variable_attachmove2_z': variableAttachmove2Z,
    'gcode': gcode,
  };
}

class GcodeMacroProbeVariables11 {
  GcodeMacroProbeVariables11({
    required this.variableProbeAttached,
    required this.variableProbeState,
    required this.variableProbeLock,
    required this.variableProbeZHomed,
    required this.variableZEndstopX,
    required this.variableZEndstopY,
    required this.gcode,
  });

  factory GcodeMacroProbeVariables11.fromJson(Map<String, dynamic> json) =>
      GcodeMacroProbeVariables11(
        variableProbeAttached: json.containsKey('variable_probe_attached')
            ? asT<String>(json['variable_probe_attached'])!
            : '',
        variableProbeState: json.containsKey('variable_probe_state')
            ? asT<String>(json['variable_probe_state'])!
            : '',
        variableProbeLock: json.containsKey('variable_probe_lock')
            ? asT<String>(json['variable_probe_lock'])!
            : '',
        variableProbeZHomed: json.containsKey('variable_probe_z_homed')
            ? asT<String>(json['variable_probe_z_homed'])!
            : '',
        variableZEndstopX: json.containsKey('variable_z_endstop_x')
            ? asT<String>(json['variable_z_endstop_x'])!
            : '',
        variableZEndstopY: json.containsKey('variable_z_endstop_y')
            ? asT<String>(json['variable_z_endstop_y'])!
            : '',
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String variableProbeAttached;
  String variableProbeState;
  String variableProbeLock;
  String variableProbeZHomed;
  String variableZEndstopX;
  String variableZEndstopY;
  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'variable_probe_attached': variableProbeAttached,
    'variable_probe_state': variableProbeState,
    'variable_probe_lock': variableProbeLock,
    'variable_probe_z_homed': variableProbeZHomed,
    'variable_z_endstop_x': variableZEndstopX,
    'variable_z_endstop_y': variableZEndstopY,
    'gcode': gcode,
  };
}

class GcodeMacroKlickyCheckVariablesVersion65 {
  GcodeMacroKlickyCheckVariablesVersion65({
    required this.gcode,
  });

  factory GcodeMacroKlickyCheckVariablesVersion65.fromJson(
      Map<String, dynamic> json) =>
      GcodeMacroKlickyCheckVariablesVersion65(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
  };
}

class GcodeMacroKlickydebug08 {
  GcodeMacroKlickydebug08({
    required this.gcode,
  });

  factory GcodeMacroKlickydebug08.fromJson(Map<String, dynamic> json) =>
      GcodeMacroKlickydebug08(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
  };
}

class GcodeMacroExitPoint76 {
  GcodeMacroExitPoint76({
    required this.gcode,
  });

  factory GcodeMacroExitPoint76.fromJson(Map<String, dynamic> json) =>
      GcodeMacroExitPoint76(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
  };
}

class GcodeMacroEntryPoint72 {
  GcodeMacroEntryPoint72({
    required this.gcode,
  });

  factory GcodeMacroEntryPoint72.fromJson(Map<String, dynamic> json) =>
      GcodeMacroEntryPoint72(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
  };
}

class GcodeMacroHomingVariables11 {
  GcodeMacroHomingVariables11({
    required this.gcode,
  });

  factory GcodeMacroHomingVariables11.fromJson(Map<String, dynamic> json) =>
      GcodeMacroHomingVariables11(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
  };
}

class GcodeMacroAttachProbeLock70 {
  GcodeMacroAttachProbeLock70({
    required this.description,
    required this.gcode,
  });

  factory GcodeMacroAttachProbeLock70.fromJson(Map<String, dynamic> json) =>
      GcodeMacroAttachProbeLock70(
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String description;
  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'description': description,
    'gcode': gcode,
  };
}

class GcodeMacroDockProbeUnlock34 {
  GcodeMacroDockProbeUnlock34({
    required this.description,
    required this.gcode,
  });

  factory GcodeMacroDockProbeUnlock34.fromJson(Map<String, dynamic> json) =>
      GcodeMacroDockProbeUnlock34(
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String description;
  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'description': description,
    'gcode': gcode,
  };
}

class GcodeMacroProbeUnlock24 {
  GcodeMacroProbeUnlock24({
    required this.description,
    required this.gcode,
  });

  factory GcodeMacroProbeUnlock24.fromJson(Map<String, dynamic> json) =>
      GcodeMacroProbeUnlock24(
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String description;
  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'description': description,
    'gcode': gcode,
  };
}

class GcodeMacroProbeLock62 {
  GcodeMacroProbeLock62({
    required this.description,
    required this.gcode,
  });

  factory GcodeMacroProbeLock62.fromJson(Map<String, dynamic> json) =>
      GcodeMacroProbeLock62(
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String description;
  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'description': description,
    'gcode': gcode,
  };
}

class GcodeMacroDeployklickydock68 {
  GcodeMacroDeployklickydock68({
    required this.description,
    required this.gcode,
  });

  factory GcodeMacroDeployklickydock68.fromJson(Map<String, dynamic> json) =>
      GcodeMacroDeployklickydock68(
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String description;
  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'description': description,
    'gcode': gcode,
  };
}

class GcodeMacroRetractklickydock79 {
  GcodeMacroRetractklickydock79({
    required this.description,
    required this.gcode,
  });

  factory GcodeMacroRetractklickydock79.fromJson(Map<String, dynamic> json) =>
      GcodeMacroRetractklickydock79(
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String description;
  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'description': description,
    'gcode': gcode,
  };
}

class GcodeMacroAttachProbe05 {
  GcodeMacroAttachProbe05({
    required this.description,
    required this.gcode,
  });

  factory GcodeMacroAttachProbe05.fromJson(Map<String, dynamic> json) =>
      GcodeMacroAttachProbe05(
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String description;
  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'description': description,
    'gcode': gcode,
  };
}

class GcodeMacroDockProbe59 {
  GcodeMacroDockProbe59({
    required this.description,
    required this.gcode,
  });

  factory GcodeMacroDockProbe59.fromJson(Map<String, dynamic> json) =>
      GcodeMacroDockProbe59(
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String description;
  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'description': description,
    'gcode': gcode,
  };
}

class GcodeMacroProbeCalibrate28 {
  GcodeMacroProbeCalibrate28({
    required this.renameExisting,
    required this.description,
    required this.gcode,
  });

  factory GcodeMacroProbeCalibrate28.fromJson(Map<String, dynamic> json) =>
      GcodeMacroProbeCalibrate28(
        renameExisting: json.containsKey('rename_existing')
            ? asT<String>(json['rename_existing'])!
            : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String renameExisting;
  String description;
  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'rename_existing': renameExisting,
    'description': description,
    'gcode': gcode,
  };
}

class GcodeMacroProbeAccuracy69 {
  GcodeMacroProbeAccuracy69({
    required this.renameExisting,
    required this.description,
    required this.gcode,
  });

  factory GcodeMacroProbeAccuracy69.fromJson(Map<String, dynamic> json) =>
      GcodeMacroProbeAccuracy69(
        renameExisting: json.containsKey('rename_existing')
            ? asT<String>(json['rename_existing'])!
            : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String renameExisting;
  String description;
  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'rename_existing': renameExisting,
    'description': description,
    'gcode': gcode,
  };
}

class ForceMove07 {
  ForceMove07({
    required this.enableForceMove,
  });

  factory ForceMove07.fromJson(Map<String, dynamic> json) => ForceMove07(
    enableForceMove: json.containsKey('enable_force_move')
        ? asT<String>(json['enable_force_move'])!
        : '',
  );

  String enableForceMove;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'enable_force_move': enableForceMove,
  };
}

class HomingOverride49 {
  HomingOverride49({
    required this.axes,
    required this.gcode,
  });

  factory HomingOverride49.fromJson(Map<String, dynamic> json) =>
      HomingOverride49(
        axes: json.containsKey('axes') ? asT<String>(json['axes'])! : '',
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String axes;
  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'axes': axes,
    'gcode': gcode,
  };
}

class GcodeMacroUmbilicalPath69 {
  GcodeMacroUmbilicalPath69({
    required this.gcode,
  });

  factory GcodeMacroUmbilicalPath69.fromJson(Map<String, dynamic> json) =>
      GcodeMacroUmbilicalPath69(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
  };
}

class GcodeMacroHomeZ82 {
  GcodeMacroHomeZ82({
    required this.gcode,
  });

  factory GcodeMacroHomeZ82.fromJson(Map<String, dynamic> json) =>
      GcodeMacroHomeZ82(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
  };
}

class GcodeMacroCheckprobe72 {
  GcodeMacroCheckprobe72({
    required this.variableProbeState,
    required this.gcode,
  });

  factory GcodeMacroCheckprobe72.fromJson(Map<String, dynamic> json) =>
      GcodeMacroCheckprobe72(
        variableProbeState: json.containsKey('variable_probe_state')
            ? asT<String>(json['variable_probe_state'])!
            : '',
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String variableProbeState;
  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'variable_probe_state': variableProbeState,
    'gcode': gcode,
  };
}

class GcodeMacroSetprobestate55 {
  GcodeMacroSetprobestate55({
    required this.gcode,
  });

  factory GcodeMacroSetprobestate55.fromJson(Map<String, dynamic> json) =>
      GcodeMacroSetprobestate55(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
  };
}

class GcodeMacroParkToolhead81 {
  GcodeMacroParkToolhead81({
    required this.gcode,
  });

  factory GcodeMacroParkToolhead81.fromJson(Map<String, dynamic> json) =>
      GcodeMacroParkToolhead81(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
  };
}

class GcodeMacroKlickyStatusReady28 {
  GcodeMacroKlickyStatusReady28({
    required this.gcode,
  });

  factory GcodeMacroKlickyStatusReady28.fromJson(Map<String, dynamic> json) =>
      GcodeMacroKlickyStatusReady28(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
  };
}

class GcodeMacroKlickyStatusBusy63 {
  GcodeMacroKlickyStatusBusy63({
    required this.gcode,
  });

  factory GcodeMacroKlickyStatusBusy63.fromJson(Map<String, dynamic> json) =>
      GcodeMacroKlickyStatusBusy63(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
  };
}

class GcodeMacroKlickyStatusLeveling60 {
  GcodeMacroKlickyStatusLeveling60({
    required this.gcode,
  });

  factory GcodeMacroKlickyStatusLeveling60.fromJson(
      Map<String, dynamic> json) =>
      GcodeMacroKlickyStatusLeveling60(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
  };
}

class GcodeMacroKlickyStatusHoming55 {
  GcodeMacroKlickyStatusHoming55({
    required this.gcode,
  });

  factory GcodeMacroKlickyStatusHoming55.fromJson(Map<String, dynamic> json) =>
      GcodeMacroKlickyStatusHoming55(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
  };
}

class GcodeMacroKlickyStatusCleaning00 {
  GcodeMacroKlickyStatusCleaning00({
    required this.gcode,
  });

  factory GcodeMacroKlickyStatusCleaning00.fromJson(
      Map<String, dynamic> json) =>
      GcodeMacroKlickyStatusCleaning00(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
  };
}

class GcodeMacroKlickyStatusMeshing45 {
  GcodeMacroKlickyStatusMeshing45({
    required this.gcode,
  });

  factory GcodeMacroKlickyStatusMeshing45.fromJson(Map<String, dynamic> json) =>
      GcodeMacroKlickyStatusMeshing45(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
  };
}

class GcodeMacroKlickyStatusCalibratingZ75 {
  GcodeMacroKlickyStatusCalibratingZ75({
    required this.gcode,
  });

  factory GcodeMacroKlickyStatusCalibratingZ75.fromJson(
      Map<String, dynamic> json) =>
      GcodeMacroKlickyStatusCalibratingZ75(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
  };
}

class GcodeMacroBedMeshCalibrate79 {
  GcodeMacroBedMeshCalibrate79({
    required this.renameExisting,
    required this.description,
    required this.gcode,
  });

  factory GcodeMacroBedMeshCalibrate79.fromJson(Map<String, dynamic> json) =>
      GcodeMacroBedMeshCalibrate79(
        renameExisting: json.containsKey('rename_existing')
            ? asT<String>(json['rename_existing'])!
            : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String renameExisting;
  String description;
  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'rename_existing': renameExisting,
    'description': description,
    'gcode': gcode,
  };
}

class GcodeMacroZTiltAdjust54 {
  GcodeMacroZTiltAdjust54({
    required this.renameExisting,
    required this.description,
    required this.gcode,
  });

  factory GcodeMacroZTiltAdjust54.fromJson(Map<String, dynamic> json) =>
      GcodeMacroZTiltAdjust54(
        renameExisting: json.containsKey('rename_existing')
            ? asT<String>(json['rename_existing'])!
            : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String renameExisting;
  String description;
  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'rename_existing': renameExisting,
    'description': description,
    'gcode': gcode,
  };
}

class Mcu60 {
  Mcu60({
    required this.serial,
  });

  factory Mcu60.fromJson(Map<String, dynamic> json) => Mcu60(
    serial: json.containsKey('serial') ? asT<String>(json['serial'])! : '',
  );

  String serial;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'serial': serial,
  };
}

class Printer24 {
  Printer24({
    required this.kinematics,
    required this.maxVelocity,
    required this.maxAccel,
    required this.maxZVelocity,
    required this.maxZAccel,
    required this.squareCornerVelocity,
  });

  factory Printer24.fromJson(Map<String, dynamic> json) => Printer24(
    kinematics: json.containsKey('kinematics')
        ? asT<String>(json['kinematics'])!
        : '',
    maxVelocity: json.containsKey('max_velocity')
        ? asT<String>(json['max_velocity'])!
        : '',
    maxAccel: json.containsKey('max_accel')
        ? asT<String>(json['max_accel'])!
        : '',
    maxZVelocity: json.containsKey('max_z_velocity')
        ? asT<String>(json['max_z_velocity'])!
        : '',
    maxZAccel: json.containsKey('max_z_accel')
        ? asT<String>(json['max_z_accel'])!
        : '',
    squareCornerVelocity: json.containsKey('square_corner_velocity')
        ? asT<String>(json['square_corner_velocity'])!
        : '',
  );

  String kinematics;
  String maxVelocity;
  String maxAccel;
  String maxZVelocity;
  String maxZAccel;
  String squareCornerVelocity;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'kinematics': kinematics,
    'max_velocity': maxVelocity,
    'max_accel': maxAccel,
    'max_z_velocity': maxZVelocity,
    'max_z_accel': maxZAccel,
    'square_corner_velocity': squareCornerVelocity,
  };
}

class StepperX35 {
  StepperX35({
    required this.stepPin,
    required this.dirPin,
    required this.enablePin,
    required this.microsteps,
    required this.rotationDistance,
    required this.fullStepsPerRotation,
    required this.positionMin,
    required this.positionMax,
    required this.positionEndstop,
    required this.homingSpeed,
    required this.homingRetractDist,
    required this.secondHomingSpeed,
    required this.endstopPin,
  });

  factory StepperX35.fromJson(Map<String, dynamic> json) => StepperX35(
    stepPin:
    json.containsKey('step_pin') ? asT<String>(json['step_pin'])! : '',
    dirPin:
    json.containsKey('dir_pin') ? asT<String>(json['dir_pin'])! : '',
    enablePin: json.containsKey('enable_pin')
        ? asT<String>(json['enable_pin'])!
        : '',
    microsteps: json.containsKey('microsteps')
        ? asT<String>(json['microsteps'])!
        : '',
    rotationDistance: json.containsKey('rotation_distance')
        ? asT<String>(json['rotation_distance'])!
        : '',
    fullStepsPerRotation: json.containsKey('full_steps_per_rotation')
        ? asT<String>(json['full_steps_per_rotation'])!
        : '',
    positionMin: json.containsKey('position_min')
        ? asT<String>(json['position_min'])!
        : '',
    positionMax: json.containsKey('position_max')
        ? asT<String>(json['position_max'])!
        : '',
    positionEndstop: json.containsKey('position_endstop')
        ? asT<String>(json['position_endstop'])!
        : '',
    homingSpeed: json.containsKey('homing_speed')
        ? asT<String>(json['homing_speed'])!
        : '',
    homingRetractDist: json.containsKey('homing_retract_dist')
        ? asT<String>(json['homing_retract_dist'])!
        : '',
    secondHomingSpeed: json.containsKey('second_homing_speed')
        ? asT<String>(json['second_homing_speed'])!
        : '',
    endstopPin: json.containsKey('endstop_pin')
        ? asT<String>(json['endstop_pin'])!
        : '',
  );

  String stepPin;
  String dirPin;
  String enablePin;
  String microsteps;
  String rotationDistance;
  String fullStepsPerRotation;
  String positionMin;
  String positionMax;
  String positionEndstop;
  String homingSpeed;
  String homingRetractDist;
  String secondHomingSpeed;
  String endstopPin;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'step_pin': stepPin,
    'dir_pin': dirPin,
    'enable_pin': enablePin,
    'microsteps': microsteps,
    'rotation_distance': rotationDistance,
    'full_steps_per_rotation': fullStepsPerRotation,
    'position_min': positionMin,
    'position_max': positionMax,
    'position_endstop': positionEndstop,
    'homing_speed': homingSpeed,
    'homing_retract_dist': homingRetractDist,
    'second_homing_speed': secondHomingSpeed,
    'endstop_pin': endstopPin,
  };
}

class StepperY01 {
  StepperY01({
    required this.stepPin,
    required this.dirPin,
    required this.enablePin,
    required this.microsteps,
    required this.rotationDistance,
    required this.fullStepsPerRotation,
    required this.positionMin,
    required this.positionMax,
    required this.positionEndstop,
    required this.homingSpeed,
    required this.homingRetractDist,
    required this.secondHomingSpeed,
    required this.endstopPin,
  });

  factory StepperY01.fromJson(Map<String, dynamic> json) => StepperY01(
    stepPin:
    json.containsKey('step_pin') ? asT<String>(json['step_pin'])! : '',
    dirPin:
    json.containsKey('dir_pin') ? asT<String>(json['dir_pin'])! : '',
    enablePin: json.containsKey('enable_pin')
        ? asT<String>(json['enable_pin'])!
        : '',
    microsteps: json.containsKey('microsteps')
        ? asT<String>(json['microsteps'])!
        : '',
    rotationDistance: json.containsKey('rotation_distance')
        ? asT<String>(json['rotation_distance'])!
        : '',
    fullStepsPerRotation: json.containsKey('full_steps_per_rotation')
        ? asT<String>(json['full_steps_per_rotation'])!
        : '',
    positionMin: json.containsKey('position_min')
        ? asT<String>(json['position_min'])!
        : '',
    positionMax: json.containsKey('position_max')
        ? asT<String>(json['position_max'])!
        : '',
    positionEndstop: json.containsKey('position_endstop')
        ? asT<String>(json['position_endstop'])!
        : '',
    homingSpeed: json.containsKey('homing_speed')
        ? asT<String>(json['homing_speed'])!
        : '',
    homingRetractDist: json.containsKey('homing_retract_dist')
        ? asT<String>(json['homing_retract_dist'])!
        : '',
    secondHomingSpeed: json.containsKey('second_homing_speed')
        ? asT<String>(json['second_homing_speed'])!
        : '',
    endstopPin: json.containsKey('endstop_pin')
        ? asT<String>(json['endstop_pin'])!
        : '',
  );

  String stepPin;
  String dirPin;
  String enablePin;
  String microsteps;
  String rotationDistance;
  String fullStepsPerRotation;
  String positionMin;
  String positionMax;
  String positionEndstop;
  String homingSpeed;
  String homingRetractDist;
  String secondHomingSpeed;
  String endstopPin;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'step_pin': stepPin,
    'dir_pin': dirPin,
    'enable_pin': enablePin,
    'microsteps': microsteps,
    'rotation_distance': rotationDistance,
    'full_steps_per_rotation': fullStepsPerRotation,
    'position_min': positionMin,
    'position_max': positionMax,
    'position_endstop': positionEndstop,
    'homing_speed': homingSpeed,
    'homing_retract_dist': homingRetractDist,
    'second_homing_speed': secondHomingSpeed,
    'endstop_pin': endstopPin,
  };
}

class StepperZ29 {
  StepperZ29({
    required this.stepPin,
    required this.dirPin,
    required this.enablePin,
    required this.rotationDistance,
    required this.microsteps,
    required this.fullStepsPerRotation,
    required this.endstopPin,
    required this.positionMin,
    required this.positionMax,
    required this.homingSpeed,
    required this.homingRetractDist,
    required this.homingRetractSpeed,
    required this.secondHomingSpeed,
  });

  factory StepperZ29.fromJson(Map<String, dynamic> json) => StepperZ29(
    stepPin:
    json.containsKey('step_pin') ? asT<String>(json['step_pin'])! : '',
    dirPin:
    json.containsKey('dir_pin') ? asT<String>(json['dir_pin'])! : '',
    enablePin: json.containsKey('enable_pin')
        ? asT<String>(json['enable_pin'])!
        : '',
    rotationDistance: json.containsKey('rotation_distance')
        ? asT<String>(json['rotation_distance'])!
        : '',
    microsteps: json.containsKey('microsteps')
        ? asT<String>(json['microsteps'])!
        : '',
    fullStepsPerRotation: json.containsKey('full_steps_per_rotation')
        ? asT<String>(json['full_steps_per_rotation'])!
        : '',
    endstopPin: json.containsKey('endstop_pin')
        ? asT<String>(json['endstop_pin'])!
        : '',
    positionMin: json.containsKey('position_min')
        ? asT<String>(json['position_min'])!
        : '',
    positionMax: json.containsKey('position_max')
        ? asT<String>(json['position_max'])!
        : '',
    homingSpeed: json.containsKey('homing_speed')
        ? asT<String>(json['homing_speed'])!
        : '',
    homingRetractDist: json.containsKey('homing_retract_dist')
        ? asT<String>(json['homing_retract_dist'])!
        : '',
    homingRetractSpeed: json.containsKey('homing_retract_speed')
        ? asT<String>(json['homing_retract_speed'])!
        : '',
    secondHomingSpeed: json.containsKey('second_homing_speed')
        ? asT<String>(json['second_homing_speed'])!
        : '',
  );

  String stepPin;
  String dirPin;
  String enablePin;
  String rotationDistance;
  String microsteps;
  String fullStepsPerRotation;
  String endstopPin;
  String positionMin;
  String positionMax;
  String homingSpeed;
  String homingRetractDist;
  String homingRetractSpeed;
  String secondHomingSpeed;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'step_pin': stepPin,
    'dir_pin': dirPin,
    'enable_pin': enablePin,
    'rotation_distance': rotationDistance,
    'microsteps': microsteps,
    'full_steps_per_rotation': fullStepsPerRotation,
    'endstop_pin': endstopPin,
    'position_min': positionMin,
    'position_max': positionMax,
    'homing_speed': homingSpeed,
    'homing_retract_dist': homingRetractDist,
    'homing_retract_speed': homingRetractSpeed,
    'second_homing_speed': secondHomingSpeed,
  };
}

class StepperZ104 {
  StepperZ104({
    required this.stepPin,
    required this.dirPin,
    required this.enablePin,
    required this.rotationDistance,
    required this.microsteps,
    required this.fullStepsPerRotation,
  });

  factory StepperZ104.fromJson(Map<String, dynamic> json) => StepperZ104(
    stepPin:
    json.containsKey('step_pin') ? asT<String>(json['step_pin'])! : '',
    dirPin:
    json.containsKey('dir_pin') ? asT<String>(json['dir_pin'])! : '',
    enablePin: json.containsKey('enable_pin')
        ? asT<String>(json['enable_pin'])!
        : '',
    rotationDistance: json.containsKey('rotation_distance')
        ? asT<String>(json['rotation_distance'])!
        : '',
    microsteps: json.containsKey('microsteps')
        ? asT<String>(json['microsteps'])!
        : '',
    fullStepsPerRotation: json.containsKey('full_steps_per_rotation')
        ? asT<String>(json['full_steps_per_rotation'])!
        : '',
  );

  String stepPin;
  String dirPin;
  String enablePin;
  String rotationDistance;
  String microsteps;
  String fullStepsPerRotation;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'step_pin': stepPin,
    'dir_pin': dirPin,
    'enable_pin': enablePin,
    'rotation_distance': rotationDistance,
    'microsteps': microsteps,
    'full_steps_per_rotation': fullStepsPerRotation,
  };
}

class StepperZ272 {
  StepperZ272({
    required this.stepPin,
    required this.dirPin,
    required this.enablePin,
    required this.rotationDistance,
    required this.microsteps,
    required this.fullStepsPerRotation,
  });

  factory StepperZ272.fromJson(Map<String, dynamic> json) => StepperZ272(
    stepPin:
    json.containsKey('step_pin') ? asT<String>(json['step_pin'])! : '',
    dirPin:
    json.containsKey('dir_pin') ? asT<String>(json['dir_pin'])! : '',
    enablePin: json.containsKey('enable_pin')
        ? asT<String>(json['enable_pin'])!
        : '',
    rotationDistance: json.containsKey('rotation_distance')
        ? asT<String>(json['rotation_distance'])!
        : '',
    microsteps: json.containsKey('microsteps')
        ? asT<String>(json['microsteps'])!
        : '',
    fullStepsPerRotation: json.containsKey('full_steps_per_rotation')
        ? asT<String>(json['full_steps_per_rotation'])!
        : '',
  );

  String stepPin;
  String dirPin;
  String enablePin;
  String rotationDistance;
  String microsteps;
  String fullStepsPerRotation;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'step_pin': stepPin,
    'dir_pin': dirPin,
    'enable_pin': enablePin,
    'rotation_distance': rotationDistance,
    'microsteps': microsteps,
    'full_steps_per_rotation': fullStepsPerRotation,
  };
}

class Extruder87 {
  Extruder87({
    required this.stepPin,
    required this.dirPin,
    required this.enablePin,
    required this.microsteps,
    required this.rotationDistance,
    required this.gearRatio,
    required this.fullStepsPerRotation,
    required this.nozzleDiameter,
    required this.filamentDiameter,
    required this.minTemp,
    required this.maxTemp,
    required this.heaterPin,
    required this.sensorType,
    required this.sensorPin,
    required this.maxPower,
    required this.control,
    required this.pidKp,
    required this.pidKi,
    required this.pidKd,
    required this.pressureAdvance,
    required this.pressureAdvanceSmoothTime,
  });

  factory Extruder87.fromJson(Map<String, dynamic> json) => Extruder87(
    stepPin:
    json.containsKey('step_pin') ? asT<String>(json['step_pin'])! : '',
    dirPin:
    json.containsKey('dir_pin') ? asT<String>(json['dir_pin'])! : '',
    enablePin: json.containsKey('enable_pin')
        ? asT<String>(json['enable_pin'])!
        : '',
    microsteps: json.containsKey('microsteps')
        ? asT<String>(json['microsteps'])!
        : '',
    rotationDistance: json.containsKey('rotation_distance')
        ? asT<String>(json['rotation_distance'])!
        : '',
    gearRatio: json.containsKey('gear_ratio')
        ? asT<String>(json['gear_ratio'])!
        : '',
    fullStepsPerRotation: json.containsKey('full_steps_per_rotation')
        ? asT<String>(json['full_steps_per_rotation'])!
        : '',
    nozzleDiameter: json.containsKey('nozzle_diameter')
        ? asT<String>(json['nozzle_diameter'])!
        : '',
    filamentDiameter: json.containsKey('filament_diameter')
        ? asT<String>(json['filament_diameter'])!
        : '',
    minTemp:
    json.containsKey('min_temp') ? asT<String>(json['min_temp'])! : '',
    maxTemp:
    json.containsKey('max_temp') ? asT<String>(json['max_temp'])! : '',
    heaterPin: json.containsKey('heater_pin')
        ? asT<String>(json['heater_pin'])!
        : '',
    sensorType: json.containsKey('sensor_type')
        ? asT<String>(json['sensor_type'])!
        : '',
    sensorPin: json.containsKey('sensor_pin')
        ? asT<String>(json['sensor_pin'])!
        : '',
    maxPower: json.containsKey('max_power')
        ? asT<String>(json['max_power'])!
        : '',
    control:
    json.containsKey('control') ? asT<String>(json['control'])! : '',
    pidKp: json.containsKey('pid_kp') ? asT<String>(json['pid_kp'])! : '',
    pidKi: json.containsKey('pid_ki') ? asT<String>(json['pid_ki'])! : '',
    pidKd: json.containsKey('pid_kd') ? asT<String>(json['pid_kd'])! : '',
    pressureAdvance: json.containsKey('pressure_advance')
        ? asT<String>(json['pressure_advance'])!
        : '',
    pressureAdvanceSmoothTime:
    json.containsKey('pressure_advance_smooth_time')
        ? asT<String>(json['pressure_advance_smooth_time'])!
        : '',
  );

  String stepPin;
  String dirPin;
  String enablePin;
  String microsteps;
  String rotationDistance;
  String gearRatio;
  String fullStepsPerRotation;
  String nozzleDiameter;
  String filamentDiameter;
  String minTemp;
  String maxTemp;
  String heaterPin;
  String sensorType;
  String sensorPin;
  String maxPower;
  String control;
  String pidKp;
  String pidKi;
  String pidKd;
  String pressureAdvance;
  String pressureAdvanceSmoothTime;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'step_pin': stepPin,
    'dir_pin': dirPin,
    'enable_pin': enablePin,
    'microsteps': microsteps,
    'rotation_distance': rotationDistance,
    'gear_ratio': gearRatio,
    'full_steps_per_rotation': fullStepsPerRotation,
    'nozzle_diameter': nozzleDiameter,
    'filament_diameter': filamentDiameter,
    'min_temp': minTemp,
    'max_temp': maxTemp,
    'heater_pin': heaterPin,
    'sensor_type': sensorType,
    'sensor_pin': sensorPin,
    'max_power': maxPower,
    'control': control,
    'pid_kp': pidKp,
    'pid_ki': pidKi,
    'pid_kd': pidKd,
    'pressure_advance': pressureAdvance,
    'pressure_advance_smooth_time': pressureAdvanceSmoothTime,
  };
}

class HeaterBed97 {
  HeaterBed97({
    required this.heaterPin,
    required this.sensorType,
    required this.sensorPin,
    required this.maxPower,
    required this.control,
    required this.pidKp,
    required this.pidKi,
    required this.pidKd,
    required this.minTemp,
    required this.maxTemp,
  });

  factory HeaterBed97.fromJson(Map<String, dynamic> json) => HeaterBed97(
    heaterPin: json.containsKey('heater_pin')
        ? asT<String>(json['heater_pin'])!
        : '',
    sensorType: json.containsKey('sensor_type')
        ? asT<String>(json['sensor_type'])!
        : '',
    sensorPin: json.containsKey('sensor_pin')
        ? asT<String>(json['sensor_pin'])!
        : '',
    maxPower: json.containsKey('max_power')
        ? asT<String>(json['max_power'])!
        : '',
    control:
    json.containsKey('control') ? asT<String>(json['control'])! : '',
    pidKp: json.containsKey('pid_kp') ? asT<String>(json['pid_kp'])! : '',
    pidKi: json.containsKey('pid_ki') ? asT<String>(json['pid_ki'])! : '',
    pidKd: json.containsKey('pid_kd') ? asT<String>(json['pid_kd'])! : '',
    minTemp:
    json.containsKey('min_temp') ? asT<String>(json['min_temp'])! : '',
    maxTemp:
    json.containsKey('max_temp') ? asT<String>(json['max_temp'])! : '',
  );

  String heaterPin;
  String sensorType;
  String sensorPin;
  String maxPower;
  String control;
  String pidKp;
  String pidKi;
  String pidKd;
  String minTemp;
  String maxTemp;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'heater_pin': heaterPin,
    'sensor_type': sensorType,
    'sensor_pin': sensorPin,
    'max_power': maxPower,
    'control': control,
    'pid_kp': pidKp,
    'pid_ki': pidKi,
    'pid_kd': pidKd,
    'min_temp': minTemp,
    'max_temp': maxTemp,
  };
}

class Fan71 {
  Fan71({
    required this.pin,
    required this.maxPower,
  });

  factory Fan71.fromJson(Map<String, dynamic> json) => Fan71(
    pin: json.containsKey('pin') ? asT<String>(json['pin'])! : '',
    maxPower: json.containsKey('max_power')
        ? asT<String>(json['max_power'])!
        : '',
  );

  String pin;
  String maxPower;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'pin': pin,
    'max_power': maxPower,
  };
}

class HeaterFanFan198 {
  HeaterFanFan198({
    required this.pin,
    required this.shutdownSpeed,
    required this.heater,
    required this.heaterTemp,
    required this.fanSpeed,
  });

  factory HeaterFanFan198.fromJson(Map<String, dynamic> json) =>
      HeaterFanFan198(
        pin: json.containsKey('pin') ? asT<String>(json['pin'])! : '',
        shutdownSpeed: json.containsKey('shutdown_speed')
            ? asT<String>(json['shutdown_speed'])!
            : '',
        heater: json.containsKey('heater') ? asT<String>(json['heater'])! : '',
        heaterTemp: json.containsKey('heater_temp')
            ? asT<String>(json['heater_temp'])!
            : '',
        fanSpeed: json.containsKey('fan_speed')
            ? asT<String>(json['fan_speed'])!
            : '',
      );

  String pin;
  String shutdownSpeed;
  String heater;
  String heaterTemp;
  String fanSpeed;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'pin': pin,
    'shutdown_speed': shutdownSpeed,
    'heater': heater,
    'heater_temp': heaterTemp,
    'fan_speed': fanSpeed,
  };
}

class IdleTimeout86 {
  IdleTimeout86({
    required this.timeout,
  });

  factory IdleTimeout86.fromJson(Map<String, dynamic> json) => IdleTimeout86(
    timeout:
    json.containsKey('timeout') ? asT<String>(json['timeout'])! : '',
  );

  String timeout;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'timeout': timeout,
  };
}

class BedMesh13 {
  BedMesh13({
    required this.speed,
    required this.horizontalMoveZ,
    required this.meshMin,
    required this.meshMax,
    required this.probeCount,
    required this.algorithm,
    required this.bicubicTension,
    required this.meshPps,
  });

  factory BedMesh13.fromJson(Map<String, dynamic> json) => BedMesh13(
    speed: json.containsKey('speed') ? asT<String>(json['speed'])! : '',
    horizontalMoveZ: json.containsKey('horizontal_move_z')
        ? asT<String>(json['horizontal_move_z'])!
        : '',
    meshMin:
    json.containsKey('mesh_min') ? asT<String>(json['mesh_min'])! : '',
    meshMax:
    json.containsKey('mesh_max') ? asT<String>(json['mesh_max'])! : '',
    probeCount: json.containsKey('probe_count')
        ? asT<String>(json['probe_count'])!
        : '',
    algorithm: json.containsKey('algorithm')
        ? asT<String>(json['algorithm'])!
        : '',
    bicubicTension: json.containsKey('bicubic_tension')
        ? asT<String>(json['bicubic_tension'])!
        : '',
    meshPps:
    json.containsKey('mesh_pps') ? asT<String>(json['mesh_pps'])! : '',
  );

  String speed;
  String horizontalMoveZ;
  String meshMin;
  String meshMax;
  String probeCount;
  String algorithm;
  String bicubicTension;
  String meshPps;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'speed': speed,
    'horizontal_move_z': horizontalMoveZ,
    'mesh_min': meshMin,
    'mesh_max': meshMax,
    'probe_count': probeCount,
    'algorithm': algorithm,
    'bicubic_tension': bicubicTension,
    'mesh_pps': meshPps,
  };
}

class TemperatureSensor861 {
  TemperatureSensor861({
    required this.sensorType,
    required this.sensorMcu,
    required this.minTemp,
    required this.maxTemp,
  });

  factory TemperatureSensor861.fromJson(Map<String, dynamic> json) =>
      TemperatureSensor861(
        sensorType: json.containsKey('sensor_type')
            ? asT<String>(json['sensor_type'])!
            : '',
        sensorMcu: json.containsKey('sensor_mcu')
            ? asT<String>(json['sensor_mcu'])!
            : '',
        minTemp:
        json.containsKey('min_temp') ? asT<String>(json['min_temp'])! : '',
        maxTemp:
        json.containsKey('max_temp') ? asT<String>(json['max_temp'])! : '',
      );

  String sensorType;
  String sensorMcu;
  String minTemp;
  String maxTemp;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'sensor_type': sensorType,
    'sensor_mcu': sensorMcu,
    'min_temp': minTemp,
    'max_temp': maxTemp,
  };
}

class TemperatureSensorA6145086 {
  TemperatureSensorA6145086({
    required this.sensorType,
    required this.sensorPath,
    required this.minTemp,
    required this.maxTemp,
  });

  factory TemperatureSensorA6145086.fromJson(Map<String, dynamic> json) =>
      TemperatureSensorA6145086(
        sensorType: json.containsKey('sensor_type')
            ? asT<String>(json['sensor_type'])!
            : '',
        sensorPath: json.containsKey('sensor_path')
            ? asT<String>(json['sensor_path'])!
            : '',
        minTemp:
        json.containsKey('min_temp') ? asT<String>(json['min_temp'])! : '',
        maxTemp:
        json.containsKey('max_temp') ? asT<String>(json['max_temp'])! : '',
      );

  String sensorType;
  String sensorPath;
  String minTemp;
  String maxTemp;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'sensor_type': sensorType,
    'sensor_path': sensorPath,
    'min_temp': minTemp,
    'max_temp': maxTemp,
  };
}

class DelayedGcodeKinematicPosition46 {
  DelayedGcodeKinematicPosition46({
    required this.initialDuration,
    required this.gcode,
  });

  factory DelayedGcodeKinematicPosition46.fromJson(Map<String, dynamic> json) =>
      DelayedGcodeKinematicPosition46(
        initialDuration: json.containsKey('initial_duration')
            ? asT<String>(json['initial_duration'])!
            : '',
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String initialDuration;
  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'initial_duration': initialDuration,
    'gcode': gcode,
  };
}

class GcodeArcs08 {
  GcodeArcs08({
    required this.resolution,
  });

  factory GcodeArcs08.fromJson(Map<String, dynamic> json) => GcodeArcs08(
    resolution: json.containsKey('resolution')
        ? asT<String>(json['resolution'])!
        : '',
  );

  String resolution;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'resolution': resolution,
  };
}

class VerifyHeaterHeaterBed54 {
  VerifyHeaterHeaterBed54({
    required this.maxError,
    required this.checkGainTime,
    required this.hysteresis,
    required this.heatingGain,
  });

  factory VerifyHeaterHeaterBed54.fromJson(Map<String, dynamic> json) =>
      VerifyHeaterHeaterBed54(
        maxError: json.containsKey('max_error')
            ? asT<String>(json['max_error'])!
            : '',
        checkGainTime: json.containsKey('check_gain_time')
            ? asT<String>(json['check_gain_time'])!
            : '',
        hysteresis: json.containsKey('hysteresis')
            ? asT<String>(json['hysteresis'])!
            : '',
        heatingGain: json.containsKey('heating_gain')
            ? asT<String>(json['heating_gain'])!
            : '',
      );

  String maxError;
  String checkGainTime;
  String hysteresis;
  String heatingGain;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'max_error': maxError,
    'check_gain_time': checkGainTime,
    'hysteresis': hysteresis,
    'heating_gain': heatingGain,
  };
}

class InputShaper21 {
  InputShaper21({
    required this.shaperTypeX,
    required this.shaperFreqX,
    required this.shaperTypeY,
    required this.shaperFreqY,
  });

  factory InputShaper21.fromJson(Map<String, dynamic> json) => InputShaper21(
    shaperTypeX: json.containsKey('shaper_type_x')
        ? asT<String>(json['shaper_type_x'])!
        : '',
    shaperFreqX: json.containsKey('shaper_freq_x')
        ? asT<String>(json['shaper_freq_x'])!
        : '',
    shaperTypeY: json.containsKey('shaper_type_y')
        ? asT<String>(json['shaper_type_y'])!
        : '',
    shaperFreqY: json.containsKey('shaper_freq_y')
        ? asT<String>(json['shaper_freq_y'])!
        : '',
  );

  String shaperTypeX;
  String shaperFreqX;
  String shaperTypeY;
  String shaperFreqY;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'shaper_type_x': shaperTypeX,
    'shaper_freq_x': shaperFreqX,
    'shaper_type_y': shaperTypeY,
    'shaper_freq_y': shaperFreqY,
  };
}

class Probe13 {
  Probe13({
    required this.pin,
    required this.xOffset,
    required this.yOffset,
    required this.zOffset,
    required this.speed,
    required this.samples,
    required this.samplesResult,
    required this.sampleRetractDist,
    required this.samplesTolerance,
    required this.samplesToleranceRetries,
  });

  factory Probe13.fromJson(Map<String, dynamic> json) => Probe13(
    pin: json.containsKey('pin') ? asT<String>(json['pin'])! : '',
    xOffset:
    json.containsKey('x_offset') ? asT<String>(json['x_offset'])! : '',
    yOffset:
    json.containsKey('y_offset') ? asT<String>(json['y_offset'])! : '',
    zOffset:
    json.containsKey('z_offset') ? asT<String>(json['z_offset'])! : '',
    speed: json.containsKey('speed') ? asT<String>(json['speed'])! : '',
    samples:
    json.containsKey('samples') ? asT<String>(json['samples'])! : '',
    samplesResult: json.containsKey('samples_result')
        ? asT<String>(json['samples_result'])!
        : '',
    sampleRetractDist: json.containsKey('sample_retract_dist')
        ? asT<String>(json['sample_retract_dist'])!
        : '',
    samplesTolerance: json.containsKey('samples_tolerance')
        ? asT<String>(json['samples_tolerance'])!
        : '',
    samplesToleranceRetries: json.containsKey('samples_tolerance_retries')
        ? asT<String>(json['samples_tolerance_retries'])!
        : '',
  );

  String pin;
  String xOffset;
  String yOffset;
  String zOffset;
  String speed;
  String samples;
  String samplesResult;
  String sampleRetractDist;
  String samplesTolerance;
  String samplesToleranceRetries;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'pin': pin,
    'x_offset': xOffset,
    'y_offset': yOffset,
    'z_offset': zOffset,
    'speed': speed,
    'samples': samples,
    'samples_result': samplesResult,
    'sample_retract_dist': sampleRetractDist,
    'samples_tolerance': samplesTolerance,
    'samples_tolerance_retries': samplesToleranceRetries,
  };
}

class ZTilt04 {
  ZTilt04({
    required this.zPositions,
    required this.points,
    required this.speed,
    required this.horizontalMoveZ,
    required this.retries,
    required this.retryTolerance,
  });

  factory ZTilt04.fromJson(Map<String, dynamic> json) => ZTilt04(
    zPositions: json.containsKey('z_positions')
        ? asT<String>(json['z_positions'])!
        : '',
    points: json.containsKey('points') ? asT<String>(json['points'])! : '',
    speed: json.containsKey('speed') ? asT<String>(json['speed'])! : '',
    horizontalMoveZ: json.containsKey('horizontal_move_z')
        ? asT<String>(json['horizontal_move_z'])!
        : '',
    retries:
    json.containsKey('retries') ? asT<String>(json['retries'])! : '',
    retryTolerance: json.containsKey('retry_tolerance')
        ? asT<String>(json['retry_tolerance'])!
        : '',
  );

  String zPositions;
  String points;
  String speed;
  String horizontalMoveZ;
  String retries;
  String retryTolerance;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'z_positions': zPositions,
    'points': points,
    'speed': speed,
    'horizontal_move_z': horizontalMoveZ,
    'retries': retries,
    'retry_tolerance': retryTolerance,
  };
}

class Tmc2209StepperX78 {
  Tmc2209StepperX78({
    required this.uartPin,
    required this.interpolate,
    required this.runCurrent,
    required this.holdCurrent,
    required this.senseResistor,
    required this.stealthchopThreshold,
  });

  factory Tmc2209StepperX78.fromJson(Map<String, dynamic> json) =>
      Tmc2209StepperX78(
        uartPin:
        json.containsKey('uart_pin') ? asT<String>(json['uart_pin'])! : '',
        interpolate: json.containsKey('interpolate')
            ? asT<String>(json['interpolate'])!
            : '',
        runCurrent: json.containsKey('run_current')
            ? asT<String>(json['run_current'])!
            : '',
        holdCurrent: json.containsKey('hold_current')
            ? asT<String>(json['hold_current'])!
            : '',
        senseResistor: json.containsKey('sense_resistor')
            ? asT<String>(json['sense_resistor'])!
            : '',
        stealthchopThreshold: json.containsKey('stealthchop_threshold')
            ? asT<String>(json['stealthchop_threshold'])!
            : '',
      );

  String uartPin;
  String interpolate;
  String runCurrent;
  String holdCurrent;
  String senseResistor;
  String stealthchopThreshold;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'uart_pin': uartPin,
    'interpolate': interpolate,
    'run_current': runCurrent,
    'hold_current': holdCurrent,
    'sense_resistor': senseResistor,
    'stealthchop_threshold': stealthchopThreshold,
  };
}

class Tmc2209StepperY33 {
  Tmc2209StepperY33({
    required this.uartPin,
    required this.interpolate,
    required this.runCurrent,
    required this.holdCurrent,
    required this.senseResistor,
    required this.stealthchopThreshold,
  });

  factory Tmc2209StepperY33.fromJson(Map<String, dynamic> json) =>
      Tmc2209StepperY33(
        uartPin:
        json.containsKey('uart_pin') ? asT<String>(json['uart_pin'])! : '',
        interpolate: json.containsKey('interpolate')
            ? asT<String>(json['interpolate'])!
            : '',
        runCurrent: json.containsKey('run_current')
            ? asT<String>(json['run_current'])!
            : '',
        holdCurrent: json.containsKey('hold_current')
            ? asT<String>(json['hold_current'])!
            : '',
        senseResistor: json.containsKey('sense_resistor')
            ? asT<String>(json['sense_resistor'])!
            : '',
        stealthchopThreshold: json.containsKey('stealthchop_threshold')
            ? asT<String>(json['stealthchop_threshold'])!
            : '',
      );

  String uartPin;
  String interpolate;
  String runCurrent;
  String holdCurrent;
  String senseResistor;
  String stealthchopThreshold;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'uart_pin': uartPin,
    'interpolate': interpolate,
    'run_current': runCurrent,
    'hold_current': holdCurrent,
    'sense_resistor': senseResistor,
    'stealthchop_threshold': stealthchopThreshold,
  };
}

class Tmc2209StepperZ78 {
  Tmc2209StepperZ78({
    required this.uartPin,
    required this.interpolate,
    required this.runCurrent,
    required this.holdCurrent,
    required this.stealthchopThreshold,
  });

  factory Tmc2209StepperZ78.fromJson(Map<String, dynamic> json) =>
      Tmc2209StepperZ78(
        uartPin:
        json.containsKey('uart_pin') ? asT<String>(json['uart_pin'])! : '',
        interpolate: json.containsKey('interpolate')
            ? asT<String>(json['interpolate'])!
            : '',
        runCurrent: json.containsKey('run_current')
            ? asT<String>(json['run_current'])!
            : '',
        holdCurrent: json.containsKey('hold_current')
            ? asT<String>(json['hold_current'])!
            : '',
        stealthchopThreshold: json.containsKey('stealthchop_threshold')
            ? asT<String>(json['stealthchop_threshold'])!
            : '',
      );

  String uartPin;
  String interpolate;
  String runCurrent;
  String holdCurrent;
  String stealthchopThreshold;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'uart_pin': uartPin,
    'interpolate': interpolate,
    'run_current': runCurrent,
    'hold_current': holdCurrent,
    'stealthchop_threshold': stealthchopThreshold,
  };
}

class Tmc2209Extruder34 {
  Tmc2209Extruder34({
    required this.uartPin,
    required this.interpolate,
    required this.runCurrent,
    required this.holdCurrent,
    required this.senseResistor,
    required this.stealthchopThreshold,
  });

  factory Tmc2209Extruder34.fromJson(Map<String, dynamic> json) =>
      Tmc2209Extruder34(
        uartPin:
        json.containsKey('uart_pin') ? asT<String>(json['uart_pin'])! : '',
        interpolate: json.containsKey('interpolate')
            ? asT<String>(json['interpolate'])!
            : '',
        runCurrent: json.containsKey('run_current')
            ? asT<String>(json['run_current'])!
            : '',
        holdCurrent: json.containsKey('hold_current')
            ? asT<String>(json['hold_current'])!
            : '',
        senseResistor: json.containsKey('sense_resistor')
            ? asT<String>(json['sense_resistor'])!
            : '',
        stealthchopThreshold: json.containsKey('stealthchop_threshold')
            ? asT<String>(json['stealthchop_threshold'])!
            : '',
      );

  String uartPin;
  String interpolate;
  String runCurrent;
  String holdCurrent;
  String senseResistor;
  String stealthchopThreshold;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'uart_pin': uartPin,
    'interpolate': interpolate,
    'run_current': runCurrent,
    'hold_current': holdCurrent,
    'sense_resistor': senseResistor,
    'stealthchop_threshold': stealthchopThreshold,
  };
}

class Tmc2209StepperZ175 {
  Tmc2209StepperZ175({
    required this.uartPin,
    required this.interpolate,
    required this.runCurrent,
    required this.holdCurrent,
    required this.stealthchopThreshold,
  });

  factory Tmc2209StepperZ175.fromJson(Map<String, dynamic> json) =>
      Tmc2209StepperZ175(
        uartPin:
        json.containsKey('uart_pin') ? asT<String>(json['uart_pin'])! : '',
        interpolate: json.containsKey('interpolate')
            ? asT<String>(json['interpolate'])!
            : '',
        runCurrent: json.containsKey('run_current')
            ? asT<String>(json['run_current'])!
            : '',
        holdCurrent: json.containsKey('hold_current')
            ? asT<String>(json['hold_current'])!
            : '',
        stealthchopThreshold: json.containsKey('stealthchop_threshold')
            ? asT<String>(json['stealthchop_threshold'])!
            : '',
      );

  String uartPin;
  String interpolate;
  String runCurrent;
  String holdCurrent;
  String stealthchopThreshold;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'uart_pin': uartPin,
    'interpolate': interpolate,
    'run_current': runCurrent,
    'hold_current': holdCurrent,
    'stealthchop_threshold': stealthchopThreshold,
  };
}

class Tmc2209StepperZ216 {
  Tmc2209StepperZ216({
    required this.uartPin,
    required this.interpolate,
    required this.runCurrent,
    required this.holdCurrent,
    required this.stealthchopThreshold,
  });

  factory Tmc2209StepperZ216.fromJson(Map<String, dynamic> json) =>
      Tmc2209StepperZ216(
        uartPin:
        json.containsKey('uart_pin') ? asT<String>(json['uart_pin'])! : '',
        interpolate: json.containsKey('interpolate')
            ? asT<String>(json['interpolate'])!
            : '',
        runCurrent: json.containsKey('run_current')
            ? asT<String>(json['run_current'])!
            : '',
        holdCurrent: json.containsKey('hold_current')
            ? asT<String>(json['hold_current'])!
            : '',
        stealthchopThreshold: json.containsKey('stealthchop_threshold')
            ? asT<String>(json['stealthchop_threshold'])!
            : '',
      );

  String uartPin;
  String interpolate;
  String runCurrent;
  String holdCurrent;
  String stealthchopThreshold;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'uart_pin': uartPin,
    'interpolate': interpolate,
    'run_current': runCurrent,
    'hold_current': holdCurrent,
    'stealthchop_threshold': stealthchopThreshold,
  };
}

class BoardPins95 {
  BoardPins95({
    required this.aliases,
  });

  factory BoardPins95.fromJson(Map<String, dynamic> json) => BoardPins95(
    aliases:
    json.containsKey('aliases') ? asT<String>(json['aliases'])! : '',
  );

  String aliases;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'aliases': aliases,
  };
}

class Display01 {
  Display01({
    required this.lcdType,
    required this.csPin,
    required this.a0Pin,
    required this.rstPin,
    required this.contrast,
    required this.encoderPins,
    required this.clickPin,
    required this.spiSoftwareMisoPin,
    required this.spiSoftwareMosiPin,
    required this.spiSoftwareSclkPin,
  });

  factory Display01.fromJson(Map<String, dynamic> json) => Display01(
    lcdType:
    json.containsKey('lcd_type') ? asT<String>(json['lcd_type'])! : '',
    csPin: json.containsKey('cs_pin') ? asT<String>(json['cs_pin'])! : '',
    a0Pin: json.containsKey('a0_pin') ? asT<String>(json['a0_pin'])! : '',
    rstPin:
    json.containsKey('rst_pin') ? asT<String>(json['rst_pin'])! : '',
    contrast:
    json.containsKey('contrast') ? asT<String>(json['contrast'])! : '',
    encoderPins: json.containsKey('encoder_pins')
        ? asT<String>(json['encoder_pins'])!
        : '',
    clickPin: json.containsKey('click_pin')
        ? asT<String>(json['click_pin'])!
        : '',
    spiSoftwareMisoPin: json.containsKey('spi_software_miso_pin')
        ? asT<String>(json['spi_software_miso_pin'])!
        : '',
    spiSoftwareMosiPin: json.containsKey('spi_software_mosi_pin')
        ? asT<String>(json['spi_software_mosi_pin'])!
        : '',
    spiSoftwareSclkPin: json.containsKey('spi_software_sclk_pin')
        ? asT<String>(json['spi_software_sclk_pin'])!
        : '',
  );

  String lcdType;
  String csPin;
  String a0Pin;
  String rstPin;
  String contrast;
  String encoderPins;
  String clickPin;
  String spiSoftwareMisoPin;
  String spiSoftwareMosiPin;
  String spiSoftwareSclkPin;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'lcd_type': lcdType,
    'cs_pin': csPin,
    'a0_pin': a0Pin,
    'rst_pin': rstPin,
    'contrast': contrast,
    'encoder_pins': encoderPins,
    'click_pin': clickPin,
    'spi_software_miso_pin': spiSoftwareMisoPin,
    'spi_software_mosi_pin': spiSoftwareMosiPin,
    'spi_software_sclk_pin': spiSoftwareSclkPin,
  };
}

class OutputPinBeeper39 {
  OutputPinBeeper39({
    required this.pin,
  });

  factory OutputPinBeeper39.fromJson(Map<String, dynamic> json) =>
      OutputPinBeeper39(
        pin: json.containsKey('pin') ? asT<String>(json['pin'])! : '',
      );

  String pin;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'pin': pin,
  };
}

class NeopixelFysetcMini1286414 {
  NeopixelFysetcMini1286414({
    required this.pin,
    required this.chainCount,
    required this.colorOrder,
    required this.initialRed,
    required this.initialGreen,
    required this.initialBlue,
  });

  factory NeopixelFysetcMini1286414.fromJson(Map<String, dynamic> json) =>
      NeopixelFysetcMini1286414(
        pin: json.containsKey('pin') ? asT<String>(json['pin'])! : '',
        chainCount: json.containsKey('chain_count')
            ? asT<String>(json['chain_count'])!
            : '',
        colorOrder: json.containsKey('color_order')
            ? asT<String>(json['color_order'])!
            : '',
        initialRed: json.containsKey('initial_red')
            ? asT<String>(json['initial_red'])!
            : '',
        initialGreen: json.containsKey('initial_green')
            ? asT<String>(json['initial_green'])!
            : '',
        initialBlue: json.containsKey('initial_blue')
            ? asT<String>(json['initial_blue'])!
            : '',
      );

  String pin;
  String chainCount;
  String colorOrder;
  String initialRed;
  String initialGreen;
  String initialBlue;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'pin': pin,
    'chain_count': chainCount,
    'color_order': colorOrder,
    'initial_red': initialRed,
    'initial_green': initialGreen,
    'initial_blue': initialBlue,
  };
}

class GcodeMacroG3249 {
  GcodeMacroG3249({
    required this.gcode,
  });

  factory GcodeMacroG3249.fromJson(Map<String, dynamic> json) =>
      GcodeMacroG3249(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
  };
}

class GcodeMacroPrintStart05 {
  GcodeMacroPrintStart05({
    required this.gcode,
  });

  factory GcodeMacroPrintStart05.fromJson(Map<String, dynamic> json) =>
      GcodeMacroPrintStart05(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
  };
}

class GcodeMacroPrintEnd16 {
  GcodeMacroPrintEnd16({
    required this.gcode,
  });

  factory GcodeMacroPrintEnd16.fromJson(Map<String, dynamic> json) =>
      GcodeMacroPrintEnd16(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
  };
}

class VirtualSdcard65 {
  VirtualSdcard65({
    required this.path,
  });

  factory VirtualSdcard65.fromJson(Map<String, dynamic> json) =>
      VirtualSdcard65(
        path: json.containsKey('path') ? asT<String>(json['path'])! : '',
      );

  String path;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'path': path,
  };
}

class GcodeMacroCancelPrint13 {
  GcodeMacroCancelPrint13({
    required this.description,
    required this.renameExisting,
    required this.gcode,
  });

  factory GcodeMacroCancelPrint13.fromJson(Map<String, dynamic> json) =>
      GcodeMacroCancelPrint13(
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
        renameExisting: json.containsKey('rename_existing')
            ? asT<String>(json['rename_existing'])!
            : '',
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String description;
  String renameExisting;
  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'description': description,
    'rename_existing': renameExisting,
    'gcode': gcode,
  };
}

class Settings41 {
  Settings41({
    required this.mcu,
    required this.gcodeMacroUserVariables,
    required this.respond,
    required this.gcodeMacroProbeVariables,
    required this.gcodeMacroKlickyCheckVariablesVersion,
    required this.gcodeMacroKlickydebug,
    required this.gcodeMacroExitPoint,
    required this.gcodeMacroEntryPoint,
    required this.gcodeMacroHomingVariables,
    required this.gcodeMacroAttachProbeLock,
    required this.gcodeMacroDockProbeUnlock,
    required this.gcodeMacroProbeUnlock,
    required this.gcodeMacroProbeLock,
    required this.gcodeMacroDeployklickydock,
    required this.gcodeMacroRetractklickydock,
    required this.gcodeMacroAttachProbe,
    required this.gcodeMacroDockProbe,
    required this.gcodeMacroProbeCalibrate,
    required this.gcodeMacroProbeAccuracy,
    required this.forceMove,
    required this.homingOverride,
    required this.gcodeMacroUmbilicalPath,
    required this.gcodeMacroHomeZ,
    required this.gcodeMacroCheckprobe,
    required this.gcodeMacroSetprobestate,
    required this.gcodeMacroParkToolhead,
    required this.gcodeMacroKlickyStatusReady,
    required this.gcodeMacroKlickyStatusBusy,
    required this.gcodeMacroKlickyStatusLeveling,
    required this.gcodeMacroKlickyStatusHoming,
    required this.gcodeMacroKlickyStatusCleaning,
    required this.gcodeMacroKlickyStatusMeshing,
    required this.gcodeMacroKlickyStatusCalibratingZ,
    required this.gcodeMacroBedMeshCalibrate,
    required this.gcodeMacroZTiltAdjust,
    required this.heaterBed,
    required this.verifyHeaterHeaterBed,
    required this.fan,
    required this.heaterFanFan1,
    required this.idleTimeout,
    required this.bedMesh,
    required this.temperatureSensor8,
    required this.temperatureSensorA61450,
    required this.delayedGcodeKinematicPosition,
    required this.gcodeArcs,
    required this.inputShaper,
    required this.probe,
    required this.zTilt,
    required this.tmc2209StepperX,
    required this.stepperX,
    required this.tmc2209StepperY,
    required this.stepperY,
    required this.tmc2209StepperZ,
    required this.stepperZ,
    required this.tmc2209Extruder,
    required this.extruder,
    required this.tmc2209StepperZ1,
    required this.stepperZ1,
    required this.tmc2209StepperZ2,
    required this.stepperZ2,
    required this.boardPins,
    required this.display,
    required this.outputPinBeeper,
    required this.neopixelFysetcMini12864,
    required this.gcodeMacroG32,
    required this.gcodeMacroPrintStart,
    required this.gcodeMacroPrintEnd,
    required this.virtualSdcard,
    required this.pauseResume,
    required this.gcodeMacroCancelPrint,
    required this.printer,
    required this.verifyHeaterExtruder,
  });

  factory Settings41.fromJson(Map<String, dynamic> json) => Settings41(
    mcu: json.containsKey('mcu')
        ? json['mcu'] == null
        ? null
        : Mcu02.fromJson(asT<Map<String, dynamic>>(json['mcu'])!)
        : null,
    gcodeMacroUserVariables: json.containsKey('gcode_macro _user_variables')
        ? json['gcode_macro _user_variables'] == null
        ? null
        : GcodeMacroUserVariables58.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro _user_variables'])!)
        : null,
    respond: json.containsKey('respond')
        ? json['respond'] == null
        ? null
        : Respond86.fromJson(
        asT<Map<String, dynamic>>(json['respond'])!)
        : null,
    gcodeMacroProbeVariables: json
        .containsKey('gcode_macro _probe_variables')
        ? json['gcode_macro _probe_variables'] == null
        ? null
        : GcodeMacroProbeVariables86.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro _probe_variables'])!)
        : null,
    gcodeMacroKlickyCheckVariablesVersion: json
        .containsKey('gcode_macro _klicky_check_variables_version')
        ? json['gcode_macro _klicky_check_variables_version'] == null
        ? null
        : GcodeMacroKlickyCheckVariablesVersion20.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _klicky_check_variables_version'])!)
        : null,
    gcodeMacroKlickydebug: json.containsKey('gcode_macro _klickydebug')
        ? json['gcode_macro _klickydebug'] == null
        ? null
        : GcodeMacroKlickydebug50.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro _klickydebug'])!)
        : null,
    gcodeMacroExitPoint: json.containsKey('gcode_macro _exit_point')
        ? json['gcode_macro _exit_point'] == null
        ? null
        : GcodeMacroExitPoint45.fromJson(
        asT<Map<String, dynamic>>(json['gcode_macro _exit_point'])!)
        : null,
    gcodeMacroEntryPoint: json.containsKey('gcode_macro _entry_point')
        ? json['gcode_macro _entry_point'] == null
        ? null
        : GcodeMacroEntryPoint77.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro _entry_point'])!)
        : null,
    gcodeMacroHomingVariables:
    json.containsKey('gcode_macro _homing_variables')
        ? json['gcode_macro _homing_variables'] == null
        ? null
        : GcodeMacroHomingVariables62.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _homing_variables'])!)
        : null,
    gcodeMacroAttachProbeLock:
    json.containsKey('gcode_macro attach_probe_lock')
        ? json['gcode_macro attach_probe_lock'] == null
        ? null
        : GcodeMacroAttachProbeLock87.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro attach_probe_lock'])!)
        : null,
    gcodeMacroDockProbeUnlock:
    json.containsKey('gcode_macro dock_probe_unlock')
        ? json['gcode_macro dock_probe_unlock'] == null
        ? null
        : GcodeMacroDockProbeUnlock82.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro dock_probe_unlock'])!)
        : null,
    gcodeMacroProbeUnlock: json.containsKey('gcode_macro _probe_unlock')
        ? json['gcode_macro _probe_unlock'] == null
        ? null
        : GcodeMacroProbeUnlock31.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro _probe_unlock'])!)
        : null,
    gcodeMacroProbeLock: json.containsKey('gcode_macro _probe_lock')
        ? json['gcode_macro _probe_lock'] == null
        ? null
        : GcodeMacroProbeLock67.fromJson(
        asT<Map<String, dynamic>>(json['gcode_macro _probe_lock'])!)
        : null,
    gcodeMacroDeployklickydock:
    json.containsKey('gcode_macro _deployklickydock')
        ? json['gcode_macro _deployklickydock'] == null
        ? null
        : GcodeMacroDeployklickydock22.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _deployklickydock'])!)
        : null,
    gcodeMacroRetractklickydock:
    json.containsKey('gcode_macro _retractklickydock')
        ? json['gcode_macro _retractklickydock'] == null
        ? null
        : GcodeMacroRetractklickydock32.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _retractklickydock'])!)
        : null,
    gcodeMacroAttachProbe: json.containsKey('gcode_macro attach_probe')
        ? json['gcode_macro attach_probe'] == null
        ? null
        : GcodeMacroAttachProbe65.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro attach_probe'])!)
        : null,
    gcodeMacroDockProbe: json.containsKey('gcode_macro dock_probe')
        ? json['gcode_macro dock_probe'] == null
        ? null
        : GcodeMacroDockProbe55.fromJson(
        asT<Map<String, dynamic>>(json['gcode_macro dock_probe'])!)
        : null,
    gcodeMacroProbeCalibrate: json
        .containsKey('gcode_macro probe_calibrate')
        ? json['gcode_macro probe_calibrate'] == null
        ? null
        : GcodeMacroProbeCalibrate08.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro probe_calibrate'])!)
        : null,
    gcodeMacroProbeAccuracy: json.containsKey('gcode_macro probe_accuracy')
        ? json['gcode_macro probe_accuracy'] == null
        ? null
        : GcodeMacroProbeAccuracy32.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro probe_accuracy'])!)
        : null,
    forceMove: json.containsKey('force_move')
        ? json['force_move'] == null
        ? null
        : ForceMove86.fromJson(
        asT<Map<String, dynamic>>(json['force_move'])!)
        : null,
    homingOverride: json.containsKey('homing_override')
        ? json['homing_override'] == null
        ? null
        : HomingOverride58.fromJson(
        asT<Map<String, dynamic>>(json['homing_override'])!)
        : null,
    gcodeMacroUmbilicalPath: json.containsKey('gcode_macro _umbilical_path')
        ? json['gcode_macro _umbilical_path'] == null
        ? null
        : GcodeMacroUmbilicalPath08.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro _umbilical_path'])!)
        : null,
    gcodeMacroHomeZ: json.containsKey('gcode_macro _home_z_')
        ? json['gcode_macro _home_z_'] == null
        ? null
        : GcodeMacroHomeZ36.fromJson(
        asT<Map<String, dynamic>>(json['gcode_macro _home_z_'])!)
        : null,
    gcodeMacroCheckprobe: json.containsKey('gcode_macro _checkprobe')
        ? json['gcode_macro _checkprobe'] == null
        ? null
        : GcodeMacroCheckprobe70.fromJson(
        asT<Map<String, dynamic>>(json['gcode_macro _checkprobe'])!)
        : null,
    gcodeMacroSetprobestate: json.containsKey('gcode_macro _setprobestate')
        ? json['gcode_macro _setprobestate'] == null
        ? null
        : GcodeMacroSetprobestate63.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro _setprobestate'])!)
        : null,
    gcodeMacroParkToolhead: json.containsKey('gcode_macro _park_toolhead')
        ? json['gcode_macro _park_toolhead'] == null
        ? null
        : GcodeMacroParkToolhead24.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro _park_toolhead'])!)
        : null,
    gcodeMacroKlickyStatusReady:
    json.containsKey('gcode_macro _klicky_status_ready')
        ? json['gcode_macro _klicky_status_ready'] == null
        ? null
        : GcodeMacroKlickyStatusReady21.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _klicky_status_ready'])!)
        : null,
    gcodeMacroKlickyStatusBusy:
    json.containsKey('gcode_macro _klicky_status_busy')
        ? json['gcode_macro _klicky_status_busy'] == null
        ? null
        : GcodeMacroKlickyStatusBusy64.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _klicky_status_busy'])!)
        : null,
    gcodeMacroKlickyStatusLeveling:
    json.containsKey('gcode_macro _klicky_status_leveling')
        ? json['gcode_macro _klicky_status_leveling'] == null
        ? null
        : GcodeMacroKlickyStatusLeveling34.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _klicky_status_leveling'])!)
        : null,
    gcodeMacroKlickyStatusHoming:
    json.containsKey('gcode_macro _klicky_status_homing')
        ? json['gcode_macro _klicky_status_homing'] == null
        ? null
        : GcodeMacroKlickyStatusHoming57.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _klicky_status_homing'])!)
        : null,
    gcodeMacroKlickyStatusCleaning:
    json.containsKey('gcode_macro _klicky_status_cleaning')
        ? json['gcode_macro _klicky_status_cleaning'] == null
        ? null
        : GcodeMacroKlickyStatusCleaning85.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _klicky_status_cleaning'])!)
        : null,
    gcodeMacroKlickyStatusMeshing:
    json.containsKey('gcode_macro _klicky_status_meshing')
        ? json['gcode_macro _klicky_status_meshing'] == null
        ? null
        : GcodeMacroKlickyStatusMeshing13.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _klicky_status_meshing'])!)
        : null,
    gcodeMacroKlickyStatusCalibratingZ:
    json.containsKey('gcode_macro _klicky_status_calibrating_z')
        ? json['gcode_macro _klicky_status_calibrating_z'] == null
        ? null
        : GcodeMacroKlickyStatusCalibratingZ38.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro _klicky_status_calibrating_z'])!)
        : null,
    gcodeMacroBedMeshCalibrate:
    json.containsKey('gcode_macro bed_mesh_calibrate')
        ? json['gcode_macro bed_mesh_calibrate'] == null
        ? null
        : GcodeMacroBedMeshCalibrate70.fromJson(
        asT<Map<String, dynamic>>(
            json['gcode_macro bed_mesh_calibrate'])!)
        : null,
    gcodeMacroZTiltAdjust: json.containsKey('gcode_macro z_tilt_adjust')
        ? json['gcode_macro z_tilt_adjust'] == null
        ? null
        : GcodeMacroZTiltAdjust81.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro z_tilt_adjust'])!)
        : null,
    heaterBed: json.containsKey('heater_bed')
        ? json['heater_bed'] == null
        ? null
        : HeaterBed98.fromJson(
        asT<Map<String, dynamic>>(json['heater_bed'])!)
        : null,
    verifyHeaterHeaterBed: json.containsKey('verify_heater heater_bed')
        ? json['verify_heater heater_bed'] == null
        ? null
        : VerifyHeaterHeaterBed56.fromJson(asT<Map<String, dynamic>>(
        json['verify_heater heater_bed'])!)
        : null,
    fan: json.containsKey('fan')
        ? json['fan'] == null
        ? null
        : Fan34.fromJson(asT<Map<String, dynamic>>(json['fan'])!)
        : null,
    heaterFanFan1: json.containsKey('heater_fan fan1')
        ? json['heater_fan fan1'] == null
        ? null
        : HeaterFanFan130.fromJson(
        asT<Map<String, dynamic>>(json['heater_fan fan1'])!)
        : null,
    idleTimeout: json.containsKey('idle_timeout')
        ? json['idle_timeout'] == null
        ? null
        : IdleTimeout09.fromJson(
        asT<Map<String, dynamic>>(json['idle_timeout'])!)
        : null,
    bedMesh: json.containsKey('bed_mesh')
        ? json['bed_mesh'] == null
        ? null
        : BedMesh34.fromJson(
        asT<Map<String, dynamic>>(json['bed_mesh'])!)
        : null,
    temperatureSensor8: json.containsKey('temperature_sensor 怪兽8温度')
        ? json['temperature_sensor 怪兽8温度'] == null
        ? null
        : TemperatureSensor864.fromJson(asT<Map<String, dynamic>>(
        json['temperature_sensor 怪兽8温度'])!)
        : null,
    temperatureSensorA61450: json
        .containsKey('temperature_sensor a6-1450温度')
        ? json['temperature_sensor a6-1450温度'] == null
        ? null
        : TemperatureSensorA6145090.fromJson(asT<Map<String, dynamic>>(
        json['temperature_sensor a6-1450温度'])!)
        : null,
    delayedGcodeKinematicPosition:
    json.containsKey('delayed_gcode kinematic_position')
        ? json['delayed_gcode kinematic_position'] == null
        ? null
        : DelayedGcodeKinematicPosition69.fromJson(
        asT<Map<String, dynamic>>(
            json['delayed_gcode kinematic_position'])!)
        : null,
    gcodeArcs: json.containsKey('gcode_arcs')
        ? json['gcode_arcs'] == null
        ? null
        : GcodeArcs23.fromJson(
        asT<Map<String, dynamic>>(json['gcode_arcs'])!)
        : null,
    inputShaper: json.containsKey('input_shaper')
        ? json['input_shaper'] == null
        ? null
        : InputShaper51.fromJson(
        asT<Map<String, dynamic>>(json['input_shaper'])!)
        : null,
    probe: json.containsKey('probe')
        ? json['probe'] == null
        ? null
        : Probe72.fromJson(asT<Map<String, dynamic>>(json['probe'])!)
        : null,
    zTilt: json.containsKey('z_tilt')
        ? json['z_tilt'] == null
        ? null
        : ZTilt62.fromJson(asT<Map<String, dynamic>>(json['z_tilt'])!)
        : null,
    tmc2209StepperX: json.containsKey('tmc2209 stepper_x')
        ? json['tmc2209 stepper_x'] == null
        ? null
        : Tmc2209StepperX19.fromJson(
        asT<Map<String, dynamic>>(json['tmc2209 stepper_x'])!)
        : null,
    stepperX: json.containsKey('stepper_x')
        ? json['stepper_x'] == null
        ? null
        : StepperX30.fromJson(
        asT<Map<String, dynamic>>(json['stepper_x'])!)
        : null,
    tmc2209StepperY: json.containsKey('tmc2209 stepper_y')
        ? json['tmc2209 stepper_y'] == null
        ? null
        : Tmc2209StepperY68.fromJson(
        asT<Map<String, dynamic>>(json['tmc2209 stepper_y'])!)
        : null,
    stepperY: json.containsKey('stepper_y')
        ? json['stepper_y'] == null
        ? null
        : StepperY02.fromJson(
        asT<Map<String, dynamic>>(json['stepper_y'])!)
        : null,
    tmc2209StepperZ: json.containsKey('tmc2209 stepper_z')
        ? json['tmc2209 stepper_z'] == null
        ? null
        : Tmc2209StepperZ26.fromJson(
        asT<Map<String, dynamic>>(json['tmc2209 stepper_z'])!)
        : null,
    stepperZ: json.containsKey('stepper_z')
        ? json['stepper_z'] == null
        ? null
        : StepperZ94.fromJson(
        asT<Map<String, dynamic>>(json['stepper_z'])!)
        : null,
    tmc2209Extruder: json.containsKey('tmc2209 extruder')
        ? json['tmc2209 extruder'] == null
        ? null
        : Tmc2209Extruder19.fromJson(
        asT<Map<String, dynamic>>(json['tmc2209 extruder'])!)
        : null,
    extruder: json.containsKey('extruder')
        ? json['extruder'] == null
        ? null
        : Extruder14.fromJson(
        asT<Map<String, dynamic>>(json['extruder'])!)
        : null,
    tmc2209StepperZ1: json.containsKey('tmc2209 stepper_z1')
        ? json['tmc2209 stepper_z1'] == null
        ? null
        : Tmc2209StepperZ110.fromJson(
        asT<Map<String, dynamic>>(json['tmc2209 stepper_z1'])!)
        : null,
    stepperZ1: json.containsKey('stepper_z1')
        ? json['stepper_z1'] == null
        ? null
        : StepperZ122.fromJson(
        asT<Map<String, dynamic>>(json['stepper_z1'])!)
        : null,
    tmc2209StepperZ2: json.containsKey('tmc2209 stepper_z2')
        ? json['tmc2209 stepper_z2'] == null
        ? null
        : Tmc2209StepperZ214.fromJson(
        asT<Map<String, dynamic>>(json['tmc2209 stepper_z2'])!)
        : null,
    stepperZ2: json.containsKey('stepper_z2')
        ? json['stepper_z2'] == null
        ? null
        : StepperZ207.fromJson(
        asT<Map<String, dynamic>>(json['stepper_z2'])!)
        : null,
    boardPins: json.containsKey('board_pins')
        ? json['board_pins'] == null
        ? null
        : BoardPins79.fromJson(
        asT<Map<String, dynamic>>(json['board_pins'])!)
        : null,
    display: json.containsKey('display')
        ? json['display'] == null
        ? null
        : Display13.fromJson(
        asT<Map<String, dynamic>>(json['display'])!)
        : null,
    outputPinBeeper: json.containsKey('output_pin beeper')
        ? json['output_pin beeper'] == null
        ? null
        : OutputPinBeeper80.fromJson(
        asT<Map<String, dynamic>>(json['output_pin beeper'])!)
        : null,
    neopixelFysetcMini12864: json.containsKey('neopixel fysetc_mini12864')
        ? json['neopixel fysetc_mini12864'] == null
        ? null
        : NeopixelFysetcMini1286469.fromJson(asT<Map<String, dynamic>>(
        json['neopixel fysetc_mini12864'])!)
        : null,
    gcodeMacroG32: json.containsKey('gcode_macro g32')
        ? json['gcode_macro g32'] == null
        ? null
        : GcodeMacroG3203.fromJson(
        asT<Map<String, dynamic>>(json['gcode_macro g32'])!)
        : null,
    gcodeMacroPrintStart: json.containsKey('gcode_macro print_start')
        ? json['gcode_macro print_start'] == null
        ? null
        : GcodeMacroPrintStart84.fromJson(
        asT<Map<String, dynamic>>(json['gcode_macro print_start'])!)
        : null,
    gcodeMacroPrintEnd: json.containsKey('gcode_macro print_end')
        ? json['gcode_macro print_end'] == null
        ? null
        : GcodeMacroPrintEnd62.fromJson(
        asT<Map<String, dynamic>>(json['gcode_macro print_end'])!)
        : null,
    virtualSdcard: json.containsKey('virtual_sdcard')
        ? json['virtual_sdcard'] == null
        ? null
        : VirtualSdcard38.fromJson(
        asT<Map<String, dynamic>>(json['virtual_sdcard'])!)
        : null,
    pauseResume: json.containsKey('pause_resume')
        ? json['pause_resume'] == null
        ? null
        : PauseResume30.fromJson(
        asT<Map<String, dynamic>>(json['pause_resume'])!)
        : null,
    gcodeMacroCancelPrint: json.containsKey('gcode_macro cancel_print')
        ? json['gcode_macro cancel_print'] == null
        ? null
        : GcodeMacroCancelPrint48.fromJson(asT<Map<String, dynamic>>(
        json['gcode_macro cancel_print'])!)
        : null,
    printer: json.containsKey('printer')
        ? json['printer'] == null
        ? null
        : Printer04.fromJson(
        asT<Map<String, dynamic>>(json['printer'])!)
        : null,
    verifyHeaterExtruder: json.containsKey('verify_heater extruder')
        ? json['verify_heater extruder'] == null
        ? null
        : VerifyHeaterExtruder98.fromJson(
        asT<Map<String, dynamic>>(json['verify_heater extruder'])!)
        : null,
  );

  Mcu02? mcu;
  GcodeMacroUserVariables58? gcodeMacroUserVariables;
  Respond86? respond;
  GcodeMacroProbeVariables86? gcodeMacroProbeVariables;
  GcodeMacroKlickyCheckVariablesVersion20?
  gcodeMacroKlickyCheckVariablesVersion;
  GcodeMacroKlickydebug50? gcodeMacroKlickydebug;
  GcodeMacroExitPoint45? gcodeMacroExitPoint;
  GcodeMacroEntryPoint77? gcodeMacroEntryPoint;
  GcodeMacroHomingVariables62? gcodeMacroHomingVariables;
  GcodeMacroAttachProbeLock87? gcodeMacroAttachProbeLock;
  GcodeMacroDockProbeUnlock82? gcodeMacroDockProbeUnlock;
  GcodeMacroProbeUnlock31? gcodeMacroProbeUnlock;
  GcodeMacroProbeLock67? gcodeMacroProbeLock;
  GcodeMacroDeployklickydock22? gcodeMacroDeployklickydock;
  GcodeMacroRetractklickydock32? gcodeMacroRetractklickydock;
  GcodeMacroAttachProbe65? gcodeMacroAttachProbe;
  GcodeMacroDockProbe55? gcodeMacroDockProbe;
  GcodeMacroProbeCalibrate08? gcodeMacroProbeCalibrate;
  GcodeMacroProbeAccuracy32? gcodeMacroProbeAccuracy;
  ForceMove86? forceMove;
  HomingOverride58? homingOverride;
  GcodeMacroUmbilicalPath08? gcodeMacroUmbilicalPath;
  GcodeMacroHomeZ36? gcodeMacroHomeZ;
  GcodeMacroCheckprobe70? gcodeMacroCheckprobe;
  GcodeMacroSetprobestate63? gcodeMacroSetprobestate;
  GcodeMacroParkToolhead24? gcodeMacroParkToolhead;
  GcodeMacroKlickyStatusReady21? gcodeMacroKlickyStatusReady;
  GcodeMacroKlickyStatusBusy64? gcodeMacroKlickyStatusBusy;
  GcodeMacroKlickyStatusLeveling34? gcodeMacroKlickyStatusLeveling;
  GcodeMacroKlickyStatusHoming57? gcodeMacroKlickyStatusHoming;
  GcodeMacroKlickyStatusCleaning85? gcodeMacroKlickyStatusCleaning;
  GcodeMacroKlickyStatusMeshing13? gcodeMacroKlickyStatusMeshing;
  GcodeMacroKlickyStatusCalibratingZ38? gcodeMacroKlickyStatusCalibratingZ;
  GcodeMacroBedMeshCalibrate70? gcodeMacroBedMeshCalibrate;
  GcodeMacroZTiltAdjust81? gcodeMacroZTiltAdjust;
  HeaterBed98? heaterBed;
  VerifyHeaterHeaterBed56? verifyHeaterHeaterBed;
  Fan34? fan;
  HeaterFanFan130? heaterFanFan1;
  IdleTimeout09? idleTimeout;
  BedMesh34? bedMesh;
  TemperatureSensor864? temperatureSensor8;
  TemperatureSensorA6145090? temperatureSensorA61450;
  DelayedGcodeKinematicPosition69? delayedGcodeKinematicPosition;
  GcodeArcs23? gcodeArcs;
  InputShaper51? inputShaper;
  Probe72? probe;
  ZTilt62? zTilt;
  Tmc2209StepperX19? tmc2209StepperX;
  StepperX30? stepperX;
  Tmc2209StepperY68? tmc2209StepperY;
  StepperY02? stepperY;
  Tmc2209StepperZ26? tmc2209StepperZ;
  StepperZ94? stepperZ;
  Tmc2209Extruder19? tmc2209Extruder;
  Extruder14? extruder;
  Tmc2209StepperZ110? tmc2209StepperZ1;
  StepperZ122? stepperZ1;
  Tmc2209StepperZ214? tmc2209StepperZ2;
  StepperZ207? stepperZ2;
  BoardPins79? boardPins;
  Display13? display;
  OutputPinBeeper80? outputPinBeeper;
  NeopixelFysetcMini1286469? neopixelFysetcMini12864;
  GcodeMacroG3203? gcodeMacroG32;
  GcodeMacroPrintStart84? gcodeMacroPrintStart;
  GcodeMacroPrintEnd62? gcodeMacroPrintEnd;
  VirtualSdcard38? virtualSdcard;
  PauseResume30? pauseResume;
  GcodeMacroCancelPrint48? gcodeMacroCancelPrint;
  Printer04? printer;
  VerifyHeaterExtruder98? verifyHeaterExtruder;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'mcu': mcu,
    'gcode_macro _user_variables': gcodeMacroUserVariables,
    'respond': respond,
    'gcode_macro _probe_variables': gcodeMacroProbeVariables,
    'gcode_macro _klicky_check_variables_version':
    gcodeMacroKlickyCheckVariablesVersion,
    'gcode_macro _klickydebug': gcodeMacroKlickydebug,
    'gcode_macro _exit_point': gcodeMacroExitPoint,
    'gcode_macro _entry_point': gcodeMacroEntryPoint,
    'gcode_macro _homing_variables': gcodeMacroHomingVariables,
    'gcode_macro attach_probe_lock': gcodeMacroAttachProbeLock,
    'gcode_macro dock_probe_unlock': gcodeMacroDockProbeUnlock,
    'gcode_macro _probe_unlock': gcodeMacroProbeUnlock,
    'gcode_macro _probe_lock': gcodeMacroProbeLock,
    'gcode_macro _deployklickydock': gcodeMacroDeployklickydock,
    'gcode_macro _retractklickydock': gcodeMacroRetractklickydock,
    'gcode_macro attach_probe': gcodeMacroAttachProbe,
    'gcode_macro dock_probe': gcodeMacroDockProbe,
    'gcode_macro probe_calibrate': gcodeMacroProbeCalibrate,
    'gcode_macro probe_accuracy': gcodeMacroProbeAccuracy,
    'force_move': forceMove,
    'homing_override': homingOverride,
    'gcode_macro _umbilical_path': gcodeMacroUmbilicalPath,
    'gcode_macro _home_z_': gcodeMacroHomeZ,
    'gcode_macro _checkprobe': gcodeMacroCheckprobe,
    'gcode_macro _setprobestate': gcodeMacroSetprobestate,
    'gcode_macro _park_toolhead': gcodeMacroParkToolhead,
    'gcode_macro _klicky_status_ready': gcodeMacroKlickyStatusReady,
    'gcode_macro _klicky_status_busy': gcodeMacroKlickyStatusBusy,
    'gcode_macro _klicky_status_leveling': gcodeMacroKlickyStatusLeveling,
    'gcode_macro _klicky_status_homing': gcodeMacroKlickyStatusHoming,
    'gcode_macro _klicky_status_cleaning': gcodeMacroKlickyStatusCleaning,
    'gcode_macro _klicky_status_meshing': gcodeMacroKlickyStatusMeshing,
    'gcode_macro _klicky_status_calibrating_z':
    gcodeMacroKlickyStatusCalibratingZ,
    'gcode_macro bed_mesh_calibrate': gcodeMacroBedMeshCalibrate,
    'gcode_macro z_tilt_adjust': gcodeMacroZTiltAdjust,
    'heater_bed': heaterBed,
    'verify_heater heater_bed': verifyHeaterHeaterBed,
    'fan': fan,
    'heater_fan fan1': heaterFanFan1,
    'idle_timeout': idleTimeout,
    'bed_mesh': bedMesh,
    'temperature_sensor 怪兽8温度': temperatureSensor8,
    'temperature_sensor a6-1450温度': temperatureSensorA61450,
    'delayed_gcode kinematic_position': delayedGcodeKinematicPosition,
    'gcode_arcs': gcodeArcs,
    'input_shaper': inputShaper,
    'probe': probe,
    'z_tilt': zTilt,
    'tmc2209 stepper_x': tmc2209StepperX,
    'stepper_x': stepperX,
    'tmc2209 stepper_y': tmc2209StepperY,
    'stepper_y': stepperY,
    'tmc2209 stepper_z': tmc2209StepperZ,
    'stepper_z': stepperZ,
    'tmc2209 extruder': tmc2209Extruder,
    'extruder': extruder,
    'tmc2209 stepper_z1': tmc2209StepperZ1,
    'stepper_z1': stepperZ1,
    'tmc2209 stepper_z2': tmc2209StepperZ2,
    'stepper_z2': stepperZ2,
    'board_pins': boardPins,
    'display': display,
    'output_pin beeper': outputPinBeeper,
    'neopixel fysetc_mini12864': neopixelFysetcMini12864,
    'gcode_macro g32': gcodeMacroG32,
    'gcode_macro print_start': gcodeMacroPrintStart,
    'gcode_macro print_end': gcodeMacroPrintEnd,
    'virtual_sdcard': virtualSdcard,
    'pause_resume': pauseResume,
    'gcode_macro cancel_print': gcodeMacroCancelPrint,
    'printer': printer,
    'verify_heater extruder': verifyHeaterExtruder,
  };
}

class Mcu02 {
  Mcu02({
    required this.serial,
    required this.baud,
    required this.maxStepperError,
  });

  factory Mcu02.fromJson(Map<String, dynamic> json) => Mcu02(
    serial: json.containsKey('serial') ? asT<String>(json['serial'])! : '',
    baud: json.containsKey('baud') ? asT<int>(json['baud'])! : 0,
    maxStepperError: json.containsKey('max_stepper_error')
        ? asT<double>(json['max_stepper_error'])!
        : 0,
  );

  String serial;
  int baud;
  double maxStepperError;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'serial': serial,
    'baud': baud,
    'max_stepper_error': maxStepperError,
  };
}

class GcodeMacroUserVariables58 {
  GcodeMacroUserVariables58({
    required this.gcode,
    required this.description,
    required this.variableVerbose,
    required this.variableTravelSpeed,
    required this.variableDockSpeed,
    required this.variableReleaseSpeed,
    required this.variableZDropSpeed,
    required this.variableSafeZ,
    required this.variableEnableZHop,
    required this.variableMaxBedY,
    required this.variableMaxBedX,
    required this.variableZEndstopX,
    required this.variableZEndstopY,
    required this.variableDocklocationY,
    required this.variableDocklocationX,
    required this.variableDocklocationZ,
    required this.variableDockmoveX,
    required this.variableDockmoveY,
    required this.variableDockmoveZ,
    required this.variableAttachmoveX,
    required this.variableAttachmoveY,
    required this.variableAttachmoveZ,
    required this.variableUmbilical,
    required this.variableUmbilicalX,
    required this.variableUmbilicalY,
    required this.variableVersion,
    required this.variableAttachmove2X,
    required this.variableAttachmove2Y,
    required this.variableAttachmove2Z,
  });

  factory GcodeMacroUserVariables58.fromJson(Map<String, dynamic> json) =>
      GcodeMacroUserVariables58(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
        variableVerbose: json.containsKey('variable_verbose')
            ? asT<String>(json['variable_verbose'])!
            : '',
        variableTravelSpeed: json.containsKey('variable_travel_speed')
            ? asT<String>(json['variable_travel_speed'])!
            : '',
        variableDockSpeed: json.containsKey('variable_dock_speed')
            ? asT<String>(json['variable_dock_speed'])!
            : '',
        variableReleaseSpeed: json.containsKey('variable_release_speed')
            ? asT<String>(json['variable_release_speed'])!
            : '',
        variableZDropSpeed: json.containsKey('variable_z_drop_speed')
            ? asT<String>(json['variable_z_drop_speed'])!
            : '',
        variableSafeZ: json.containsKey('variable_safe_z')
            ? asT<String>(json['variable_safe_z'])!
            : '',
        variableEnableZHop: json.containsKey('variable_enable_z_hop')
            ? asT<String>(json['variable_enable_z_hop'])!
            : '',
        variableMaxBedY: json.containsKey('variable_max_bed_y')
            ? asT<String>(json['variable_max_bed_y'])!
            : '',
        variableMaxBedX: json.containsKey('variable_max_bed_x')
            ? asT<String>(json['variable_max_bed_x'])!
            : '',
        variableZEndstopX: json.containsKey('variable_z_endstop_x')
            ? asT<String>(json['variable_z_endstop_x'])!
            : '',
        variableZEndstopY: json.containsKey('variable_z_endstop_y')
            ? asT<String>(json['variable_z_endstop_y'])!
            : '',
        variableDocklocationY: json.containsKey('variable_docklocation_y')
            ? asT<String>(json['variable_docklocation_y'])!
            : '',
        variableDocklocationX: json.containsKey('variable_docklocation_x')
            ? asT<String>(json['variable_docklocation_x'])!
            : '',
        variableDocklocationZ: json.containsKey('variable_docklocation_z')
            ? asT<String>(json['variable_docklocation_z'])!
            : '',
        variableDockmoveX: json.containsKey('variable_dockmove_x')
            ? asT<String>(json['variable_dockmove_x'])!
            : '',
        variableDockmoveY: json.containsKey('variable_dockmove_y')
            ? asT<String>(json['variable_dockmove_y'])!
            : '',
        variableDockmoveZ: json.containsKey('variable_dockmove_z')
            ? asT<String>(json['variable_dockmove_z'])!
            : '',
        variableAttachmoveX: json.containsKey('variable_attachmove_x')
            ? asT<String>(json['variable_attachmove_x'])!
            : '',
        variableAttachmoveY: json.containsKey('variable_attachmove_y')
            ? asT<String>(json['variable_attachmove_y'])!
            : '',
        variableAttachmoveZ: json.containsKey('variable_attachmove_z')
            ? asT<String>(json['variable_attachmove_z'])!
            : '',
        variableUmbilical: json.containsKey('variable_umbilical')
            ? asT<String>(json['variable_umbilical'])!
            : '',
        variableUmbilicalX: json.containsKey('variable_umbilical_x')
            ? asT<String>(json['variable_umbilical_x'])!
            : '',
        variableUmbilicalY: json.containsKey('variable_umbilical_y')
            ? asT<String>(json['variable_umbilical_y'])!
            : '',
        variableVersion: json.containsKey('variable_version')
            ? asT<String>(json['variable_version'])!
            : '',
        variableAttachmove2X: json.containsKey('variable_attachmove2_x')
            ? asT<String>(json['variable_attachmove2_x'])!
            : '',
        variableAttachmove2Y: json.containsKey('variable_attachmove2_y')
            ? asT<String>(json['variable_attachmove2_y'])!
            : '',
        variableAttachmove2Z: json.containsKey('variable_attachmove2_z')
            ? asT<String>(json['variable_attachmove2_z'])!
            : '',
      );

  String gcode;
  String description;
  String variableVerbose;
  String variableTravelSpeed;
  String variableDockSpeed;
  String variableReleaseSpeed;
  String variableZDropSpeed;
  String variableSafeZ;
  String variableEnableZHop;
  String variableMaxBedY;
  String variableMaxBedX;
  String variableZEndstopX;
  String variableZEndstopY;
  String variableDocklocationY;
  String variableDocklocationX;
  String variableDocklocationZ;
  String variableDockmoveX;
  String variableDockmoveY;
  String variableDockmoveZ;
  String variableAttachmoveX;
  String variableAttachmoveY;
  String variableAttachmoveZ;
  String variableUmbilical;
  String variableUmbilicalX;
  String variableUmbilicalY;
  String variableVersion;
  String variableAttachmove2X;
  String variableAttachmove2Y;
  String variableAttachmove2Z;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
    'variable_verbose': variableVerbose,
    'variable_travel_speed': variableTravelSpeed,
    'variable_dock_speed': variableDockSpeed,
    'variable_release_speed': variableReleaseSpeed,
    'variable_z_drop_speed': variableZDropSpeed,
    'variable_safe_z': variableSafeZ,
    'variable_enable_z_hop': variableEnableZHop,
    'variable_max_bed_y': variableMaxBedY,
    'variable_max_bed_x': variableMaxBedX,
    'variable_z_endstop_x': variableZEndstopX,
    'variable_z_endstop_y': variableZEndstopY,
    'variable_docklocation_y': variableDocklocationY,
    'variable_docklocation_x': variableDocklocationX,
    'variable_docklocation_z': variableDocklocationZ,
    'variable_dockmove_x': variableDockmoveX,
    'variable_dockmove_y': variableDockmoveY,
    'variable_dockmove_z': variableDockmoveZ,
    'variable_attachmove_x': variableAttachmoveX,
    'variable_attachmove_y': variableAttachmoveY,
    'variable_attachmove_z': variableAttachmoveZ,
    'variable_umbilical': variableUmbilical,
    'variable_umbilical_x': variableUmbilicalX,
    'variable_umbilical_y': variableUmbilicalY,
    'variable_version': variableVersion,
    'variable_attachmove2_x': variableAttachmove2X,
    'variable_attachmove2_y': variableAttachmove2Y,
    'variable_attachmove2_z': variableAttachmove2Z,
  };
}

class Respond86 {
  Respond86({
    required this.defaultType,
    required this.defaultPrefix,
  });

  factory Respond86.fromJson(Map<String, dynamic> json) => Respond86(
    defaultType: json.containsKey('default_type')
        ? asT<String>(json['default_type'])!
        : '',
    defaultPrefix: json.containsKey('default_prefix')
        ? asT<String>(json['default_prefix'])!
        : '',
  );

  String defaultType;
  String defaultPrefix;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'default_type': defaultType,
    'default_prefix': defaultPrefix,
  };
}

class GcodeMacroProbeVariables86 {
  GcodeMacroProbeVariables86({
    required this.gcode,
    required this.description,
    required this.variableProbeAttached,
    required this.variableProbeState,
    required this.variableProbeLock,
    required this.variableProbeZHomed,
    required this.variableZEndstopX,
    required this.variableZEndstopY,
  });

  factory GcodeMacroProbeVariables86.fromJson(Map<String, dynamic> json) =>
      GcodeMacroProbeVariables86(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
        variableProbeAttached: json.containsKey('variable_probe_attached')
            ? asT<String>(json['variable_probe_attached'])!
            : '',
        variableProbeState: json.containsKey('variable_probe_state')
            ? asT<String>(json['variable_probe_state'])!
            : '',
        variableProbeLock: json.containsKey('variable_probe_lock')
            ? asT<String>(json['variable_probe_lock'])!
            : '',
        variableProbeZHomed: json.containsKey('variable_probe_z_homed')
            ? asT<String>(json['variable_probe_z_homed'])!
            : '',
        variableZEndstopX: json.containsKey('variable_z_endstop_x')
            ? asT<String>(json['variable_z_endstop_x'])!
            : '',
        variableZEndstopY: json.containsKey('variable_z_endstop_y')
            ? asT<String>(json['variable_z_endstop_y'])!
            : '',
      );

  String gcode;
  String description;
  String variableProbeAttached;
  String variableProbeState;
  String variableProbeLock;
  String variableProbeZHomed;
  String variableZEndstopX;
  String variableZEndstopY;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
    'variable_probe_attached': variableProbeAttached,
    'variable_probe_state': variableProbeState,
    'variable_probe_lock': variableProbeLock,
    'variable_probe_z_homed': variableProbeZHomed,
    'variable_z_endstop_x': variableZEndstopX,
    'variable_z_endstop_y': variableZEndstopY,
  };
}

class GcodeMacroKlickyCheckVariablesVersion20 {
  GcodeMacroKlickyCheckVariablesVersion20({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroKlickyCheckVariablesVersion20.fromJson(
      Map<String, dynamic> json) =>
      GcodeMacroKlickyCheckVariablesVersion20(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroKlickydebug50 {
  GcodeMacroKlickydebug50({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroKlickydebug50.fromJson(Map<String, dynamic> json) =>
      GcodeMacroKlickydebug50(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroExitPoint45 {
  GcodeMacroExitPoint45({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroExitPoint45.fromJson(Map<String, dynamic> json) =>
      GcodeMacroExitPoint45(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroEntryPoint77 {
  GcodeMacroEntryPoint77({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroEntryPoint77.fromJson(Map<String, dynamic> json) =>
      GcodeMacroEntryPoint77(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroHomingVariables62 {
  GcodeMacroHomingVariables62({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroHomingVariables62.fromJson(Map<String, dynamic> json) =>
      GcodeMacroHomingVariables62(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroAttachProbeLock87 {
  GcodeMacroAttachProbeLock87({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroAttachProbeLock87.fromJson(Map<String, dynamic> json) =>
      GcodeMacroAttachProbeLock87(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroDockProbeUnlock82 {
  GcodeMacroDockProbeUnlock82({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroDockProbeUnlock82.fromJson(Map<String, dynamic> json) =>
      GcodeMacroDockProbeUnlock82(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroProbeUnlock31 {
  GcodeMacroProbeUnlock31({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroProbeUnlock31.fromJson(Map<String, dynamic> json) =>
      GcodeMacroProbeUnlock31(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroProbeLock67 {
  GcodeMacroProbeLock67({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroProbeLock67.fromJson(Map<String, dynamic> json) =>
      GcodeMacroProbeLock67(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroDeployklickydock22 {
  GcodeMacroDeployklickydock22({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroDeployklickydock22.fromJson(Map<String, dynamic> json) =>
      GcodeMacroDeployklickydock22(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroRetractklickydock32 {
  GcodeMacroRetractklickydock32({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroRetractklickydock32.fromJson(Map<String, dynamic> json) =>
      GcodeMacroRetractklickydock32(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroAttachProbe65 {
  GcodeMacroAttachProbe65({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroAttachProbe65.fromJson(Map<String, dynamic> json) =>
      GcodeMacroAttachProbe65(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroDockProbe55 {
  GcodeMacroDockProbe55({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroDockProbe55.fromJson(Map<String, dynamic> json) =>
      GcodeMacroDockProbe55(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroProbeCalibrate08 {
  GcodeMacroProbeCalibrate08({
    required this.gcode,
    required this.renameExisting,
    required this.description,
  });

  factory GcodeMacroProbeCalibrate08.fromJson(Map<String, dynamic> json) =>
      GcodeMacroProbeCalibrate08(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        renameExisting: json.containsKey('rename_existing')
            ? asT<String>(json['rename_existing'])!
            : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String renameExisting;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'rename_existing': renameExisting,
    'description': description,
  };
}

class GcodeMacroProbeAccuracy32 {
  GcodeMacroProbeAccuracy32({
    required this.gcode,
    required this.renameExisting,
    required this.description,
  });

  factory GcodeMacroProbeAccuracy32.fromJson(Map<String, dynamic> json) =>
      GcodeMacroProbeAccuracy32(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        renameExisting: json.containsKey('rename_existing')
            ? asT<String>(json['rename_existing'])!
            : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String renameExisting;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'rename_existing': renameExisting,
    'description': description,
  };
}

class ForceMove86 {
  ForceMove86({
    required this.enableForceMove,
  });

  factory ForceMove86.fromJson(Map<String, dynamic> json) => ForceMove86(
    enableForceMove: json.containsKey('enable_force_move')
        ? asT<bool>(json['enable_force_move'])!
        : false,
  );

  bool enableForceMove;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'enable_force_move': enableForceMove,
  };
}

class HomingOverride58 {
  HomingOverride58({
    required this.axes,
    required this.gcode,
  });

  factory HomingOverride58.fromJson(Map<String, dynamic> json) =>
      HomingOverride58(
        axes: json.containsKey('axes') ? asT<String>(json['axes'])! : '',
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
      );

  String axes;
  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'axes': axes,
    'gcode': gcode,
  };
}

class GcodeMacroUmbilicalPath08 {
  GcodeMacroUmbilicalPath08({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroUmbilicalPath08.fromJson(Map<String, dynamic> json) =>
      GcodeMacroUmbilicalPath08(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroHomeZ36 {
  GcodeMacroHomeZ36({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroHomeZ36.fromJson(Map<String, dynamic> json) =>
      GcodeMacroHomeZ36(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroCheckprobe70 {
  GcodeMacroCheckprobe70({
    required this.gcode,
    required this.description,
    required this.variableProbeState,
  });

  factory GcodeMacroCheckprobe70.fromJson(Map<String, dynamic> json) =>
      GcodeMacroCheckprobe70(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
        variableProbeState: json.containsKey('variable_probe_state')
            ? asT<String>(json['variable_probe_state'])!
            : '',
      );

  String gcode;
  String description;
  String variableProbeState;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
    'variable_probe_state': variableProbeState,
  };
}

class GcodeMacroSetprobestate63 {
  GcodeMacroSetprobestate63({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroSetprobestate63.fromJson(Map<String, dynamic> json) =>
      GcodeMacroSetprobestate63(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroParkToolhead24 {
  GcodeMacroParkToolhead24({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroParkToolhead24.fromJson(Map<String, dynamic> json) =>
      GcodeMacroParkToolhead24(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroKlickyStatusReady21 {
  GcodeMacroKlickyStatusReady21({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroKlickyStatusReady21.fromJson(Map<String, dynamic> json) =>
      GcodeMacroKlickyStatusReady21(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroKlickyStatusBusy64 {
  GcodeMacroKlickyStatusBusy64({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroKlickyStatusBusy64.fromJson(Map<String, dynamic> json) =>
      GcodeMacroKlickyStatusBusy64(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroKlickyStatusLeveling34 {
  GcodeMacroKlickyStatusLeveling34({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroKlickyStatusLeveling34.fromJson(
      Map<String, dynamic> json) =>
      GcodeMacroKlickyStatusLeveling34(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroKlickyStatusHoming57 {
  GcodeMacroKlickyStatusHoming57({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroKlickyStatusHoming57.fromJson(Map<String, dynamic> json) =>
      GcodeMacroKlickyStatusHoming57(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroKlickyStatusCleaning85 {
  GcodeMacroKlickyStatusCleaning85({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroKlickyStatusCleaning85.fromJson(
      Map<String, dynamic> json) =>
      GcodeMacroKlickyStatusCleaning85(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroKlickyStatusMeshing13 {
  GcodeMacroKlickyStatusMeshing13({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroKlickyStatusMeshing13.fromJson(Map<String, dynamic> json) =>
      GcodeMacroKlickyStatusMeshing13(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroKlickyStatusCalibratingZ38 {
  GcodeMacroKlickyStatusCalibratingZ38({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroKlickyStatusCalibratingZ38.fromJson(
      Map<String, dynamic> json) =>
      GcodeMacroKlickyStatusCalibratingZ38(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroBedMeshCalibrate70 {
  GcodeMacroBedMeshCalibrate70({
    required this.gcode,
    required this.renameExisting,
    required this.description,
  });

  factory GcodeMacroBedMeshCalibrate70.fromJson(Map<String, dynamic> json) =>
      GcodeMacroBedMeshCalibrate70(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        renameExisting: json.containsKey('rename_existing')
            ? asT<String>(json['rename_existing'])!
            : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String renameExisting;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'rename_existing': renameExisting,
    'description': description,
  };
}

class GcodeMacroZTiltAdjust81 {
  GcodeMacroZTiltAdjust81({
    required this.gcode,
    required this.renameExisting,
    required this.description,
  });

  factory GcodeMacroZTiltAdjust81.fromJson(Map<String, dynamic> json) =>
      GcodeMacroZTiltAdjust81(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        renameExisting: json.containsKey('rename_existing')
            ? asT<String>(json['rename_existing'])!
            : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String renameExisting;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'rename_existing': renameExisting,
    'description': description,
  };
}

class HeaterBed98 {
  HeaterBed98({
    required this.sensorType,
    required this.pullupResistor,
    required this.inlineResistor,
    required this.sensorPin,
    required this.minTemp,
    required this.maxTemp,
    required this.minExtrudeTemp,
    required this.maxPower,
    required this.smoothTime,
    required this.control,
    required this.pidKp,
    required this.pidKi,
    required this.pidKd,
    required this.heaterPin,
    required this.pwmCycleTime,
  });

  factory HeaterBed98.fromJson(Map<String, dynamic> json) => HeaterBed98(
    sensorType: json.containsKey('sensor_type')
        ? asT<String>(json['sensor_type'])!
        : '',
    pullupResistor: json.containsKey('pullup_resistor')
        ? asT<double>(json['pullup_resistor'])!
        : 0,
    inlineResistor: json.containsKey('inline_resistor')
        ? asT<double>(json['inline_resistor'])!
        : 0,
    sensorPin: json.containsKey('sensor_pin')
        ? asT<String>(json['sensor_pin'])!
        : '',
    minTemp:
    json.containsKey('min_temp') ? asT<double>(json['min_temp'])! : 0,
    maxTemp:
    json.containsKey('max_temp') ? asT<double>(json['max_temp'])! : 0,
    minExtrudeTemp: json.containsKey('min_extrude_temp')
        ? asT<double>(json['min_extrude_temp'])!
        : 0,
    maxPower:
    json.containsKey('max_power') ? asT<double>(json['max_power'])! : 0,
    smoothTime: json.containsKey('smooth_time')
        ? asT<double>(json['smooth_time'])!
        : 0,
    control:
    json.containsKey('control') ? asT<String>(json['control'])! : '',
    pidKp: json.containsKey('pid_kp') ? asT<double>(json['pid_kp'])! : 0,
    pidKi: json.containsKey('pid_ki') ? asT<double>(json['pid_ki'])! : 0,
    pidKd: json.containsKey('pid_kd') ? asT<double>(json['pid_kd'])! : 0,
    heaterPin: json.containsKey('heater_pin')
        ? asT<String>(json['heater_pin'])!
        : '',
    pwmCycleTime: json.containsKey('pwm_cycle_time')
        ? asT<double>(json['pwm_cycle_time'])!
        : 0,
  );

  String sensorType;
  double pullupResistor;
  double inlineResistor;
  String sensorPin;
  double minTemp;
  double maxTemp;
  double minExtrudeTemp;
  double maxPower;
  double smoothTime;
  String control;
  double pidKp;
  double pidKi;
  double pidKd;
  String heaterPin;
  double pwmCycleTime;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'sensor_type': sensorType,
    'pullup_resistor': pullupResistor,
    'inline_resistor': inlineResistor,
    'sensor_pin': sensorPin,
    'min_temp': minTemp,
    'max_temp': maxTemp,
    'min_extrude_temp': minExtrudeTemp,
    'max_power': maxPower,
    'smooth_time': smoothTime,
    'control': control,
    'pid_kp': pidKp,
    'pid_ki': pidKi,
    'pid_kd': pidKd,
    'heater_pin': heaterPin,
    'pwm_cycle_time': pwmCycleTime,
  };
}

class VerifyHeaterHeaterBed56 {
  VerifyHeaterHeaterBed56({
    required this.hysteresis,
    required this.maxError,
    required this.heatingGain,
    required this.checkGainTime,
  });

  factory VerifyHeaterHeaterBed56.fromJson(Map<String, dynamic> json) =>
      VerifyHeaterHeaterBed56(
        hysteresis: json.containsKey('hysteresis')
            ? asT<double>(json['hysteresis'])!
            : 0,
        maxError:
        json.containsKey('max_error') ? asT<double>(json['max_error'])! : 0,
        heatingGain: json.containsKey('heating_gain')
            ? asT<double>(json['heating_gain'])!
            : 0,
        checkGainTime: json.containsKey('check_gain_time')
            ? asT<double>(json['check_gain_time'])!
            : 0,
      );

  double hysteresis;
  double maxError;
  double heatingGain;
  double checkGainTime;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'hysteresis': hysteresis,
    'max_error': maxError,
    'heating_gain': heatingGain,
    'check_gain_time': checkGainTime,
  };
}

class Fan34 {
  Fan34({
    required this.maxPower,
    required this.kickStartTime,
    required this.offBelow,
    required this.cycleTime,
    required this.hardwarePwm,
    required this.shutdownSpeed,
    required this.pin,
  });

  factory Fan34.fromJson(Map<String, dynamic> json) => Fan34(
    maxPower:
    json.containsKey('max_power') ? asT<double>(json['max_power'])! : 0,
    kickStartTime: json.containsKey('kick_start_time')
        ? asT<double>(json['kick_start_time'])!
        : 0,
    offBelow:
    json.containsKey('off_below') ? asT<double>(json['off_below'])! : 0,
    cycleTime: json.containsKey('cycle_time')
        ? asT<double>(json['cycle_time'])!
        : 0,
    hardwarePwm: json.containsKey('hardware_pwm')
        ? asT<bool>(json['hardware_pwm'])!
        : false,
    shutdownSpeed: json.containsKey('shutdown_speed')
        ? asT<double>(json['shutdown_speed'])!
        : 0,
    pin: json.containsKey('pin') ? asT<String>(json['pin'])! : '',
  );

  double maxPower;
  double kickStartTime;
  double offBelow;
  double cycleTime;
  bool hardwarePwm;
  double shutdownSpeed;
  String pin;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'max_power': maxPower,
    'kick_start_time': kickStartTime,
    'off_below': offBelow,
    'cycle_time': cycleTime,
    'hardware_pwm': hardwarePwm,
    'shutdown_speed': shutdownSpeed,
    'pin': pin,
  };
}

class HeaterFanFan130 {
  HeaterFanFan130({
    required this.heater,
    required this.heaterTemp,
    required this.maxPower,
    required this.kickStartTime,
    required this.offBelow,
    required this.cycleTime,
    required this.hardwarePwm,
    required this.shutdownSpeed,
    required this.pin,
    required this.fanSpeed,
  });

  factory HeaterFanFan130.fromJson(Map<String, dynamic> json) {
    List<String>? heater = json['heater'] is List ? <String>[] : null;
    if (heater != null) {
      for (final dynamic item in json['heater']!) {
        if (item != null) {
          tryCatch(() {
            heater?.add(asT<String>(item)!);
          });
        }
      }
    }

    if (heater == null) {
      heater = <String>[];
    }
    return HeaterFanFan130(
      heater: heater,
      heaterTemp: json.containsKey('heater_temp')
          ? asT<double>(json['heater_temp'])!
          : 0,
      maxPower:
      json.containsKey('max_power') ? asT<double>(json['max_power'])! : 0,
      kickStartTime: json.containsKey('kick_start_time')
          ? asT<double>(json['kick_start_time'])!
          : 0,
      offBelow:
      json.containsKey('off_below') ? asT<double>(json['off_below'])! : 0,
      cycleTime:
      json.containsKey('cycle_time') ? asT<double>(json['cycle_time'])! : 0,
      hardwarePwm: json.containsKey('hardware_pwm')
          ? asT<bool>(json['hardware_pwm'])!
          : false,
      shutdownSpeed: json.containsKey('shutdown_speed')
          ? asT<double>(json['shutdown_speed'])!
          : 0,
      pin: json.containsKey('pin') ? asT<String>(json['pin'])! : '',
      fanSpeed:
      json.containsKey('fan_speed') ? asT<double>(json['fan_speed'])! : 0,
    );
  }

  List<String>? heater;
  double heaterTemp;
  double maxPower;
  double kickStartTime;
  double offBelow;
  double cycleTime;
  bool hardwarePwm;
  double shutdownSpeed;
  String pin;
  double fanSpeed;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'heater': heater,
    'heater_temp': heaterTemp,
    'max_power': maxPower,
    'kick_start_time': kickStartTime,
    'off_below': offBelow,
    'cycle_time': cycleTime,
    'hardware_pwm': hardwarePwm,
    'shutdown_speed': shutdownSpeed,
    'pin': pin,
    'fan_speed': fanSpeed,
  };
}

class IdleTimeout09 {
  IdleTimeout09({
    required this.timeout,
    required this.gcode,
  });

  factory IdleTimeout09.fromJson(Map<String, dynamic> json) => IdleTimeout09(
    timeout:
    json.containsKey('timeout') ? asT<double>(json['timeout'])! : 0,
    gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
  );

  double timeout;
  String gcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'timeout': timeout,
    'gcode': gcode,
  };
}

class BedMesh34 {
  BedMesh34({
    required this.probeCount,
    required this.meshMin,
    required this.meshMax,
    required this.meshPps,
    required this.algorithm,
    required this.bicubicTension,
    required this.horizontalMoveZ,
    required this.speed,
    required this.fadeStart,
    required this.fadeEnd,
    required this.splitDeltaZ,
    required this.moveCheckDistance,
  });

  factory BedMesh34.fromJson(Map<String, dynamic> json) {
    List<int>? probeCount = json['probe_count'] is List ? <int>[] : null;
    if (probeCount != null) {
      for (final dynamic item in json['probe_count']!) {
        if (item != null) {
          tryCatch(() {
            probeCount?.add(asT<int>(item)!);
          });
        }
      }
    }

    if (probeCount == null) {
      probeCount = <int>[];
    }

    List<double>? meshMin = json['mesh_min'] is List ? <double>[] : null;
    if (meshMin != null) {
      for (final dynamic item in json['mesh_min']!) {
        if (item != null) {
          tryCatch(() {
            meshMin?.add(asT<double>(item)!);
          });
        }
      }
    }

    if (meshMin == null) {
      meshMin = <double>[];
    }

    List<double>? meshMax = json['mesh_max'] is List ? <double>[] : null;
    if (meshMax != null) {
      for (final dynamic item in json['mesh_max']!) {
        if (item != null) {
          tryCatch(() {
            meshMax?.add(asT<double>(item)!);
          });
        }
      }
    }

    if (meshMax == null) {
      meshMax = <double>[];
    }

    List<int>? meshPps = json['mesh_pps'] is List ? <int>[] : null;
    if (meshPps != null) {
      for (final dynamic item in json['mesh_pps']!) {
        if (item != null) {
          tryCatch(() {
            meshPps?.add(asT<int>(item)!);
          });
        }
      }
    }

    if (meshPps == null) {
      meshPps = <int>[];
    }
    return BedMesh34(
      probeCount: probeCount,
      meshMin: meshMin,
      meshMax: meshMax,
      meshPps: meshPps,
      algorithm:
      json.containsKey('algorithm') ? asT<String>(json['algorithm'])! : '',
      bicubicTension: json.containsKey('bicubic_tension')
          ? asT<double>(json['bicubic_tension'])!
          : 0,
      horizontalMoveZ: json.containsKey('horizontal_move_z')
          ? asT<double>(json['horizontal_move_z'])!
          : 0,
      speed: json.containsKey('speed') ? asT<double>(json['speed'])! : 0,
      fadeStart:
      json.containsKey('fade_start') ? asT<double>(json['fade_start'])! : 0,
      fadeEnd:
      json.containsKey('fade_end') ? asT<double>(json['fade_end'])! : 0,
      splitDeltaZ: json.containsKey('split_delta_z')
          ? asT<double>(json['split_delta_z'])!
          : 0,
      moveCheckDistance: json.containsKey('move_check_distance')
          ? asT<double>(json['move_check_distance'])!
          : 0,
    );
  }

  List<int>? probeCount;
  List<double>? meshMin;
  List<double>? meshMax;
  List<int>? meshPps;
  String algorithm;
  double bicubicTension;
  double horizontalMoveZ;
  double speed;
  double fadeStart;
  double fadeEnd;
  double splitDeltaZ;
  double moveCheckDistance;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'probe_count': probeCount,
    'mesh_min': meshMin,
    'mesh_max': meshMax,
    'mesh_pps': meshPps,
    'algorithm': algorithm,
    'bicubic_tension': bicubicTension,
    'horizontal_move_z': horizontalMoveZ,
    'speed': speed,
    'fade_start': fadeStart,
    'fade_end': fadeEnd,
    'split_delta_z': splitDeltaZ,
    'move_check_distance': moveCheckDistance,
  };
}

class TemperatureSensor864 {
  TemperatureSensor864({
    required this.sensorType,
    required this.sensorMcu,
    required this.minTemp,
    required this.maxTemp,
  });

  factory TemperatureSensor864.fromJson(Map<String, dynamic> json) =>
      TemperatureSensor864(
        sensorType: json.containsKey('sensor_type')
            ? asT<String>(json['sensor_type'])!
            : '',
        sensorMcu: json.containsKey('sensor_mcu')
            ? asT<String>(json['sensor_mcu'])!
            : '',
        minTemp:
        json.containsKey('min_temp') ? asT<double>(json['min_temp'])! : 0,
        maxTemp:
        json.containsKey('max_temp') ? asT<double>(json['max_temp'])! : 0,
      );

  String sensorType;
  String sensorMcu;
  double minTemp;
  double maxTemp;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'sensor_type': sensorType,
    'sensor_mcu': sensorMcu,
    'min_temp': minTemp,
    'max_temp': maxTemp,
  };
}

class TemperatureSensorA6145090 {
  TemperatureSensorA6145090({
    required this.sensorType,
    required this.sensorPath,
    required this.minTemp,
    required this.maxTemp,
  });

  factory TemperatureSensorA6145090.fromJson(Map<String, dynamic> json) =>
      TemperatureSensorA6145090(
        sensorType: json.containsKey('sensor_type')
            ? asT<String>(json['sensor_type'])!
            : '',
        sensorPath: json.containsKey('sensor_path')
            ? asT<String>(json['sensor_path'])!
            : '',
        minTemp:
        json.containsKey('min_temp') ? asT<double>(json['min_temp'])! : 0,
        maxTemp:
        json.containsKey('max_temp') ? asT<double>(json['max_temp'])! : 0,
      );

  String sensorType;
  String sensorPath;
  double minTemp;
  double maxTemp;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'sensor_type': sensorType,
    'sensor_path': sensorPath,
    'min_temp': minTemp,
    'max_temp': maxTemp,
  };
}

class DelayedGcodeKinematicPosition69 {
  DelayedGcodeKinematicPosition69({
    required this.gcode,
    required this.initialDuration,
  });

  factory DelayedGcodeKinematicPosition69.fromJson(Map<String, dynamic> json) =>
      DelayedGcodeKinematicPosition69(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        initialDuration: json.containsKey('initial_duration')
            ? asT<double>(json['initial_duration'])!
            : 0,
      );

  String gcode;
  double initialDuration;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'initial_duration': initialDuration,
  };
}

class GcodeArcs23 {
  GcodeArcs23({
    required this.resolution,
  });

  factory GcodeArcs23.fromJson(Map<String, dynamic> json) => GcodeArcs23(
    resolution: json.containsKey('resolution')
        ? asT<double>(json['resolution'])!
        : 0,
  );

  double resolution;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'resolution': resolution,
  };
}

class InputShaper51 {
  InputShaper51({
    required this.shaperType,
    required this.shaperTypeX,
    required this.dampingRatioX,
    required this.shaperFreqX,
    required this.shaperTypeY,
    required this.dampingRatioY,
    required this.shaperFreqY,
  });

  factory InputShaper51.fromJson(Map<String, dynamic> json) => InputShaper51(
    shaperType: json.containsKey('shaper_type')
        ? asT<String>(json['shaper_type'])!
        : '',
    shaperTypeX: json.containsKey('shaper_type_x')
        ? asT<String>(json['shaper_type_x'])!
        : '',
    dampingRatioX: json.containsKey('damping_ratio_x')
        ? asT<double>(json['damping_ratio_x'])!
        : 0,
    shaperFreqX: json.containsKey('shaper_freq_x')
        ? asT<double>(json['shaper_freq_x'])!
        : 0,
    shaperTypeY: json.containsKey('shaper_type_y')
        ? asT<String>(json['shaper_type_y'])!
        : '',
    dampingRatioY: json.containsKey('damping_ratio_y')
        ? asT<double>(json['damping_ratio_y'])!
        : 0,
    shaperFreqY: json.containsKey('shaper_freq_y')
        ? asT<double>(json['shaper_freq_y'])!
        : 0,
  );

  String shaperType;
  String shaperTypeX;
  double dampingRatioX;
  double shaperFreqX;
  String shaperTypeY;
  double dampingRatioY;
  double shaperFreqY;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'shaper_type': shaperType,
    'shaper_type_x': shaperTypeX,
    'damping_ratio_x': dampingRatioX,
    'shaper_freq_x': shaperFreqX,
    'shaper_type_y': shaperTypeY,
    'damping_ratio_y': dampingRatioY,
    'shaper_freq_y': shaperFreqY,
  };
}

class Probe72 {
  Probe72({
    required this.zOffset,
    required this.deactivateOnEachSample,
    required this.activateGcode,
    required this.deactivateGcode,
    required this.pin,
    required this.speed,
    required this.liftSpeed,
    required this.xOffset,
    required this.yOffset,
    required this.samples,
    required this.sampleRetractDist,
    required this.samplesResult,
    required this.samplesTolerance,
    required this.samplesToleranceRetries,
  });

  factory Probe72.fromJson(Map<String, dynamic> json) => Probe72(
    zOffset:
    json.containsKey('z_offset') ? asT<double>(json['z_offset'])! : 0,
    deactivateOnEachSample: json.containsKey('deactivate_on_each_sample')
        ? asT<bool>(json['deactivate_on_each_sample'])!
        : false,
    activateGcode: json.containsKey('activate_gcode')
        ? asT<String>(json['activate_gcode'])!
        : '',
    deactivateGcode: json.containsKey('deactivate_gcode')
        ? asT<String>(json['deactivate_gcode'])!
        : '',
    pin: json.containsKey('pin') ? asT<String>(json['pin'])! : '',
    speed: json.containsKey('speed') ? asT<double>(json['speed'])! : 0,
    liftSpeed: json.containsKey('lift_speed')
        ? asT<double>(json['lift_speed'])!
        : 0,
    xOffset:
    json.containsKey('x_offset') ? asT<double>(json['x_offset'])! : 0,
    yOffset:
    json.containsKey('y_offset') ? asT<double>(json['y_offset'])! : 0,
    samples: json.containsKey('samples') ? asT<int>(json['samples'])! : 0,
    sampleRetractDist: json.containsKey('sample_retract_dist')
        ? asT<double>(json['sample_retract_dist'])!
        : 0,
    samplesResult: json.containsKey('samples_result')
        ? asT<String>(json['samples_result'])!
        : '',
    samplesTolerance: json.containsKey('samples_tolerance')
        ? asT<double>(json['samples_tolerance'])!
        : 0,
    samplesToleranceRetries: json.containsKey('samples_tolerance_retries')
        ? asT<int>(json['samples_tolerance_retries'])!
        : 0,
  );

  double zOffset;
  bool deactivateOnEachSample;
  String activateGcode;
  String deactivateGcode;
  String pin;
  double speed;
  double liftSpeed;
  double xOffset;
  double yOffset;
  int samples;
  double sampleRetractDist;
  String samplesResult;
  double samplesTolerance;
  int samplesToleranceRetries;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'z_offset': zOffset,
    'deactivate_on_each_sample': deactivateOnEachSample,
    'activate_gcode': activateGcode,
    'deactivate_gcode': deactivateGcode,
    'pin': pin,
    'speed': speed,
    'lift_speed': liftSpeed,
    'x_offset': xOffset,
    'y_offset': yOffset,
    'samples': samples,
    'sample_retract_dist': sampleRetractDist,
    'samples_result': samplesResult,
    'samples_tolerance': samplesTolerance,
    'samples_tolerance_retries': samplesToleranceRetries,
  };
}

class ZTilt62 {
  ZTilt62({
    required this.zPositions,
    required this.retries,
    required this.retryTolerance,
    required this.points,
    required this.horizontalMoveZ,
    required this.speed,
  });

  factory ZTilt62.fromJson(Map<String, dynamic> json) {
    List<List<double>>? zPositions =
    json['z_positions'] is List ? <List<double>>[] : null;
    if (zPositions != null) {
      for (final dynamic item0 in asT<List<dynamic>>(json['z_positions'])!) {
        if (item0 != null) {
          final List<double> items1 = <double>[];
          for (final dynamic item1 in asT<List<dynamic>>(item0)!) {
            if (item1 != null) {
              tryCatch(() {
                items1?.add(asT<double>(item1)!);
              });
            }
          }
          zPositions.add(items1);
        }
      }
    }

    if (zPositions == null) {
      zPositions = <List<double>>[];
    }

    List<List<double>>? points =
    json['points'] is List ? <List<double>>[] : null;
    if (points != null) {
      for (final dynamic item0 in asT<List<dynamic>>(json['points'])!) {
        if (item0 != null) {
          final List<double> items1 = <double>[];
          for (final dynamic item1 in asT<List<dynamic>>(item0)!) {
            if (item1 != null) {
              tryCatch(() {
                items1?.add(asT<double>(item1)!);
              });
            }
          }
          points.add(items1);
        }
      }
    }

    if (points == null) {
      points = <List<double>>[];
    }
    return ZTilt62(
      zPositions: zPositions,
      retries: json.containsKey('retries') ? asT<int>(json['retries'])! : 0,
      retryTolerance: json.containsKey('retry_tolerance')
          ? asT<double>(json['retry_tolerance'])!
          : 0,
      points: points,
      horizontalMoveZ: json.containsKey('horizontal_move_z')
          ? asT<double>(json['horizontal_move_z'])!
          : 0,
      speed: json.containsKey('speed') ? asT<double>(json['speed'])! : 0,
    );
  }

  List<List<double>>? zPositions;
  int retries;
  double retryTolerance;
  List<List<double>>? points;
  double horizontalMoveZ;
  double speed;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'z_positions': zPositions,
    'retries': retries,
    'retry_tolerance': retryTolerance,
    'points': points,
    'horizontal_move_z': horizontalMoveZ,
    'speed': speed,
  };
}

class Tmc2209StepperX19 {
  Tmc2209StepperX19({
    required this.uartPin,
    required this.uartAddress,
    required this.runCurrent,
    required this.holdCurrent,
    required this.senseResistor,
    required this.interpolate,
    required this.stealthchopThreshold,
    required this.driverMultistepFilt,
    required this.driverToff,
    required this.driverHstrt,
    required this.driverHend,
    required this.driverTbl,
    required this.driverIholddelay,
    required this.driverPwmOfs,
    required this.driverPwmGrad,
    required this.driverPwmFreq,
    required this.driverPwmAutoscale,
    required this.driverPwmAutograd,
    required this.driverPwmReg,
    required this.driverPwmLim,
    required this.driverTpowerdown,
    required this.driverSgthrs,
  });

  factory Tmc2209StepperX19.fromJson(Map<String, dynamic> json) =>
      Tmc2209StepperX19(
        uartPin:
        json.containsKey('uart_pin') ? asT<String>(json['uart_pin'])! : '',
        uartAddress: json.containsKey('uart_address')
            ? asT<int>(json['uart_address'])!
            : 0,
        runCurrent: json.containsKey('run_current')
            ? asT<double>(json['run_current'])!
            : 0,
        holdCurrent: json.containsKey('hold_current')
            ? asT<double>(json['hold_current'])!
            : 0,
        senseResistor: json.containsKey('sense_resistor')
            ? asT<double>(json['sense_resistor'])!
            : 0,
        interpolate: json.containsKey('interpolate')
            ? asT<bool>(json['interpolate'])!
            : false,
        stealthchopThreshold: json.containsKey('stealthchop_threshold')
            ? asT<double>(json['stealthchop_threshold'])!
            : 0,
        driverMultistepFilt: json.containsKey('driver_multistep_filt')
            ? asT<bool>(json['driver_multistep_filt'])!
            : false,
        driverToff: json.containsKey('driver_toff')
            ? asT<int>(json['driver_toff'])!
            : 0,
        driverHstrt: json.containsKey('driver_hstrt')
            ? asT<int>(json['driver_hstrt'])!
            : 0,
        driverHend: json.containsKey('driver_hend')
            ? asT<int>(json['driver_hend'])!
            : 0,
        driverTbl:
        json.containsKey('driver_tbl') ? asT<int>(json['driver_tbl'])! : 0,
        driverIholddelay: json.containsKey('driver_iholddelay')
            ? asT<int>(json['driver_iholddelay'])!
            : 0,
        driverPwmOfs: json.containsKey('driver_pwm_ofs')
            ? asT<int>(json['driver_pwm_ofs'])!
            : 0,
        driverPwmGrad: json.containsKey('driver_pwm_grad')
            ? asT<int>(json['driver_pwm_grad'])!
            : 0,
        driverPwmFreq: json.containsKey('driver_pwm_freq')
            ? asT<int>(json['driver_pwm_freq'])!
            : 0,
        driverPwmAutoscale: json.containsKey('driver_pwm_autoscale')
            ? asT<bool>(json['driver_pwm_autoscale'])!
            : false,
        driverPwmAutograd: json.containsKey('driver_pwm_autograd')
            ? asT<bool>(json['driver_pwm_autograd'])!
            : false,
        driverPwmReg: json.containsKey('driver_pwm_reg')
            ? asT<int>(json['driver_pwm_reg'])!
            : 0,
        driverPwmLim: json.containsKey('driver_pwm_lim')
            ? asT<int>(json['driver_pwm_lim'])!
            : 0,
        driverTpowerdown: json.containsKey('driver_tpowerdown')
            ? asT<int>(json['driver_tpowerdown'])!
            : 0,
        driverSgthrs: json.containsKey('driver_sgthrs')
            ? asT<int>(json['driver_sgthrs'])!
            : 0,
      );

  String uartPin;
  int uartAddress;
  double runCurrent;
  double holdCurrent;
  double senseResistor;
  bool interpolate;
  double stealthchopThreshold;
  bool driverMultistepFilt;
  int driverToff;
  int driverHstrt;
  int driverHend;
  int driverTbl;
  int driverIholddelay;
  int driverPwmOfs;
  int driverPwmGrad;
  int driverPwmFreq;
  bool driverPwmAutoscale;
  bool driverPwmAutograd;
  int driverPwmReg;
  int driverPwmLim;
  int driverTpowerdown;
  int driverSgthrs;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'uart_pin': uartPin,
    'uart_address': uartAddress,
    'run_current': runCurrent,
    'hold_current': holdCurrent,
    'sense_resistor': senseResistor,
    'interpolate': interpolate,
    'stealthchop_threshold': stealthchopThreshold,
    'driver_multistep_filt': driverMultistepFilt,
    'driver_toff': driverToff,
    'driver_hstrt': driverHstrt,
    'driver_hend': driverHend,
    'driver_tbl': driverTbl,
    'driver_iholddelay': driverIholddelay,
    'driver_pwm_ofs': driverPwmOfs,
    'driver_pwm_grad': driverPwmGrad,
    'driver_pwm_freq': driverPwmFreq,
    'driver_pwm_autoscale': driverPwmAutoscale,
    'driver_pwm_autograd': driverPwmAutograd,
    'driver_pwm_reg': driverPwmReg,
    'driver_pwm_lim': driverPwmLim,
    'driver_tpowerdown': driverTpowerdown,
    'driver_sgthrs': driverSgthrs,
  };
}

class StepperX30 {
  StepperX30({
    required this.microsteps,
    required this.stepPin,
    required this.dirPin,
    required this.rotationDistance,
    required this.fullStepsPerRotation,
    required this.gearRatio,
    required this.enablePin,
    required this.endstopPin,
    required this.positionEndstop,
    required this.positionMin,
    required this.positionMax,
    required this.homingSpeed,
    required this.secondHomingSpeed,
    required this.homingRetractSpeed,
    required this.homingRetractDist,
    required this.homingPositiveDir,
  });

  factory StepperX30.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>>? gearRatio =
    json['gear_ratio'] is List ? <Map<String, dynamic>>[] : null;
    if (gearRatio != null) {
      for (final dynamic item in json['gear_ratio']!) {
        if (item != null) {
          tryCatch(() {
            gearRatio?.add(asT<Map<String, dynamic>>(item)!);
          });
        }
      }
    }

    if (gearRatio == null) {
      gearRatio = <Map<String, dynamic>>[];
    }
    return StepperX30(
      microsteps:
      json.containsKey('microsteps') ? asT<int>(json['microsteps'])! : 0,
      stepPin:
      json.containsKey('step_pin') ? asT<String>(json['step_pin'])! : '',
      dirPin: json.containsKey('dir_pin') ? asT<String>(json['dir_pin'])! : '',
      rotationDistance: json.containsKey('rotation_distance')
          ? asT<double>(json['rotation_distance'])!
          : 0,
      fullStepsPerRotation: json.containsKey('full_steps_per_rotation')
          ? asT<int>(json['full_steps_per_rotation'])!
          : 0,
      gearRatio: gearRatio,
      enablePin: json.containsKey('enable_pin')
          ? asT<String>(json['enable_pin'])!
          : '',
      endstopPin: json.containsKey('endstop_pin')
          ? asT<String>(json['endstop_pin'])!
          : '',
      positionEndstop: json.containsKey('position_endstop')
          ? asT<double>(json['position_endstop'])!
          : 0,
      positionMin: json.containsKey('position_min')
          ? asT<double>(json['position_min'])!
          : 0,
      positionMax: json.containsKey('position_max')
          ? asT<double>(json['position_max'])!
          : 0,
      homingSpeed: json.containsKey('homing_speed')
          ? asT<double>(json['homing_speed'])!
          : 0,
      secondHomingSpeed: json.containsKey('second_homing_speed')
          ? asT<double>(json['second_homing_speed'])!
          : 0,
      homingRetractSpeed: json.containsKey('homing_retract_speed')
          ? asT<double>(json['homing_retract_speed'])!
          : 0,
      homingRetractDist: json.containsKey('homing_retract_dist')
          ? asT<double>(json['homing_retract_dist'])!
          : 0,
      homingPositiveDir: json.containsKey('homing_positive_dir')
          ? asT<bool>(json['homing_positive_dir'])!
          : false,
    );
  }

  int microsteps;
  String stepPin;
  String dirPin;
  double rotationDistance;
  int fullStepsPerRotation;
  List<Map<String, dynamic>>? gearRatio;
  String enablePin;
  String endstopPin;
  double positionEndstop;
  double positionMin;
  double positionMax;
  double homingSpeed;
  double secondHomingSpeed;
  double homingRetractSpeed;
  double homingRetractDist;
  bool homingPositiveDir;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'microsteps': microsteps,
    'step_pin': stepPin,
    'dir_pin': dirPin,
    'rotation_distance': rotationDistance,
    'full_steps_per_rotation': fullStepsPerRotation,
    'gear_ratio': gearRatio,
    'enable_pin': enablePin,
    'endstop_pin': endstopPin,
    'position_endstop': positionEndstop,
    'position_min': positionMin,
    'position_max': positionMax,
    'homing_speed': homingSpeed,
    'second_homing_speed': secondHomingSpeed,
    'homing_retract_speed': homingRetractSpeed,
    'homing_retract_dist': homingRetractDist,
    'homing_positive_dir': homingPositiveDir,
  };
}

class Tmc2209StepperY68 {
  Tmc2209StepperY68({
    required this.uartPin,
    required this.uartAddress,
    required this.runCurrent,
    required this.holdCurrent,
    required this.senseResistor,
    required this.interpolate,
    required this.stealthchopThreshold,
    required this.driverMultistepFilt,
    required this.driverToff,
    required this.driverHstrt,
    required this.driverHend,
    required this.driverTbl,
    required this.driverIholddelay,
    required this.driverPwmOfs,
    required this.driverPwmGrad,
    required this.driverPwmFreq,
    required this.driverPwmAutoscale,
    required this.driverPwmAutograd,
    required this.driverPwmReg,
    required this.driverPwmLim,
    required this.driverTpowerdown,
    required this.driverSgthrs,
  });

  factory Tmc2209StepperY68.fromJson(Map<String, dynamic> json) =>
      Tmc2209StepperY68(
        uartPin:
        json.containsKey('uart_pin') ? asT<String>(json['uart_pin'])! : '',
        uartAddress: json.containsKey('uart_address')
            ? asT<int>(json['uart_address'])!
            : 0,
        runCurrent: json.containsKey('run_current')
            ? asT<double>(json['run_current'])!
            : 0,
        holdCurrent: json.containsKey('hold_current')
            ? asT<double>(json['hold_current'])!
            : 0,
        senseResistor: json.containsKey('sense_resistor')
            ? asT<double>(json['sense_resistor'])!
            : 0,
        interpolate: json.containsKey('interpolate')
            ? asT<bool>(json['interpolate'])!
            : false,
        stealthchopThreshold: json.containsKey('stealthchop_threshold')
            ? asT<double>(json['stealthchop_threshold'])!
            : 0,
        driverMultistepFilt: json.containsKey('driver_multistep_filt')
            ? asT<bool>(json['driver_multistep_filt'])!
            : false,
        driverToff: json.containsKey('driver_toff')
            ? asT<int>(json['driver_toff'])!
            : 0,
        driverHstrt: json.containsKey('driver_hstrt')
            ? asT<int>(json['driver_hstrt'])!
            : 0,
        driverHend: json.containsKey('driver_hend')
            ? asT<int>(json['driver_hend'])!
            : 0,
        driverTbl:
        json.containsKey('driver_tbl') ? asT<int>(json['driver_tbl'])! : 0,
        driverIholddelay: json.containsKey('driver_iholddelay')
            ? asT<int>(json['driver_iholddelay'])!
            : 0,
        driverPwmOfs: json.containsKey('driver_pwm_ofs')
            ? asT<int>(json['driver_pwm_ofs'])!
            : 0,
        driverPwmGrad: json.containsKey('driver_pwm_grad')
            ? asT<int>(json['driver_pwm_grad'])!
            : 0,
        driverPwmFreq: json.containsKey('driver_pwm_freq')
            ? asT<int>(json['driver_pwm_freq'])!
            : 0,
        driverPwmAutoscale: json.containsKey('driver_pwm_autoscale')
            ? asT<bool>(json['driver_pwm_autoscale'])!
            : false,
        driverPwmAutograd: json.containsKey('driver_pwm_autograd')
            ? asT<bool>(json['driver_pwm_autograd'])!
            : false,
        driverPwmReg: json.containsKey('driver_pwm_reg')
            ? asT<int>(json['driver_pwm_reg'])!
            : 0,
        driverPwmLim: json.containsKey('driver_pwm_lim')
            ? asT<int>(json['driver_pwm_lim'])!
            : 0,
        driverTpowerdown: json.containsKey('driver_tpowerdown')
            ? asT<int>(json['driver_tpowerdown'])!
            : 0,
        driverSgthrs: json.containsKey('driver_sgthrs')
            ? asT<int>(json['driver_sgthrs'])!
            : 0,
      );

  String uartPin;
  int uartAddress;
  double runCurrent;
  double holdCurrent;
  double senseResistor;
  bool interpolate;
  double stealthchopThreshold;
  bool driverMultistepFilt;
  int driverToff;
  int driverHstrt;
  int driverHend;
  int driverTbl;
  int driverIholddelay;
  int driverPwmOfs;
  int driverPwmGrad;
  int driverPwmFreq;
  bool driverPwmAutoscale;
  bool driverPwmAutograd;
  int driverPwmReg;
  int driverPwmLim;
  int driverTpowerdown;
  int driverSgthrs;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'uart_pin': uartPin,
    'uart_address': uartAddress,
    'run_current': runCurrent,
    'hold_current': holdCurrent,
    'sense_resistor': senseResistor,
    'interpolate': interpolate,
    'stealthchop_threshold': stealthchopThreshold,
    'driver_multistep_filt': driverMultistepFilt,
    'driver_toff': driverToff,
    'driver_hstrt': driverHstrt,
    'driver_hend': driverHend,
    'driver_tbl': driverTbl,
    'driver_iholddelay': driverIholddelay,
    'driver_pwm_ofs': driverPwmOfs,
    'driver_pwm_grad': driverPwmGrad,
    'driver_pwm_freq': driverPwmFreq,
    'driver_pwm_autoscale': driverPwmAutoscale,
    'driver_pwm_autograd': driverPwmAutograd,
    'driver_pwm_reg': driverPwmReg,
    'driver_pwm_lim': driverPwmLim,
    'driver_tpowerdown': driverTpowerdown,
    'driver_sgthrs': driverSgthrs,
  };
}

class StepperY02 {
  StepperY02({
    required this.microsteps,
    required this.stepPin,
    required this.dirPin,
    required this.rotationDistance,
    required this.fullStepsPerRotation,
    required this.gearRatio,
    required this.enablePin,
    required this.endstopPin,
    required this.positionEndstop,
    required this.positionMin,
    required this.positionMax,
    required this.homingSpeed,
    required this.secondHomingSpeed,
    required this.homingRetractSpeed,
    required this.homingRetractDist,
    required this.homingPositiveDir,
  });

  factory StepperY02.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>>? gearRatio =
    json['gear_ratio'] is List ? <Map<String, dynamic>>[] : null;
    if (gearRatio != null) {
      for (final dynamic item in json['gear_ratio']!) {
        if (item != null) {
          tryCatch(() {
            gearRatio?.add(asT<Map<String, dynamic>>(item)!);
          });
        }
      }
    }

    if (gearRatio == null) {
      gearRatio = <Map<String, dynamic>>[];
    }
    return StepperY02(
      microsteps:
      json.containsKey('microsteps') ? asT<int>(json['microsteps'])! : 0,
      stepPin:
      json.containsKey('step_pin') ? asT<String>(json['step_pin'])! : '',
      dirPin: json.containsKey('dir_pin') ? asT<String>(json['dir_pin'])! : '',
      rotationDistance: json.containsKey('rotation_distance')
          ? asT<double>(json['rotation_distance'])!
          : 0,
      fullStepsPerRotation: json.containsKey('full_steps_per_rotation')
          ? asT<int>(json['full_steps_per_rotation'])!
          : 0,
      gearRatio: gearRatio,
      enablePin: json.containsKey('enable_pin')
          ? asT<String>(json['enable_pin'])!
          : '',
      endstopPin: json.containsKey('endstop_pin')
          ? asT<String>(json['endstop_pin'])!
          : '',
      positionEndstop: json.containsKey('position_endstop')
          ? asT<double>(json['position_endstop'])!
          : 0,
      positionMin: json.containsKey('position_min')
          ? asT<double>(json['position_min'])!
          : 0,
      positionMax: json.containsKey('position_max')
          ? asT<double>(json['position_max'])!
          : 0,
      homingSpeed: json.containsKey('homing_speed')
          ? asT<double>(json['homing_speed'])!
          : 0,
      secondHomingSpeed: json.containsKey('second_homing_speed')
          ? asT<double>(json['second_homing_speed'])!
          : 0,
      homingRetractSpeed: json.containsKey('homing_retract_speed')
          ? asT<double>(json['homing_retract_speed'])!
          : 0,
      homingRetractDist: json.containsKey('homing_retract_dist')
          ? asT<double>(json['homing_retract_dist'])!
          : 0,
      homingPositiveDir: json.containsKey('homing_positive_dir')
          ? asT<bool>(json['homing_positive_dir'])!
          : false,
    );
  }

  int microsteps;
  String stepPin;
  String dirPin;
  double rotationDistance;
  int fullStepsPerRotation;
  List<Map<String, dynamic>>? gearRatio;
  String enablePin;
  String endstopPin;
  double positionEndstop;
  double positionMin;
  double positionMax;
  double homingSpeed;
  double secondHomingSpeed;
  double homingRetractSpeed;
  double homingRetractDist;
  bool homingPositiveDir;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'microsteps': microsteps,
    'step_pin': stepPin,
    'dir_pin': dirPin,
    'rotation_distance': rotationDistance,
    'full_steps_per_rotation': fullStepsPerRotation,
    'gear_ratio': gearRatio,
    'enable_pin': enablePin,
    'endstop_pin': endstopPin,
    'position_endstop': positionEndstop,
    'position_min': positionMin,
    'position_max': positionMax,
    'homing_speed': homingSpeed,
    'second_homing_speed': secondHomingSpeed,
    'homing_retract_speed': homingRetractSpeed,
    'homing_retract_dist': homingRetractDist,
    'homing_positive_dir': homingPositiveDir,
  };
}

class Tmc2209StepperZ26 {
  Tmc2209StepperZ26({
    required this.uartPin,
    required this.uartAddress,
    required this.runCurrent,
    required this.holdCurrent,
    required this.senseResistor,
    required this.interpolate,
    required this.stealthchopThreshold,
    required this.driverMultistepFilt,
    required this.driverToff,
    required this.driverHstrt,
    required this.driverHend,
    required this.driverTbl,
    required this.driverIholddelay,
    required this.driverPwmOfs,
    required this.driverPwmGrad,
    required this.driverPwmFreq,
    required this.driverPwmAutoscale,
    required this.driverPwmAutograd,
    required this.driverPwmReg,
    required this.driverPwmLim,
    required this.driverTpowerdown,
    required this.driverSgthrs,
  });

  factory Tmc2209StepperZ26.fromJson(Map<String, dynamic> json) =>
      Tmc2209StepperZ26(
        uartPin:
        json.containsKey('uart_pin') ? asT<String>(json['uart_pin'])! : '',
        uartAddress: json.containsKey('uart_address')
            ? asT<int>(json['uart_address'])!
            : 0,
        runCurrent: json.containsKey('run_current')
            ? asT<double>(json['run_current'])!
            : 0,
        holdCurrent: json.containsKey('hold_current')
            ? asT<double>(json['hold_current'])!
            : 0,
        senseResistor: json.containsKey('sense_resistor')
            ? asT<double>(json['sense_resistor'])!
            : 0,
        interpolate: json.containsKey('interpolate')
            ? asT<bool>(json['interpolate'])!
            : false,
        stealthchopThreshold: json.containsKey('stealthchop_threshold')
            ? asT<double>(json['stealthchop_threshold'])!
            : 0,
        driverMultistepFilt: json.containsKey('driver_multistep_filt')
            ? asT<bool>(json['driver_multistep_filt'])!
            : false,
        driverToff: json.containsKey('driver_toff')
            ? asT<int>(json['driver_toff'])!
            : 0,
        driverHstrt: json.containsKey('driver_hstrt')
            ? asT<int>(json['driver_hstrt'])!
            : 0,
        driverHend: json.containsKey('driver_hend')
            ? asT<int>(json['driver_hend'])!
            : 0,
        driverTbl:
        json.containsKey('driver_tbl') ? asT<int>(json['driver_tbl'])! : 0,
        driverIholddelay: json.containsKey('driver_iholddelay')
            ? asT<int>(json['driver_iholddelay'])!
            : 0,
        driverPwmOfs: json.containsKey('driver_pwm_ofs')
            ? asT<int>(json['driver_pwm_ofs'])!
            : 0,
        driverPwmGrad: json.containsKey('driver_pwm_grad')
            ? asT<int>(json['driver_pwm_grad'])!
            : 0,
        driverPwmFreq: json.containsKey('driver_pwm_freq')
            ? asT<int>(json['driver_pwm_freq'])!
            : 0,
        driverPwmAutoscale: json.containsKey('driver_pwm_autoscale')
            ? asT<bool>(json['driver_pwm_autoscale'])!
            : false,
        driverPwmAutograd: json.containsKey('driver_pwm_autograd')
            ? asT<bool>(json['driver_pwm_autograd'])!
            : false,
        driverPwmReg: json.containsKey('driver_pwm_reg')
            ? asT<int>(json['driver_pwm_reg'])!
            : 0,
        driverPwmLim: json.containsKey('driver_pwm_lim')
            ? asT<int>(json['driver_pwm_lim'])!
            : 0,
        driverTpowerdown: json.containsKey('driver_tpowerdown')
            ? asT<int>(json['driver_tpowerdown'])!
            : 0,
        driverSgthrs: json.containsKey('driver_sgthrs')
            ? asT<int>(json['driver_sgthrs'])!
            : 0,
      );

  String uartPin;
  int uartAddress;
  double runCurrent;
  double holdCurrent;
  double senseResistor;
  bool interpolate;
  double stealthchopThreshold;
  bool driverMultistepFilt;
  int driverToff;
  int driverHstrt;
  int driverHend;
  int driverTbl;
  int driverIholddelay;
  int driverPwmOfs;
  int driverPwmGrad;
  int driverPwmFreq;
  bool driverPwmAutoscale;
  bool driverPwmAutograd;
  int driverPwmReg;
  int driverPwmLim;
  int driverTpowerdown;
  int driverSgthrs;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'uart_pin': uartPin,
    'uart_address': uartAddress,
    'run_current': runCurrent,
    'hold_current': holdCurrent,
    'sense_resistor': senseResistor,
    'interpolate': interpolate,
    'stealthchop_threshold': stealthchopThreshold,
    'driver_multistep_filt': driverMultistepFilt,
    'driver_toff': driverToff,
    'driver_hstrt': driverHstrt,
    'driver_hend': driverHend,
    'driver_tbl': driverTbl,
    'driver_iholddelay': driverIholddelay,
    'driver_pwm_ofs': driverPwmOfs,
    'driver_pwm_grad': driverPwmGrad,
    'driver_pwm_freq': driverPwmFreq,
    'driver_pwm_autoscale': driverPwmAutoscale,
    'driver_pwm_autograd': driverPwmAutograd,
    'driver_pwm_reg': driverPwmReg,
    'driver_pwm_lim': driverPwmLim,
    'driver_tpowerdown': driverTpowerdown,
    'driver_sgthrs': driverSgthrs,
  };
}

class StepperZ94 {
  StepperZ94({
    required this.microsteps,
    required this.stepPin,
    required this.dirPin,
    required this.rotationDistance,
    required this.fullStepsPerRotation,
    required this.gearRatio,
    required this.enablePin,
    required this.endstopPin,
    required this.positionMin,
    required this.positionMax,
    required this.homingSpeed,
    required this.secondHomingSpeed,
    required this.homingRetractSpeed,
    required this.homingRetractDist,
    required this.homingPositiveDir,
  });

  factory StepperZ94.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>>? gearRatio =
    json['gear_ratio'] is List ? <Map<String, dynamic>>[] : null;
    if (gearRatio != null) {
      for (final dynamic item in json['gear_ratio']!) {
        if (item != null) {
          tryCatch(() {
            gearRatio?.add(asT<Map<String, dynamic>>(item)!);
          });
        }
      }
    }

    if (gearRatio == null) {
      gearRatio = <Map<String, dynamic>>[];
    }
    return StepperZ94(
      microsteps:
      json.containsKey('microsteps') ? asT<int>(json['microsteps'])! : 0,
      stepPin:
      json.containsKey('step_pin') ? asT<String>(json['step_pin'])! : '',
      dirPin: json.containsKey('dir_pin') ? asT<String>(json['dir_pin'])! : '',
      rotationDistance: json.containsKey('rotation_distance')
          ? asT<double>(json['rotation_distance'])!
          : 0,
      fullStepsPerRotation: json.containsKey('full_steps_per_rotation')
          ? asT<int>(json['full_steps_per_rotation'])!
          : 0,
      gearRatio: gearRatio,
      enablePin: json.containsKey('enable_pin')
          ? asT<String>(json['enable_pin'])!
          : '',
      endstopPin: json.containsKey('endstop_pin')
          ? asT<String>(json['endstop_pin'])!
          : '',
      positionMin: json.containsKey('position_min')
          ? asT<double>(json['position_min'])!
          : 0,
      positionMax: json.containsKey('position_max')
          ? asT<double>(json['position_max'])!
          : 0,
      homingSpeed: json.containsKey('homing_speed')
          ? asT<double>(json['homing_speed'])!
          : 0,
      secondHomingSpeed: json.containsKey('second_homing_speed')
          ? asT<double>(json['second_homing_speed'])!
          : 0,
      homingRetractSpeed: json.containsKey('homing_retract_speed')
          ? asT<double>(json['homing_retract_speed'])!
          : 0,
      homingRetractDist: json.containsKey('homing_retract_dist')
          ? asT<double>(json['homing_retract_dist'])!
          : 0,
      homingPositiveDir: json.containsKey('homing_positive_dir')
          ? asT<bool>(json['homing_positive_dir'])!
          : false,
    );
  }

  int microsteps;
  String stepPin;
  String dirPin;
  double rotationDistance;
  int fullStepsPerRotation;
  List<Map<String, dynamic>>? gearRatio;
  String enablePin;
  String endstopPin;
  double positionMin;
  double positionMax;
  double homingSpeed;
  double secondHomingSpeed;
  double homingRetractSpeed;
  double homingRetractDist;
  bool homingPositiveDir;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'microsteps': microsteps,
    'step_pin': stepPin,
    'dir_pin': dirPin,
    'rotation_distance': rotationDistance,
    'full_steps_per_rotation': fullStepsPerRotation,
    'gear_ratio': gearRatio,
    'enable_pin': enablePin,
    'endstop_pin': endstopPin,
    'position_min': positionMin,
    'position_max': positionMax,
    'homing_speed': homingSpeed,
    'second_homing_speed': secondHomingSpeed,
    'homing_retract_speed': homingRetractSpeed,
    'homing_retract_dist': homingRetractDist,
    'homing_positive_dir': homingPositiveDir,
  };
}

class Tmc2209Extruder19 {
  Tmc2209Extruder19({
    required this.uartPin,
    required this.uartAddress,
    required this.runCurrent,
    required this.holdCurrent,
    required this.senseResistor,
    required this.interpolate,
    required this.stealthchopThreshold,
    required this.driverMultistepFilt,
    required this.driverToff,
    required this.driverHstrt,
    required this.driverHend,
    required this.driverTbl,
    required this.driverIholddelay,
    required this.driverPwmOfs,
    required this.driverPwmGrad,
    required this.driverPwmFreq,
    required this.driverPwmAutoscale,
    required this.driverPwmAutograd,
    required this.driverPwmReg,
    required this.driverPwmLim,
    required this.driverTpowerdown,
    required this.driverSgthrs,
  });

  factory Tmc2209Extruder19.fromJson(Map<String, dynamic> json) =>
      Tmc2209Extruder19(
        uartPin:
        json.containsKey('uart_pin') ? asT<String>(json['uart_pin'])! : '',
        uartAddress: json.containsKey('uart_address')
            ? asT<int>(json['uart_address'])!
            : 0,
        runCurrent: json.containsKey('run_current')
            ? asT<double>(json['run_current'])!
            : 0,
        holdCurrent: json.containsKey('hold_current')
            ? asT<double>(json['hold_current'])!
            : 0,
        senseResistor: json.containsKey('sense_resistor')
            ? asT<double>(json['sense_resistor'])!
            : 0,
        interpolate: json.containsKey('interpolate')
            ? asT<bool>(json['interpolate'])!
            : false,
        stealthchopThreshold: json.containsKey('stealthchop_threshold')
            ? asT<double>(json['stealthchop_threshold'])!
            : 0,
        driverMultistepFilt: json.containsKey('driver_multistep_filt')
            ? asT<bool>(json['driver_multistep_filt'])!
            : false,
        driverToff: json.containsKey('driver_toff')
            ? asT<int>(json['driver_toff'])!
            : 0,
        driverHstrt: json.containsKey('driver_hstrt')
            ? asT<int>(json['driver_hstrt'])!
            : 0,
        driverHend: json.containsKey('driver_hend')
            ? asT<int>(json['driver_hend'])!
            : 0,
        driverTbl:
        json.containsKey('driver_tbl') ? asT<int>(json['driver_tbl'])! : 0,
        driverIholddelay: json.containsKey('driver_iholddelay')
            ? asT<int>(json['driver_iholddelay'])!
            : 0,
        driverPwmOfs: json.containsKey('driver_pwm_ofs')
            ? asT<int>(json['driver_pwm_ofs'])!
            : 0,
        driverPwmGrad: json.containsKey('driver_pwm_grad')
            ? asT<int>(json['driver_pwm_grad'])!
            : 0,
        driverPwmFreq: json.containsKey('driver_pwm_freq')
            ? asT<int>(json['driver_pwm_freq'])!
            : 0,
        driverPwmAutoscale: json.containsKey('driver_pwm_autoscale')
            ? asT<bool>(json['driver_pwm_autoscale'])!
            : false,
        driverPwmAutograd: json.containsKey('driver_pwm_autograd')
            ? asT<bool>(json['driver_pwm_autograd'])!
            : false,
        driverPwmReg: json.containsKey('driver_pwm_reg')
            ? asT<int>(json['driver_pwm_reg'])!
            : 0,
        driverPwmLim: json.containsKey('driver_pwm_lim')
            ? asT<int>(json['driver_pwm_lim'])!
            : 0,
        driverTpowerdown: json.containsKey('driver_tpowerdown')
            ? asT<int>(json['driver_tpowerdown'])!
            : 0,
        driverSgthrs: json.containsKey('driver_sgthrs')
            ? asT<int>(json['driver_sgthrs'])!
            : 0,
      );

  String uartPin;
  int uartAddress;
  double runCurrent;
  double holdCurrent;
  double senseResistor;
  bool interpolate;
  double stealthchopThreshold;
  bool driverMultistepFilt;
  int driverToff;
  int driverHstrt;
  int driverHend;
  int driverTbl;
  int driverIholddelay;
  int driverPwmOfs;
  int driverPwmGrad;
  int driverPwmFreq;
  bool driverPwmAutoscale;
  bool driverPwmAutograd;
  int driverPwmReg;
  int driverPwmLim;
  int driverTpowerdown;
  int driverSgthrs;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'uart_pin': uartPin,
    'uart_address': uartAddress,
    'run_current': runCurrent,
    'hold_current': holdCurrent,
    'sense_resistor': senseResistor,
    'interpolate': interpolate,
    'stealthchop_threshold': stealthchopThreshold,
    'driver_multistep_filt': driverMultistepFilt,
    'driver_toff': driverToff,
    'driver_hstrt': driverHstrt,
    'driver_hend': driverHend,
    'driver_tbl': driverTbl,
    'driver_iholddelay': driverIholddelay,
    'driver_pwm_ofs': driverPwmOfs,
    'driver_pwm_grad': driverPwmGrad,
    'driver_pwm_freq': driverPwmFreq,
    'driver_pwm_autoscale': driverPwmAutoscale,
    'driver_pwm_autograd': driverPwmAutograd,
    'driver_pwm_reg': driverPwmReg,
    'driver_pwm_lim': driverPwmLim,
    'driver_tpowerdown': driverTpowerdown,
    'driver_sgthrs': driverSgthrs,
  };
}

class Extruder14 {
  Extruder14({
    required this.microsteps,
    required this.sensorType,
    required this.pullupResistor,
    required this.inlineResistor,
    required this.sensorPin,
    required this.minTemp,
    required this.maxTemp,
    required this.minExtrudeTemp,
    required this.maxPower,
    required this.smoothTime,
    required this.control,
    required this.pidKp,
    required this.pidKi,
    required this.pidKd,
    required this.heaterPin,
    required this.pwmCycleTime,
    required this.nozzleDiameter,
    required this.filamentDiameter,
    required this.maxExtrudeCrossSection,
    required this.maxExtrudeOnlyVelocity,
    required this.maxExtrudeOnlyAccel,
    required this.maxExtrudeOnlyDistance,
    required this.instantaneousCornerVelocity,
    required this.stepPin,
    required this.pressureAdvance,
    required this.pressureAdvanceSmoothTime,
    required this.dirPin,
    required this.rotationDistance,
    required this.fullStepsPerRotation,
    required this.gearRatio,
    required this.enablePin,
  });

  factory Extruder14.fromJson(Map<String, dynamic> json) {
    List<List<double>>? gearRatio =
    json['gear_ratio'] is List ? <List<double>>[] : null;
    if (gearRatio != null) {
      for (final dynamic item0 in asT<List<dynamic>>(json['gear_ratio'])!) {
        if (item0 != null) {
          final List<double> items1 = <double>[];
          for (final dynamic item1 in asT<List<dynamic>>(item0)!) {
            if (item1 != null) {
              tryCatch(() {
                items1?.add(asT<double>(item1)!);
              });
            }
          }
          gearRatio.add(items1);
        }
      }
    }

    if (gearRatio == null) {
      gearRatio = <List<double>>[];
    }
    return Extruder14(
      microsteps:
      json.containsKey('microsteps') ? asT<int>(json['microsteps'])! : 0,
      sensorType: json.containsKey('sensor_type')
          ? asT<String>(json['sensor_type'])!
          : '',
      pullupResistor: json.containsKey('pullup_resistor')
          ? asT<double>(json['pullup_resistor'])!
          : 0,
      inlineResistor: json.containsKey('inline_resistor')
          ? asT<double>(json['inline_resistor'])!
          : 0,
      sensorPin: json.containsKey('sensor_pin')
          ? asT<String>(json['sensor_pin'])!
          : '',
      minTemp:
      json.containsKey('min_temp') ? asT<double>(json['min_temp'])! : 0,
      maxTemp:
      json.containsKey('max_temp') ? asT<double>(json['max_temp'])! : 0,
      minExtrudeTemp: json.containsKey('min_extrude_temp')
          ? asT<double>(json['min_extrude_temp'])!
          : 0,
      maxPower:
      json.containsKey('max_power') ? asT<double>(json['max_power'])! : 0,
      smoothTime: json.containsKey('smooth_time')
          ? asT<double>(json['smooth_time'])!
          : 0,
      control: json.containsKey('control') ? asT<String>(json['control'])! : '',
      pidKp: json.containsKey('pid_kp') ? asT<double>(json['pid_kp'])! : 0,
      pidKi: json.containsKey('pid_ki') ? asT<double>(json['pid_ki'])! : 0,
      pidKd: json.containsKey('pid_kd') ? asT<double>(json['pid_kd'])! : 0,
      heaterPin: json.containsKey('heater_pin')
          ? asT<String>(json['heater_pin'])!
          : '',
      pwmCycleTime: json.containsKey('pwm_cycle_time')
          ? asT<double>(json['pwm_cycle_time'])!
          : 0,
      nozzleDiameter: json.containsKey('nozzle_diameter')
          ? asT<double>(json['nozzle_diameter'])!
          : 0,
      filamentDiameter: json.containsKey('filament_diameter')
          ? asT<double>(json['filament_diameter'])!
          : 0,
      maxExtrudeCrossSection: json.containsKey('max_extrude_cross_section')
          ? asT<double>(json['max_extrude_cross_section'])!
          : 0,
      maxExtrudeOnlyVelocity: json.containsKey('max_extrude_only_velocity')
          ? asT<double>(json['max_extrude_only_velocity'])!
          : 0,
      maxExtrudeOnlyAccel: json.containsKey('max_extrude_only_accel')
          ? asT<double>(json['max_extrude_only_accel'])!
          : 0,
      maxExtrudeOnlyDistance: json.containsKey('max_extrude_only_distance')
          ? asT<double>(json['max_extrude_only_distance'])!
          : 0,
      instantaneousCornerVelocity:
      json.containsKey('instantaneous_corner_velocity')
          ? asT<double>(json['instantaneous_corner_velocity'])!
          : 0,
      stepPin:
      json.containsKey('step_pin') ? asT<String>(json['step_pin'])! : '',
      pressureAdvance: json.containsKey('pressure_advance')
          ? asT<double>(json['pressure_advance'])!
          : 0,
      pressureAdvanceSmoothTime:
      json.containsKey('pressure_advance_smooth_time')
          ? asT<double>(json['pressure_advance_smooth_time'])!
          : 0,
      dirPin: json.containsKey('dir_pin') ? asT<String>(json['dir_pin'])! : '',
      rotationDistance: json.containsKey('rotation_distance')
          ? asT<double>(json['rotation_distance'])!
          : 0,
      fullStepsPerRotation: json.containsKey('full_steps_per_rotation')
          ? asT<int>(json['full_steps_per_rotation'])!
          : 0,
      gearRatio: gearRatio,
      enablePin: json.containsKey('enable_pin')
          ? asT<String>(json['enable_pin'])!
          : '',
    );
  }

  int microsteps;
  String sensorType;
  double pullupResistor;
  double inlineResistor;
  String sensorPin;
  double minTemp;
  double maxTemp;
  double minExtrudeTemp;
  double maxPower;
  double smoothTime;
  String control;
  double pidKp;
  double pidKi;
  double pidKd;
  String heaterPin;
  double pwmCycleTime;
  double nozzleDiameter;
  double filamentDiameter;
  double maxExtrudeCrossSection;
  double maxExtrudeOnlyVelocity;
  double maxExtrudeOnlyAccel;
  double maxExtrudeOnlyDistance;
  double instantaneousCornerVelocity;
  String stepPin;
  double pressureAdvance;
  double pressureAdvanceSmoothTime;
  String dirPin;
  double rotationDistance;
  int fullStepsPerRotation;
  List<List<double>>? gearRatio;
  String enablePin;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'microsteps': microsteps,
    'sensor_type': sensorType,
    'pullup_resistor': pullupResistor,
    'inline_resistor': inlineResistor,
    'sensor_pin': sensorPin,
    'min_temp': minTemp,
    'max_temp': maxTemp,
    'min_extrude_temp': minExtrudeTemp,
    'max_power': maxPower,
    'smooth_time': smoothTime,
    'control': control,
    'pid_kp': pidKp,
    'pid_ki': pidKi,
    'pid_kd': pidKd,
    'heater_pin': heaterPin,
    'pwm_cycle_time': pwmCycleTime,
    'nozzle_diameter': nozzleDiameter,
    'filament_diameter': filamentDiameter,
    'max_extrude_cross_section': maxExtrudeCrossSection,
    'max_extrude_only_velocity': maxExtrudeOnlyVelocity,
    'max_extrude_only_accel': maxExtrudeOnlyAccel,
    'max_extrude_only_distance': maxExtrudeOnlyDistance,
    'instantaneous_corner_velocity': instantaneousCornerVelocity,
    'step_pin': stepPin,
    'pressure_advance': pressureAdvance,
    'pressure_advance_smooth_time': pressureAdvanceSmoothTime,
    'dir_pin': dirPin,
    'rotation_distance': rotationDistance,
    'full_steps_per_rotation': fullStepsPerRotation,
    'gear_ratio': gearRatio,
    'enable_pin': enablePin,
  };
}

class Tmc2209StepperZ110 {
  Tmc2209StepperZ110({
    required this.uartPin,
    required this.uartAddress,
    required this.runCurrent,
    required this.holdCurrent,
    required this.senseResistor,
    required this.interpolate,
    required this.stealthchopThreshold,
    required this.driverMultistepFilt,
    required this.driverToff,
    required this.driverHstrt,
    required this.driverHend,
    required this.driverTbl,
    required this.driverIholddelay,
    required this.driverPwmOfs,
    required this.driverPwmGrad,
    required this.driverPwmFreq,
    required this.driverPwmAutoscale,
    required this.driverPwmAutograd,
    required this.driverPwmReg,
    required this.driverPwmLim,
    required this.driverTpowerdown,
    required this.driverSgthrs,
  });

  factory Tmc2209StepperZ110.fromJson(Map<String, dynamic> json) =>
      Tmc2209StepperZ110(
        uartPin:
        json.containsKey('uart_pin') ? asT<String>(json['uart_pin'])! : '',
        uartAddress: json.containsKey('uart_address')
            ? asT<int>(json['uart_address'])!
            : 0,
        runCurrent: json.containsKey('run_current')
            ? asT<double>(json['run_current'])!
            : 0,
        holdCurrent: json.containsKey('hold_current')
            ? asT<double>(json['hold_current'])!
            : 0,
        senseResistor: json.containsKey('sense_resistor')
            ? asT<double>(json['sense_resistor'])!
            : 0,
        interpolate: json.containsKey('interpolate')
            ? asT<bool>(json['interpolate'])!
            : false,
        stealthchopThreshold: json.containsKey('stealthchop_threshold')
            ? asT<double>(json['stealthchop_threshold'])!
            : 0,
        driverMultistepFilt: json.containsKey('driver_multistep_filt')
            ? asT<bool>(json['driver_multistep_filt'])!
            : false,
        driverToff: json.containsKey('driver_toff')
            ? asT<int>(json['driver_toff'])!
            : 0,
        driverHstrt: json.containsKey('driver_hstrt')
            ? asT<int>(json['driver_hstrt'])!
            : 0,
        driverHend: json.containsKey('driver_hend')
            ? asT<int>(json['driver_hend'])!
            : 0,
        driverTbl:
        json.containsKey('driver_tbl') ? asT<int>(json['driver_tbl'])! : 0,
        driverIholddelay: json.containsKey('driver_iholddelay')
            ? asT<int>(json['driver_iholddelay'])!
            : 0,
        driverPwmOfs: json.containsKey('driver_pwm_ofs')
            ? asT<int>(json['driver_pwm_ofs'])!
            : 0,
        driverPwmGrad: json.containsKey('driver_pwm_grad')
            ? asT<int>(json['driver_pwm_grad'])!
            : 0,
        driverPwmFreq: json.containsKey('driver_pwm_freq')
            ? asT<int>(json['driver_pwm_freq'])!
            : 0,
        driverPwmAutoscale: json.containsKey('driver_pwm_autoscale')
            ? asT<bool>(json['driver_pwm_autoscale'])!
            : false,
        driverPwmAutograd: json.containsKey('driver_pwm_autograd')
            ? asT<bool>(json['driver_pwm_autograd'])!
            : false,
        driverPwmReg: json.containsKey('driver_pwm_reg')
            ? asT<int>(json['driver_pwm_reg'])!
            : 0,
        driverPwmLim: json.containsKey('driver_pwm_lim')
            ? asT<int>(json['driver_pwm_lim'])!
            : 0,
        driverTpowerdown: json.containsKey('driver_tpowerdown')
            ? asT<int>(json['driver_tpowerdown'])!
            : 0,
        driverSgthrs: json.containsKey('driver_sgthrs')
            ? asT<int>(json['driver_sgthrs'])!
            : 0,
      );

  String uartPin;
  int uartAddress;
  double runCurrent;
  double holdCurrent;
  double senseResistor;
  bool interpolate;
  double stealthchopThreshold;
  bool driverMultistepFilt;
  int driverToff;
  int driverHstrt;
  int driverHend;
  int driverTbl;
  int driverIholddelay;
  int driverPwmOfs;
  int driverPwmGrad;
  int driverPwmFreq;
  bool driverPwmAutoscale;
  bool driverPwmAutograd;
  int driverPwmReg;
  int driverPwmLim;
  int driverTpowerdown;
  int driverSgthrs;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'uart_pin': uartPin,
    'uart_address': uartAddress,
    'run_current': runCurrent,
    'hold_current': holdCurrent,
    'sense_resistor': senseResistor,
    'interpolate': interpolate,
    'stealthchop_threshold': stealthchopThreshold,
    'driver_multistep_filt': driverMultistepFilt,
    'driver_toff': driverToff,
    'driver_hstrt': driverHstrt,
    'driver_hend': driverHend,
    'driver_tbl': driverTbl,
    'driver_iholddelay': driverIholddelay,
    'driver_pwm_ofs': driverPwmOfs,
    'driver_pwm_grad': driverPwmGrad,
    'driver_pwm_freq': driverPwmFreq,
    'driver_pwm_autoscale': driverPwmAutoscale,
    'driver_pwm_autograd': driverPwmAutograd,
    'driver_pwm_reg': driverPwmReg,
    'driver_pwm_lim': driverPwmLim,
    'driver_tpowerdown': driverTpowerdown,
    'driver_sgthrs': driverSgthrs,
  };
}

class StepperZ122 {
  StepperZ122({
    required this.microsteps,
    required this.stepPin,
    required this.dirPin,
    required this.rotationDistance,
    required this.fullStepsPerRotation,
    required this.gearRatio,
    required this.enablePin,
  });

  factory StepperZ122.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>>? gearRatio =
    json['gear_ratio'] is List ? <Map<String, dynamic>>[] : null;
    if (gearRatio != null) {
      for (final dynamic item in json['gear_ratio']!) {
        if (item != null) {
          tryCatch(() {
            gearRatio?.add(asT<Map<String, dynamic>>(item)!);
          });
        }
      }
    }

    if (gearRatio == null) {
      gearRatio = <Map<String, dynamic>>[];
    }
    return StepperZ122(
      microsteps:
      json.containsKey('microsteps') ? asT<int>(json['microsteps'])! : 0,
      stepPin:
      json.containsKey('step_pin') ? asT<String>(json['step_pin'])! : '',
      dirPin: json.containsKey('dir_pin') ? asT<String>(json['dir_pin'])! : '',
      rotationDistance: json.containsKey('rotation_distance')
          ? asT<double>(json['rotation_distance'])!
          : 0,
      fullStepsPerRotation: json.containsKey('full_steps_per_rotation')
          ? asT<int>(json['full_steps_per_rotation'])!
          : 0,
      gearRatio: gearRatio,
      enablePin: json.containsKey('enable_pin')
          ? asT<String>(json['enable_pin'])!
          : '',
    );
  }

  int microsteps;
  String stepPin;
  String dirPin;
  double rotationDistance;
  int fullStepsPerRotation;
  List<Map<String, dynamic>>? gearRatio;
  String enablePin;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'microsteps': microsteps,
    'step_pin': stepPin,
    'dir_pin': dirPin,
    'rotation_distance': rotationDistance,
    'full_steps_per_rotation': fullStepsPerRotation,
    'gear_ratio': gearRatio,
    'enable_pin': enablePin,
  };
}

class Tmc2209StepperZ214 {
  Tmc2209StepperZ214({
    required this.uartPin,
    required this.uartAddress,
    required this.runCurrent,
    required this.holdCurrent,
    required this.senseResistor,
    required this.interpolate,
    required this.stealthchopThreshold,
    required this.driverMultistepFilt,
    required this.driverToff,
    required this.driverHstrt,
    required this.driverHend,
    required this.driverTbl,
    required this.driverIholddelay,
    required this.driverPwmOfs,
    required this.driverPwmGrad,
    required this.driverPwmFreq,
    required this.driverPwmAutoscale,
    required this.driverPwmAutograd,
    required this.driverPwmReg,
    required this.driverPwmLim,
    required this.driverTpowerdown,
    required this.driverSgthrs,
  });

  factory Tmc2209StepperZ214.fromJson(Map<String, dynamic> json) =>
      Tmc2209StepperZ214(
        uartPin:
        json.containsKey('uart_pin') ? asT<String>(json['uart_pin'])! : '',
        uartAddress: json.containsKey('uart_address')
            ? asT<int>(json['uart_address'])!
            : 0,
        runCurrent: json.containsKey('run_current')
            ? asT<double>(json['run_current'])!
            : 0,
        holdCurrent: json.containsKey('hold_current')
            ? asT<double>(json['hold_current'])!
            : 0,
        senseResistor: json.containsKey('sense_resistor')
            ? asT<double>(json['sense_resistor'])!
            : 0,
        interpolate: json.containsKey('interpolate')
            ? asT<bool>(json['interpolate'])!
            : false,
        stealthchopThreshold: json.containsKey('stealthchop_threshold')
            ? asT<double>(json['stealthchop_threshold'])!
            : 0,
        driverMultistepFilt: json.containsKey('driver_multistep_filt')
            ? asT<bool>(json['driver_multistep_filt'])!
            : false,
        driverToff: json.containsKey('driver_toff')
            ? asT<int>(json['driver_toff'])!
            : 0,
        driverHstrt: json.containsKey('driver_hstrt')
            ? asT<int>(json['driver_hstrt'])!
            : 0,
        driverHend: json.containsKey('driver_hend')
            ? asT<int>(json['driver_hend'])!
            : 0,
        driverTbl:
        json.containsKey('driver_tbl') ? asT<int>(json['driver_tbl'])! : 0,
        driverIholddelay: json.containsKey('driver_iholddelay')
            ? asT<int>(json['driver_iholddelay'])!
            : 0,
        driverPwmOfs: json.containsKey('driver_pwm_ofs')
            ? asT<int>(json['driver_pwm_ofs'])!
            : 0,
        driverPwmGrad: json.containsKey('driver_pwm_grad')
            ? asT<int>(json['driver_pwm_grad'])!
            : 0,
        driverPwmFreq: json.containsKey('driver_pwm_freq')
            ? asT<int>(json['driver_pwm_freq'])!
            : 0,
        driverPwmAutoscale: json.containsKey('driver_pwm_autoscale')
            ? asT<bool>(json['driver_pwm_autoscale'])!
            : false,
        driverPwmAutograd: json.containsKey('driver_pwm_autograd')
            ? asT<bool>(json['driver_pwm_autograd'])!
            : false,
        driverPwmReg: json.containsKey('driver_pwm_reg')
            ? asT<int>(json['driver_pwm_reg'])!
            : 0,
        driverPwmLim: json.containsKey('driver_pwm_lim')
            ? asT<int>(json['driver_pwm_lim'])!
            : 0,
        driverTpowerdown: json.containsKey('driver_tpowerdown')
            ? asT<int>(json['driver_tpowerdown'])!
            : 0,
        driverSgthrs: json.containsKey('driver_sgthrs')
            ? asT<int>(json['driver_sgthrs'])!
            : 0,
      );

  String uartPin;
  int uartAddress;
  double runCurrent;
  double holdCurrent;
  double senseResistor;
  bool interpolate;
  double stealthchopThreshold;
  bool driverMultistepFilt;
  int driverToff;
  int driverHstrt;
  int driverHend;
  int driverTbl;
  int driverIholddelay;
  int driverPwmOfs;
  int driverPwmGrad;
  int driverPwmFreq;
  bool driverPwmAutoscale;
  bool driverPwmAutograd;
  int driverPwmReg;
  int driverPwmLim;
  int driverTpowerdown;
  int driverSgthrs;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'uart_pin': uartPin,
    'uart_address': uartAddress,
    'run_current': runCurrent,
    'hold_current': holdCurrent,
    'sense_resistor': senseResistor,
    'interpolate': interpolate,
    'stealthchop_threshold': stealthchopThreshold,
    'driver_multistep_filt': driverMultistepFilt,
    'driver_toff': driverToff,
    'driver_hstrt': driverHstrt,
    'driver_hend': driverHend,
    'driver_tbl': driverTbl,
    'driver_iholddelay': driverIholddelay,
    'driver_pwm_ofs': driverPwmOfs,
    'driver_pwm_grad': driverPwmGrad,
    'driver_pwm_freq': driverPwmFreq,
    'driver_pwm_autoscale': driverPwmAutoscale,
    'driver_pwm_autograd': driverPwmAutograd,
    'driver_pwm_reg': driverPwmReg,
    'driver_pwm_lim': driverPwmLim,
    'driver_tpowerdown': driverTpowerdown,
    'driver_sgthrs': driverSgthrs,
  };
}

class StepperZ207 {
  StepperZ207({
    required this.microsteps,
    required this.stepPin,
    required this.dirPin,
    required this.rotationDistance,
    required this.fullStepsPerRotation,
    required this.gearRatio,
    required this.enablePin,
  });

  factory StepperZ207.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>>? gearRatio =
    json['gear_ratio'] is List ? <Map<String, dynamic>>[] : null;
    if (gearRatio != null) {
      for (final dynamic item in json['gear_ratio']!) {
        if (item != null) {
          tryCatch(() {
            gearRatio?.add(asT<Map<String, dynamic>>(item)!);
          });
        }
      }
    }

    if (gearRatio == null) {
      gearRatio = <Map<String, dynamic>>[];
    }
    return StepperZ207(
      microsteps:
      json.containsKey('microsteps') ? asT<int>(json['microsteps'])! : 0,
      stepPin:
      json.containsKey('step_pin') ? asT<String>(json['step_pin'])! : '',
      dirPin: json.containsKey('dir_pin') ? asT<String>(json['dir_pin'])! : '',
      rotationDistance: json.containsKey('rotation_distance')
          ? asT<double>(json['rotation_distance'])!
          : 0,
      fullStepsPerRotation: json.containsKey('full_steps_per_rotation')
          ? asT<int>(json['full_steps_per_rotation'])!
          : 0,
      gearRatio: gearRatio,
      enablePin: json.containsKey('enable_pin')
          ? asT<String>(json['enable_pin'])!
          : '',
    );
  }

  int microsteps;
  String stepPin;
  String dirPin;
  double rotationDistance;
  int fullStepsPerRotation;
  List<Map<String, dynamic>>? gearRatio;
  String enablePin;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'microsteps': microsteps,
    'step_pin': stepPin,
    'dir_pin': dirPin,
    'rotation_distance': rotationDistance,
    'full_steps_per_rotation': fullStepsPerRotation,
    'gear_ratio': gearRatio,
    'enable_pin': enablePin,
  };
}

class BoardPins79 {
  BoardPins79({
    required this.mcu,
    required this.aliases,
  });

  factory BoardPins79.fromJson(Map<String, dynamic> json) {
    List<String>? mcu = json['mcu'] is List ? <String>[] : null;
    if (mcu != null) {
      for (final dynamic item in json['mcu']!) {
        if (item != null) {
          tryCatch(() {
            mcu?.add(asT<String>(item)!);
          });
        }
      }
    }

    if (mcu == null) {
      mcu = <String>[];
    }

    List<List<String>>? aliases =
    json['aliases'] is List ? <List<String>>[] : null;
    if (aliases != null) {
      for (final dynamic item0 in asT<List<dynamic>>(json['aliases'])!) {
        if (item0 != null) {
          final List<String> items1 = <String>[];
          for (final dynamic item1 in asT<List<dynamic>>(item0)!) {
            if (item1 != null) {
              tryCatch(() {
                items1?.add(asT<String>(item1)!);
              });
            }
          }
          aliases.add(items1);
        }
      }
    }

    if (aliases == null) {
      aliases = <List<String>>[];
    }
    return BoardPins79(
      mcu: mcu,
      aliases: aliases,
    );
  }

  List<String>? mcu;
  List<List<String>>? aliases;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'mcu': mcu,
    'aliases': aliases,
  };
}

class Display13 {
  Display13({
    required this.lcdType,
    required this.csPin,
    required this.spiSpeed,
    required this.spiSoftwareSclkPin,
    required this.spiSoftwareMisoPin,
    required this.spiSoftwareMosiPin,
    required this.a0Pin,
    required this.contrast,
    required this.rstPin,
    required this.menuRoot,
    required this.menuTimeout,
    required this.menuReverseNavigation,
    required this.encoderPins,
    required this.encoderStepsPerDetent,
    required this.encoderFastRate,
    required this.clickPin,
    required this.displayGroup,
  });

  factory Display13.fromJson(Map<String, dynamic> json) => Display13(
    lcdType:
    json.containsKey('lcd_type') ? asT<String>(json['lcd_type'])! : '',
    csPin: json.containsKey('cs_pin') ? asT<String>(json['cs_pin'])! : '',
    spiSpeed:
    json.containsKey('spi_speed') ? asT<int>(json['spi_speed'])! : 0,
    spiSoftwareSclkPin: json.containsKey('spi_software_sclk_pin')
        ? asT<String>(json['spi_software_sclk_pin'])!
        : '',
    spiSoftwareMisoPin: json.containsKey('spi_software_miso_pin')
        ? asT<String>(json['spi_software_miso_pin'])!
        : '',
    spiSoftwareMosiPin: json.containsKey('spi_software_mosi_pin')
        ? asT<String>(json['spi_software_mosi_pin'])!
        : '',
    a0Pin: json.containsKey('a0_pin') ? asT<String>(json['a0_pin'])! : '',
    contrast:
    json.containsKey('contrast') ? asT<int>(json['contrast'])! : 0,
    rstPin:
    json.containsKey('rst_pin') ? asT<String>(json['rst_pin'])! : '',
    menuRoot: json.containsKey('menu_root')
        ? asT<String>(json['menu_root'])!
        : '',
    menuTimeout: json.containsKey('menu_timeout')
        ? asT<int>(json['menu_timeout'])!
        : 0,
    menuReverseNavigation: json.containsKey('menu_reverse_navigation')
        ? asT<bool>(json['menu_reverse_navigation'])!
        : false,
    encoderPins: json.containsKey('encoder_pins')
        ? asT<String>(json['encoder_pins'])!
        : '',
    encoderStepsPerDetent: json.containsKey('encoder_steps_per_detent')
        ? asT<int>(json['encoder_steps_per_detent'])!
        : 0,
    encoderFastRate: json.containsKey('encoder_fast_rate')
        ? asT<double>(json['encoder_fast_rate'])!
        : 0,
    clickPin: json.containsKey('click_pin')
        ? asT<String>(json['click_pin'])!
        : '',
    displayGroup: json.containsKey('display_group')
        ? asT<String>(json['display_group'])!
        : '',
  );

  String lcdType;
  String csPin;
  int spiSpeed;
  String spiSoftwareSclkPin;
  String spiSoftwareMisoPin;
  String spiSoftwareMosiPin;
  String a0Pin;
  int contrast;
  String rstPin;
  String menuRoot;
  int menuTimeout;
  bool menuReverseNavigation;
  String encoderPins;
  int encoderStepsPerDetent;
  double encoderFastRate;
  String clickPin;
  String displayGroup;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'lcd_type': lcdType,
    'cs_pin': csPin,
    'spi_speed': spiSpeed,
    'spi_software_sclk_pin': spiSoftwareSclkPin,
    'spi_software_miso_pin': spiSoftwareMisoPin,
    'spi_software_mosi_pin': spiSoftwareMosiPin,
    'a0_pin': a0Pin,
    'contrast': contrast,
    'rst_pin': rstPin,
    'menu_root': menuRoot,
    'menu_timeout': menuTimeout,
    'menu_reverse_navigation': menuReverseNavigation,
    'encoder_pins': encoderPins,
    'encoder_steps_per_detent': encoderStepsPerDetent,
    'encoder_fast_rate': encoderFastRate,
    'click_pin': clickPin,
    'display_group': displayGroup,
  };
}

class OutputPinBeeper80 {
  OutputPinBeeper80({
    required this.pwm,
    required this.pin,
    required this.maximumMcuDuration,
    required this.value,
    required this.shutdownValue,
  });

  factory OutputPinBeeper80.fromJson(Map<String, dynamic> json) =>
      OutputPinBeeper80(
        pwm: json.containsKey('pwm') ? asT<bool>(json['pwm'])! : false,
        pin: json.containsKey('pin') ? asT<String>(json['pin'])! : '',
        maximumMcuDuration: json.containsKey('maximum_mcu_duration')
            ? asT<double>(json['maximum_mcu_duration'])!
            : 0,
        value: json.containsKey('value') ? asT<double>(json['value'])! : 0,
        shutdownValue: json.containsKey('shutdown_value')
            ? asT<double>(json['shutdown_value'])!
            : 0,
      );

  bool pwm;
  String pin;
  double maximumMcuDuration;
  double value;
  double shutdownValue;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'pwm': pwm,
    'pin': pin,
    'maximum_mcu_duration': maximumMcuDuration,
    'value': value,
    'shutdown_value': shutdownValue,
  };
}

class NeopixelFysetcMini1286469 {
  NeopixelFysetcMini1286469({
    required this.pin,
    required this.chainCount,
    required this.colorOrder,
    required this.initialRed,
    required this.initialGreen,
    required this.initialBlue,
    required this.initialWhite,
  });

  factory NeopixelFysetcMini1286469.fromJson(Map<String, dynamic> json) {
    List<String>? colorOrder = json['color_order'] is List ? <String>[] : null;
    if (colorOrder != null) {
      for (final dynamic item in json['color_order']!) {
        if (item != null) {
          tryCatch(() {
            colorOrder?.add(asT<String>(item)!);
          });
        }
      }
    }

    if (colorOrder == null) {
      colorOrder = <String>[];
    }
    return NeopixelFysetcMini1286469(
      pin: json.containsKey('pin') ? asT<String>(json['pin'])! : '',
      chainCount:
      json.containsKey('chain_count') ? asT<int>(json['chain_count'])! : 0,
      colorOrder: colorOrder,
      initialRed: json.containsKey('initial_red')
          ? asT<double>(json['initial_red'])!
          : 0,
      initialGreen: json.containsKey('initial_green')
          ? asT<double>(json['initial_green'])!
          : 0,
      initialBlue: json.containsKey('initial_blue')
          ? asT<double>(json['initial_blue'])!
          : 0,
      initialWhite: json.containsKey('initial_white')
          ? asT<double>(json['initial_white'])!
          : 0,
    );
  }

  String pin;
  int chainCount;
  List<String>? colorOrder;
  double initialRed;
  double initialGreen;
  double initialBlue;
  double initialWhite;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'pin': pin,
    'chain_count': chainCount,
    'color_order': colorOrder,
    'initial_red': initialRed,
    'initial_green': initialGreen,
    'initial_blue': initialBlue,
    'initial_white': initialWhite,
  };
}

class GcodeMacroG3203 {
  GcodeMacroG3203({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroG3203.fromJson(Map<String, dynamic> json) =>
      GcodeMacroG3203(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroPrintStart84 {
  GcodeMacroPrintStart84({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroPrintStart84.fromJson(Map<String, dynamic> json) =>
      GcodeMacroPrintStart84(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class GcodeMacroPrintEnd62 {
  GcodeMacroPrintEnd62({
    required this.gcode,
    required this.description,
  });

  factory GcodeMacroPrintEnd62.fromJson(Map<String, dynamic> json) =>
      GcodeMacroPrintEnd62(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'description': description,
  };
}

class VirtualSdcard38 {
  VirtualSdcard38({
    required this.path,
    required this.onErrorGcode,
  });

  factory VirtualSdcard38.fromJson(Map<String, dynamic> json) =>
      VirtualSdcard38(
        path: json.containsKey('path') ? asT<String>(json['path'])! : '',
        onErrorGcode: json.containsKey('on_error_gcode')
            ? asT<String>(json['on_error_gcode'])!
            : '',
      );

  String path;
  String onErrorGcode;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'path': path,
    'on_error_gcode': onErrorGcode,
  };
}

class PauseResume30 {
  PauseResume30({
    required this.recoverVelocity,
  });

  factory PauseResume30.fromJson(Map<String, dynamic> json) => PauseResume30(
    recoverVelocity: json.containsKey('recover_velocity')
        ? asT<double>(json['recover_velocity'])!
        : 0,
  );

  double recoverVelocity;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'recover_velocity': recoverVelocity,
  };
}

class GcodeMacroCancelPrint48 {
  GcodeMacroCancelPrint48({
    required this.gcode,
    required this.renameExisting,
    required this.description,
  });

  factory GcodeMacroCancelPrint48.fromJson(Map<String, dynamic> json) =>
      GcodeMacroCancelPrint48(
        gcode: json.containsKey('gcode') ? asT<String>(json['gcode'])! : '',
        renameExisting: json.containsKey('rename_existing')
            ? asT<String>(json['rename_existing'])!
            : '',
        description: json.containsKey('description')
            ? asT<String>(json['description'])!
            : '',
      );

  String gcode;
  String renameExisting;
  String description;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gcode': gcode,
    'rename_existing': renameExisting,
    'description': description,
  };
}

class Printer04 {
  Printer04({
    required this.maxVelocity,
    required this.maxAccel,
    required this.maxAccelToDecel,
    required this.squareCornerVelocity,
    required this.bufferTimeLow,
    required this.bufferTimeHigh,
    required this.bufferTimeStart,
    required this.moveFlushTime,
    required this.kinematics,
    required this.maxZVelocity,
    required this.maxZAccel,
  });

  factory Printer04.fromJson(Map<String, dynamic> json) => Printer04(
    maxVelocity: json.containsKey('max_velocity')
        ? asT<double>(json['max_velocity'])!
        : 0,
    maxAccel:
    json.containsKey('max_accel') ? asT<double>(json['max_accel'])! : 0,
    maxAccelToDecel: json.containsKey('max_accel_to_decel')
        ? asT<double>(json['max_accel_to_decel'])!
        : 0,
    squareCornerVelocity: json.containsKey('square_corner_velocity')
        ? asT<double>(json['square_corner_velocity'])!
        : 0,
    bufferTimeLow: json.containsKey('buffer_time_low')
        ? asT<double>(json['buffer_time_low'])!
        : 0,
    bufferTimeHigh: json.containsKey('buffer_time_high')
        ? asT<double>(json['buffer_time_high'])!
        : 0,
    bufferTimeStart: json.containsKey('buffer_time_start')
        ? asT<double>(json['buffer_time_start'])!
        : 0,
    moveFlushTime: json.containsKey('move_flush_time')
        ? asT<double>(json['move_flush_time'])!
        : 0,
    kinematics: json.containsKey('kinematics')
        ? asT<String>(json['kinematics'])!
        : '',
    maxZVelocity: json.containsKey('max_z_velocity')
        ? asT<double>(json['max_z_velocity'])!
        : 0,
    maxZAccel: json.containsKey('max_z_accel')
        ? asT<double>(json['max_z_accel'])!
        : 0,
  );

  double maxVelocity;
  double maxAccel;
  double maxAccelToDecel;
  double squareCornerVelocity;
  double bufferTimeLow;
  double bufferTimeHigh;
  double bufferTimeStart;
  double moveFlushTime;
  String kinematics;
  double maxZVelocity;
  double maxZAccel;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'max_velocity': maxVelocity,
    'max_accel': maxAccel,
    'max_accel_to_decel': maxAccelToDecel,
    'square_corner_velocity': squareCornerVelocity,
    'buffer_time_low': bufferTimeLow,
    'buffer_time_high': bufferTimeHigh,
    'buffer_time_start': bufferTimeStart,
    'move_flush_time': moveFlushTime,
    'kinematics': kinematics,
    'max_z_velocity': maxZVelocity,
    'max_z_accel': maxZAccel,
  };
}

class VerifyHeaterExtruder98 {
  VerifyHeaterExtruder98({
    required this.hysteresis,
    required this.maxError,
    required this.heatingGain,
    required this.checkGainTime,
  });

  factory VerifyHeaterExtruder98.fromJson(Map<String, dynamic> json) =>
      VerifyHeaterExtruder98(
        hysteresis: json.containsKey('hysteresis')
            ? asT<double>(json['hysteresis'])!
            : 0,
        maxError:
        json.containsKey('max_error') ? asT<double>(json['max_error'])! : 0,
        heatingGain: json.containsKey('heating_gain')
            ? asT<double>(json['heating_gain'])!
            : 0,
        checkGainTime: json.containsKey('check_gain_time')
            ? asT<double>(json['check_gain_time'])!
            : 0,
      );

  double hysteresis;
  double maxError;
  double heatingGain;
  double checkGainTime;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'hysteresis': hysteresis,
    'max_error': maxError,
    'heating_gain': heatingGain,
    'check_gain_time': checkGainTime,
  };
}

class Extruder04 {
  Extruder04({
    required this.temperature,
    required this.target,
    required this.power,
    required this.pressureAdvance,
    required this.smoothTime,
  });

  factory Extruder04.fromJson(Map<String, dynamic> json) => Extruder04(
    temperature: json.containsKey('temperature')
        ? asT<double>(json['temperature'])!
        : 0,
    target: json.containsKey('target') ? asT<double>(json['target'])! : 0,
    power: json.containsKey('power') ? asT<double>(json['power'])! : 0,
    pressureAdvance: json.containsKey('pressure_advance')
        ? asT<double>(json['pressure_advance'])!
        : 0,
    smoothTime: json.containsKey('smooth_time')
        ? asT<double>(json['smooth_time'])!
        : 0,
  );

  double temperature;
  double target;
  double power;
  double pressureAdvance;
  double smoothTime;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'temperature': temperature,
    'target': target,
    'power': power,
    'pressure_advance': pressureAdvance,
    'smooth_time': smoothTime,
  };
}

class HeaterBed28 {
  HeaterBed28({
    required this.temperature,
    required this.target,
    required this.power,
  });

  factory HeaterBed28.fromJson(Map<String, dynamic> json) => HeaterBed28(
    temperature: json.containsKey('temperature')
        ? asT<double>(json['temperature'])!
        : 0,
    target: json.containsKey('target') ? asT<double>(json['target'])! : 0,
    power: json.containsKey('power') ? asT<double>(json['power'])! : 0,
  );

  double temperature;
  double target;
  double power;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'temperature': temperature,
    'target': target,
    'power': power,
  };
}

class Fan91 {
  Fan91({
    required this.speed,
    this.rpm,
  });

  factory Fan91.fromJson(Map<String, dynamic> json) => Fan91(
    speed: json.containsKey('speed') ? asT<double>(json['speed'])! : 0,
    rpm: json.containsKey('rpm') ? asT<String?>(json['rpm']) : null,
  );

  double speed;
  String? rpm;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'speed': speed,
    'rpm': rpm,
  };
}

class IdleTimeout60 {
  IdleTimeout60({
    required this.state,
    required this.printingTime,
  });

  factory IdleTimeout60.fromJson(Map<String, dynamic> json) => IdleTimeout60(
    state: json.containsKey('state') ? asT<String>(json['state'])! : '',
    printingTime: json.containsKey('printing_time')
        ? asT<double>(json['printing_time'])!
        : 0,
  );

  String state;
  double printingTime;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'state': state,
    'printing_time': printingTime,
  };
}

class VirtualSdcard31 {
  VirtualSdcard31({
    required this.progress,
    required this.isActive,
    required this.filePosition,
  });

  factory VirtualSdcard31.fromJson(Map<String, dynamic> json) =>
      VirtualSdcard31(
        progress:
        json.containsKey('progress') ? asT<double>(json['progress'])! : 0,
        isActive: json.containsKey('is_active')
            ? asT<bool>(json['is_active'])!
            : false,
        filePosition: json.containsKey('file_position')
            ? asT<int>(json['file_position'])!
            : 0,
      );

  double progress;
  bool isActive;
  int filePosition;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'progress': progress,
    'is_active': isActive,
    'file_position': filePosition,
  };
}

class PrintStats13 {
  PrintStats13({
    required this.filename,
    required this.totalDuration,
    required this.printDuration,
    required this.filamentUsed,
    required this.state,
    required this.message,
  });

  factory PrintStats13.fromJson(Map<String, dynamic> json) => PrintStats13(
    filename:
    json.containsKey('filename') ? asT<String>(json['filename'])! : '',
    totalDuration: json.containsKey('total_duration')
        ? asT<double>(json['total_duration'])!
        : 0,
    printDuration: json.containsKey('print_duration')
        ? asT<double>(json['print_duration'])!
        : 0,
    filamentUsed: json.containsKey('filament_used')
        ? asT<double>(json['filament_used'])!
        : 0,
    state: json.containsKey('state') ? asT<String>(json['state'])! : '',
    message:
    json.containsKey('message') ? asT<String>(json['message'])! : '',
  );

  String filename;
  double totalDuration;
  double printDuration;
  double filamentUsed;
  String state;
  String message;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'filename': filename,
    'total_duration': totalDuration,
    'print_duration': printDuration,
    'filament_used': filamentUsed,
    'state': state,
    'message': message,
  };
}

class DisplayStatus48 {
  DisplayStatus48({
    required this.progress,
    this.message,
  });

  factory DisplayStatus48.fromJson(Map<String, dynamic> json) =>
      DisplayStatus48(
        progress:
        json.containsKey('progress') ? asT<double>(json['progress'])! : 0,
        message:
        json.containsKey('message') ? asT<String?>(json['message']) : null,
      );

  double progress;
  String? message;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'progress': progress,
    'message': message,
  };
}

class TemperatureSensor822 {
  TemperatureSensor822({
    required this.temperature,
    required this.measuredMinTemp,
    required this.measuredMaxTemp,
  });

  factory TemperatureSensor822.fromJson(Map<String, dynamic> json) =>
      TemperatureSensor822(
        temperature: json.containsKey('temperature')
            ? asT<double>(json['temperature'])!
            : 0,
        measuredMinTemp: json.containsKey('measured_min_temp')
            ? asT<double>(json['measured_min_temp'])!
            : 0,
        measuredMaxTemp: json.containsKey('measured_max_temp')
            ? asT<double>(json['measured_max_temp'])!
            : 0,
      );

  double temperature;
  double measuredMinTemp;
  double measuredMaxTemp;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'temperature': temperature,
    'measured_min_temp': measuredMinTemp,
    'measured_max_temp': measuredMaxTemp,
  };
}

class TemperatureSensorA6145030 {
  TemperatureSensorA6145030({
    required this.temperature,
    required this.measuredMinTemp,
    required this.measuredMaxTemp,
  });

  factory TemperatureSensorA6145030.fromJson(Map<String, dynamic> json) =>
      TemperatureSensorA6145030(
        temperature: json.containsKey('temperature')
            ? asT<double>(json['temperature'])!
            : 0,
        measuredMinTemp: json.containsKey('measured_min_temp')
            ? asT<double>(json['measured_min_temp'])!
            : 0,
        measuredMaxTemp: json.containsKey('measured_max_temp')
            ? asT<double>(json['measured_max_temp'])!
            : 0,
      );

  double temperature;
  double measuredMinTemp;
  double measuredMaxTemp;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'temperature': temperature,
    'measured_min_temp': measuredMinTemp,
    'measured_max_temp': measuredMaxTemp,
  };
}

class BedMesh52 {
  BedMesh52({
    required this.profileName,
    required this.meshMin,
    required this.meshMax,
    required this.probedMatrix,
    required this.meshMatrix,
  });

  factory BedMesh52.fromJson(Map<String, dynamic> json) {
    List<double>? meshMin = json['mesh_min'] is List ? <double>[] : null;
    if (meshMin != null) {
      for (final dynamic item in json['mesh_min']!) {
        if (item != null) {
          tryCatch(() {
            meshMin?.add(asT<double>(item)!);
          });
        }
      }
    }

    if (meshMin == null) {
      meshMin = <double>[];
    }

    List<double>? meshMax = json['mesh_max'] is List ? <double>[] : null;
    if (meshMax != null) {
      for (final dynamic item in json['mesh_max']!) {
        if (item != null) {
          tryCatch(() {
            meshMax?.add(asT<double>(item)!);
          });
        }
      }
    }

    if (meshMax == null) {
      meshMax = <double>[];
    }

    List<List<Map<String, dynamic>>>? probedMatrix =
    json['probed_matrix'] is List ? <List<Map<String, dynamic>>>[] : null;
    if (probedMatrix != null) {
      for (final dynamic item0 in asT<List<dynamic>>(json['probed_matrix'])!) {
        if (item0 != null) {
          final List<Map<String, dynamic>> items1 = <Map<String, dynamic>>[];
          for (final dynamic item1 in asT<List<dynamic>>(item0)!) {
            if (item1 != null) {
              tryCatch(() {
                items1?.add(asT<Map<String, dynamic>>(item1)!);
              });
            }
          }
          probedMatrix.add(items1);
        }
      }
    }

    if (probedMatrix == null) {
      probedMatrix = <List<Map<String, dynamic>>>[];
    }

    List<List<Map<String, dynamic>>>? meshMatrix =
    json['mesh_matrix'] is List ? <List<Map<String, dynamic>>>[] : null;
    if (meshMatrix != null) {
      for (final dynamic item0 in asT<List<dynamic>>(json['mesh_matrix'])!) {
        if (item0 != null) {
          final List<Map<String, dynamic>> items1 = <Map<String, dynamic>>[];
          for (final dynamic item1 in asT<List<dynamic>>(item0)!) {
            if (item1 != null) {
              tryCatch(() {
                items1?.add(asT<Map<String, dynamic>>(item1)!);
              });
            }
          }
          meshMatrix.add(items1);
        }
      }
    }

    if (meshMatrix == null) {
      meshMatrix = <List<Map<String, dynamic>>>[];
    }
    return BedMesh52(
      profileName: json.containsKey('profile_name')
          ? asT<String>(json['profile_name'])!
          : '',
      meshMin: meshMin,
      meshMax: meshMax,
      probedMatrix: probedMatrix,
      meshMatrix: meshMatrix,
    );
  }

  String profileName;
  List<double>? meshMin;
  List<double>? meshMax;
  List<List<Map<String, dynamic>>>? probedMatrix;
  List<List<Map<String, dynamic>>>? meshMatrix;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'profile_name': profileName,
    'mesh_min': meshMin,
    'mesh_max': meshMax,
    'probed_matrix': probedMatrix,
    'mesh_matrix': meshMatrix,
  };
}
