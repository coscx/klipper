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

class HostInfo {
  HostInfo({
    required this.state,
    required this.stateMessage,
    required this.hostname,
    required this.klipperPath,
    required this.pythonPath,
    required this.processId,
    required this.userId,
    required this.groupId,
    required this.logFile,
    required this.configFile,
    required this.softwareVersion,
    required this.cpuInfo,
  });

  factory HostInfo.fromJson(Map<String, dynamic> json) => HostInfo(
    state: json.containsKey('state') ? asT<String>(json['state'])! : '',
    stateMessage: json.containsKey('state_message')
        ? asT<String>(json['state_message'])!
        : '',
    hostname:
    json.containsKey('hostname') ? asT<String>(json['hostname'])! : '',
    klipperPath: json.containsKey('klipper_path')
        ? asT<String>(json['klipper_path'])!
        : '',
    pythonPath: json.containsKey('python_path')
        ? asT<String>(json['python_path'])!
        : '',
    processId:
    json.containsKey('process_id') ? asT<int>(json['process_id'])! : 0,
    userId: json.containsKey('user_id') ? asT<int>(json['user_id'])! : 0,
    groupId: json.containsKey('group_id') ? asT<int>(json['group_id'])! : 0,
    logFile:
    json.containsKey('log_file') ? asT<String>(json['log_file'])! : '',
    configFile: json.containsKey('config_file')
        ? asT<String>(json['config_file'])!
        : '',
    softwareVersion: json.containsKey('software_version')
        ? asT<String>(json['software_version'])!
        : '',
    cpuInfo:
    json.containsKey('cpu_info') ? asT<String>(json['cpu_info'])! : '',
  );

  String state;
  String stateMessage;
  String hostname;
  String klipperPath;
  String pythonPath;
  int processId;
  int userId;
  int groupId;
  String logFile;
  String configFile;
  String softwareVersion;
  String cpuInfo;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'state': state,
    'state_message': stateMessage,
    'hostname': hostname,
    'klipper_path': klipperPath,
    'python_path': pythonPath,
    'process_id': processId,
    'user_id': userId,
    'group_id': groupId,
    'log_file': logFile,
    'config_file': configFile,
    'software_version': softwareVersion,
    'cpu_info': cpuInfo,
  };
}
