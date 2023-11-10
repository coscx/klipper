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

class NotifyStatusUpdate {
  NotifyStatusUpdate({
    required this.toolhead,
    required this.extruder,
    required this.heater_bed,
    required this.temperature_sensor8,
    required this.webhooks,
  });

  factory NotifyStatusUpdate.fromJson(Map<String, dynamic> json) =>
      NotifyStatusUpdate(
        toolhead: json.containsKey('toolhead')
            ? json['toolhead'] == null
            ? null
            : Toolhead.fromJson(
            asT<Map<String, dynamic>>(json['toolhead'])!)
            : null,
        extruder: json.containsKey('extruder')
            ? json['extruder'] == null
            ? null
            : Extruder.fromJson(
            asT<Map<String, dynamic>>(json['extruder'])!)
            : null,
        heater_bed: json.containsKey('heater_bed')
            ? json['heater_bed'] == null
            ? null
            : HeaterBed.fromJson(
            asT<Map<String, dynamic>>(json['heater_bed'])!)
            : null,
        temperature_sensor8: json.containsKey('temperature_sensor8')
            ? json['temperature_sensor 怪兽8温度'] == null
            ? null
            : TemperatureSensor8.fromJson(asT<Map<String, dynamic>>(
            json['temperature_sensor 怪兽8温度'])!)
            : null,
        webhooks: json.containsKey('webhooks')
            ? json['webhooks'] == null
            ? null
            : Webhooks.fromJson(asT<Map<String, dynamic>>(
            json['webhooks'])!)
            : null,
      );

  Toolhead? toolhead;
  Extruder? extruder;
  HeaterBed? heater_bed;
  TemperatureSensor8? temperature_sensor8;
  Webhooks? webhooks;
  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'toolhead': toolhead,
    'extruder': extruder,
    'heater_bed': heater_bed,
    'temperature_sensor 怪兽8温度': temperature_sensor8,
  };
}
class Webhooks {
  Webhooks({
    required this.state,
    required this.state_message,
  });

  factory Webhooks.fromJson(Map<String, dynamic> json) => Webhooks(
    state: json.containsKey('state')
        ? asT<String>(json['state'])!
        : '',
    state_message: json.containsKey('state_message')
        ? asT<String>(json['state_message'])!
        : '',
  );

  String state;
  String state_message;
  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'state': state,
    'state_message': state_message,
  };
}
class Toolhead {
  Toolhead({
    required this.estimated_print_time,
  });

  factory Toolhead.fromJson(Map<String, dynamic> json) => Toolhead(
    estimated_print_time: json.containsKey('estimated_print_time')
        ? asT<double>(json['estimated_print_time'])!
        : 0,
  );

  double estimated_print_time;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'estimated_print_time': estimated_print_time,
  };
}

class Extruder {
  Extruder({
    required this.temperature,
    required this.target,
    required this.power,
  });

  factory Extruder.fromJson(Map<String, dynamic> json) => Extruder(
    temperature: json.containsKey('temperature')
        ? asT<double>(json['temperature'])!
        : 0,
    target: json.containsKey('target')
        ? asT<double>(json['target'])!
        : -1,
    power: json.containsKey('power')
        ? asT<double>(json['power'])!
        : -1,
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

class HeaterBed {
  HeaterBed({
    required this.temperature,
    required this.target,
    required this.power,
  });

  factory HeaterBed.fromJson(Map<String, dynamic> json) => HeaterBed(
    temperature: json.containsKey('temperature')
        ? asT<double>(json['temperature'])!
        : 0,
    target: json.containsKey('target')
        ? asT<double>(json['target'])!
        : -1,
    power: json.containsKey('power')
        ? asT<double>(json['power'])!
        : -1,
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

class TemperatureSensor8 {
  TemperatureSensor8({
    required this.temperature,
  });

  factory TemperatureSensor8.fromJson(Map<String, dynamic> json) =>
      TemperatureSensor8(
        temperature: json.containsKey('temperature')
            ? asT<double>(json['temperature'])!
            : 0,
      );

  double temperature;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'temperature': temperature,
  };
}
