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

class CachedTemperatureData {
  CachedTemperatureData({
    required this.heaterBed,
    required this.temperatureSensor8,
    required this.temperatureSensorA61450,
    required this.extruder,
  });

  factory CachedTemperatureData.fromJson(Map<String, dynamic> json) =>
      CachedTemperatureData(
        heaterBed: json.containsKey('heater_bed')
            ? json['heater_bed'] == null
            ? null
            : HeaterBed40.fromJson(
            asT<Map<String, dynamic>>(json['heater_bed'])!)
            : null,
        temperatureSensor8: json.containsKey('temperature_sensor 怪兽8温度')
            ? json['temperature_sensor 怪兽8温度'] == null
            ? null
            : TemperatureSensor806.fromJson(asT<Map<String, dynamic>>(
            json['temperature_sensor 怪兽8温度'])!)
            : null,
        temperatureSensorA61450: json
            .containsKey('temperature_sensor A6-1450温度')
            ? json['temperature_sensor A6-1450温度'] == null
            ? null
            : TemperatureSensorA6145001.fromJson(asT<Map<String, dynamic>>(
            json['temperature_sensor A6-1450温度'])!)
            : null,
        extruder: json.containsKey('extruder')
            ? json['extruder'] == null
            ? null
            : Extruder31.fromJson(
            asT<Map<String, dynamic>>(json['extruder'])!)
            : null,
      );

  HeaterBed40? heaterBed;
  TemperatureSensor806? temperatureSensor8;
  TemperatureSensorA6145001? temperatureSensorA61450;
  Extruder31? extruder;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'heater_bed': heaterBed,
    'temperature_sensor 怪兽8温度': temperatureSensor8,
    'temperature_sensor A6-1450温度': temperatureSensorA61450,
    'extruder': extruder,
  };
}

class HeaterBed40 {
  HeaterBed40({
    required this.temperatures,
    required this.targets,
    required this.powers,
  });

  factory HeaterBed40.fromJson(Map<String, dynamic> json) {
    List<double>? temperatures =
    json['temperatures'] is List ? <double>[] : null;
    if (temperatures != null) {
      for (final dynamic item in json['temperatures']!) {
        if (item != null) {
          tryCatch(() {
            temperatures?.add(asT<double>(item)!);
          });
        }
      }
    }

    if (temperatures == null) {
      temperatures = <double>[];
    }

    List<double>? targets = json['targets'] is List ? <double>[] : null;
    if (targets != null) {
      for (final dynamic item in json['targets']!) {
        if (item != null) {
          tryCatch(() {
            targets?.add(asT<double>(item)!);
          });
        }
      }
    }

    if (targets == null) {
      targets = <double>[];
    }

    List<double>? powers = json['powers'] is List ? <double>[] : null;
    if (powers != null) {
      for (final dynamic item in json['powers']!) {
        if (item != null) {
          tryCatch(() {
            powers?.add(asT<double>(item)!);
          });
        }
      }
    }

    if (powers == null) {
      powers = <double>[];
    }
    return HeaterBed40(
      temperatures: temperatures,
      targets: targets,
      powers: powers,
    );
  }

  List<double>? temperatures;
  List<double>? targets;
  List<double>? powers;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'temperatures': temperatures,
    'targets': targets,
    'powers': powers,
  };
}

class TemperatureSensor806 {
  TemperatureSensor806({
    required this.temperatures,
  });

  factory TemperatureSensor806.fromJson(Map<String, dynamic> json) {
    List<double>? temperatures =
    json['temperatures'] is List ? <double>[] : null;
    if (temperatures != null) {
      for (final dynamic item in json['temperatures']!) {
        if (item != null) {
          tryCatch(() {
            temperatures?.add(asT<double>(item)!);
          });
        }
      }
    }

    if (temperatures == null) {
      temperatures = <double>[];
    }
    return TemperatureSensor806(
      temperatures: temperatures,
    );
  }

  List<double>? temperatures;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'temperatures': temperatures,
  };
}

class TemperatureSensorA6145001 {
  TemperatureSensorA6145001({
    required this.temperatures,
  });

  factory TemperatureSensorA6145001.fromJson(Map<String, dynamic> json) {
    List<double>? temperatures =
    json['temperatures'] is List ? <double>[] : null;
    if (temperatures != null) {
      for (final dynamic item in json['temperatures']!) {
        if (item != null) {
          tryCatch(() {
            temperatures?.add(asT<double>(item)!);
          });
        }
      }
    }

    if (temperatures == null) {
      temperatures = <double>[];
    }
    return TemperatureSensorA6145001(
      temperatures: temperatures,
    );
  }

  List<double>? temperatures;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'temperatures': temperatures,
  };
}

class Extruder31 {
  Extruder31({
    required this.temperatures,
    required this.targets,
    required this.powers,
  });

  factory Extruder31.fromJson(Map<String, dynamic> json) {
    List<double>? temperatures =
    json['temperatures'] is List ? <double>[] : null;
    if (temperatures != null) {
      for (final dynamic item in json['temperatures']!) {
        if (item != null) {
          tryCatch(() {
            temperatures?.add(asT<double>(item)!);
          });
        }
      }
    }

    if (temperatures == null) {
      temperatures = <double>[];
    }

    List<double>? targets = json['targets'] is List ? <double>[] : null;
    if (targets != null) {
      for (final dynamic item in json['targets']!) {
        if (item != null) {
          tryCatch(() {
            targets?.add(asT<double>(item)!);
          });
        }
      }
    }

    if (targets == null) {
      targets = <double>[];
    }

    List<double>? powers = json['powers'] is List ? <double>[] : null;
    if (powers != null) {
      for (final dynamic item in json['powers']!) {
        if (item != null) {
          tryCatch(() {
            powers?.add(asT<double>(item)!);
          });
        }
      }
    }

    if (powers == null) {
      powers = <double>[];
    }
    return Extruder31(
      temperatures: temperatures,
      targets: targets,
      powers: powers,
    );
  }

  List<double>? temperatures;
  List<double>? targets;
  List<double>? powers;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'temperatures': temperatures,
    'targets': targets,
    'powers': powers,
  };
}
