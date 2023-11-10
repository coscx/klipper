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

class ServerInfo {
  ServerInfo({
    required this.klippyConnected,
    required this.klippyState,
    required this.components,
    required this.failedComponents,
    required this.registeredDirectories,
    required this.warnings,
    required this.websocketCount,
    required this.moonrakerVersion,
    required this.missingKlippyRequirements,
    required this.apiVersion,
    required this.apiVersionString,
  });

  factory ServerInfo.fromJson(Map<String, dynamic> json) {
    List<String>? components = json['components'] is List ? <String>[] : null;
    if (components != null) {
      for (final dynamic item in json['components']!) {
        if (item != null) {
          tryCatch(() {
            components?.add(asT<String>(item)!);
          });
        }
      }
    }

    if (components == null) {
      components = <String>[];
    }

    List<Map<String, dynamic>>? failedComponents =
    json['failed_components'] is List ? <Map<String, dynamic>>[] : null;
    if (failedComponents != null) {
      for (final dynamic item in json['failed_components']!) {
        if (item != null) {
          tryCatch(() {
            failedComponents?.add(asT<Map<String, dynamic>>(item)!);
          });
        }
      }
    }

    if (failedComponents == null) {
      failedComponents = <Map<String, dynamic>>[];
    }

    List<String>? registeredDirectories =
    json['registered_directories'] is List ? <String>[] : null;
    if (registeredDirectories != null) {
      for (final dynamic item in json['registered_directories']!) {
        if (item != null) {
          tryCatch(() {
            registeredDirectories?.add(asT<String>(item)!);
          });
        }
      }
    }

    if (registeredDirectories == null) {
      registeredDirectories = <String>[];
    }

    List<Map<String, dynamic>>? warnings =
    json['warnings'] is List ? <Map<String, dynamic>>[] : null;
    if (warnings != null) {
      for (final dynamic item in json['warnings']!) {
        if (item != null) {
          tryCatch(() {
            warnings?.add(asT<Map<String, dynamic>>(item)!);
          });
        }
      }
    }

    if (warnings == null) {
      warnings = <Map<String, dynamic>>[];
    }

    List<Map<String, dynamic>>? missingKlippyRequirements =
    json['missing_klippy_requirements'] is List
        ? <Map<String, dynamic>>[]
        : null;
    if (missingKlippyRequirements != null) {
      for (final dynamic item in json['missing_klippy_requirements']!) {
        if (item != null) {
          tryCatch(() {
            missingKlippyRequirements?.add(asT<Map<String, dynamic>>(item)!);
          });
        }
      }
    }

    if (missingKlippyRequirements == null) {
      missingKlippyRequirements = <Map<String, dynamic>>[];
    }

    List<int>? apiVersion = json['api_version'] is List ? <int>[] : null;
    if (apiVersion != null) {
      for (final dynamic item in json['api_version']!) {
        if (item != null) {
          tryCatch(() {
            apiVersion?.add(asT<int>(item)!);
          });
        }
      }
    }

    if (apiVersion == null) {
      apiVersion = <int>[];
    }
    return ServerInfo(
      klippyConnected: json.containsKey('klippy_connected')
          ? asT<bool>(json['klippy_connected'])!
          : false,
      klippyState: json.containsKey('klippy_state')
          ? asT<String>(json['klippy_state'])!
          : '',
      components: components,
      failedComponents: failedComponents,
      registeredDirectories: registeredDirectories,
      warnings: warnings,
      websocketCount: json.containsKey('websocket_count')
          ? asT<int>(json['websocket_count'])!
          : 0,
      moonrakerVersion: json.containsKey('moonraker_version')
          ? asT<String>(json['moonraker_version'])!
          : '',
      missingKlippyRequirements: missingKlippyRequirements,
      apiVersion: apiVersion,
      apiVersionString: json.containsKey('api_version_string')
          ? asT<String>(json['api_version_string'])!
          : '',
    );
  }

  bool klippyConnected;
  String klippyState;
  List<String>? components;
  List<Map<String, dynamic>>? failedComponents;
  List<String>? registeredDirectories;
  List<Map<String, dynamic>>? warnings;
  int websocketCount;
  String moonrakerVersion;
  List<Map<String, dynamic>>? missingKlippyRequirements;
  List<int>? apiVersion;
  String apiVersionString;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'klippy_connected': klippyConnected,
    'klippy_state': klippyState,
    'components': components,
    'failed_components': failedComponents,
    'registered_directories': registeredDirectories,
    'warnings': warnings,
    'websocket_count': websocketCount,
    'moonraker_version': moonrakerVersion,
    'missing_klippy_requirements': missingKlippyRequirements,
    'api_version': apiVersion,
    'api_version_string': apiVersionString,
  };
}
