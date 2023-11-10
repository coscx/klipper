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

class NotifyProcStatUpdate {
  NotifyProcStatUpdate({
    required this.moonraker_stats,
    this.cpu_temp,
    required this.network,
    required this.system_cpu_usage,
    required this.system_memory,
    required this.websocket_connections,
  });

  factory NotifyProcStatUpdate.fromJson(Map<String, dynamic> json) =>
      NotifyProcStatUpdate(
        moonraker_stats: json.containsKey('moonraker_stats')
            ? json['moonraker_stats'] == null
            ? null
            : MoonrakerStats.fromJson(
            asT<Map<String, dynamic>>(json['moonraker_stats'])!)
            : null,
        cpu_temp: json.containsKey('cpu_temp')
            ? asT<String?>(json['cpu_temp'])
            : null,
        network: json.containsKey('network')
            ? json['network'] == null
            ? null
            : Network.fromJson(asT<Map<String, dynamic>>(json['network'])!)
            : null,
        system_cpu_usage: json.containsKey('system_cpu_usage')
            ? json['system_cpu_usage'] == null
            ? null
            : SystemCpuUsage.fromJson(
            asT<Map<String, dynamic>>(json['system_cpu_usage'])!)
            : null,
        system_memory: json.containsKey('system_memory')
            ? json['system_memory'] == null
            ? null
            : SystemMemory.fromJson(
            asT<Map<String, dynamic>>(json['system_memory'])!)
            : null,
        websocket_connections: json.containsKey('websocket_connections')
            ? asT<int>(json['websocket_connections'])!
            : 0,
      );

  MoonrakerStats? moonraker_stats;
  String? cpu_temp;
  Network? network;
  SystemCpuUsage? system_cpu_usage;
  SystemMemory? system_memory;
  int websocket_connections;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'moonraker_stats': moonraker_stats,
    'cpu_temp': cpu_temp,
    'network': network,
    'system_cpu_usage': system_cpu_usage,
    'system_memory': system_memory,
    'websocket_connections': websocket_connections,
  };
}

class MoonrakerStats {
  MoonrakerStats({
    required this.time,
    required this.cpu_usage,
    required this.memory,
    required this.mem_units,
  });

  factory MoonrakerStats.fromJson(Map<String, dynamic> json) => MoonrakerStats(
    time: json.containsKey('time') ? asT<double>(json['time'])! : 0,
    cpu_usage:
    json.containsKey('cpu_usage') ? asT<double>(json['cpu_usage'])! : 0,
    memory: json.containsKey('memory') ? asT<int>(json['memory'])! : 0,
    mem_units: json.containsKey('mem_units')
        ? asT<String>(json['mem_units'])!
        : '',
  );

  double time;
  double cpu_usage;
  int memory;
  String mem_units;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'time': time,
    'cpu_usage': cpu_usage,
    'memory': memory,
    'mem_units': mem_units,
  };
}

class Network {
  Network({
    required this.lo,
    required this.enp1s0,
    required this.wlx001c500e4fcd,
  });

  factory Network.fromJson(Map<String, dynamic> json) => Network(
    lo: json.containsKey('lo')
        ? json['lo'] == null
        ? null
        : Lo.fromJson(asT<Map<String, dynamic>>(json['lo'])!)
        : null,
    enp1s0: json.containsKey('enp1s0')
        ? json['enp1s0'] == null
        ? null
        : Enp1s0.fromJson(asT<Map<String, dynamic>>(json['enp1s0'])!)
        : null,
    wlx001c500e4fcd: json.containsKey('wlx001c500e4fcd')
        ? json['wlx001c500e4fcd'] == null
        ? null
        : Wlx001c500e4fcd.fromJson(
        asT<Map<String, dynamic>>(json['wlx001c500e4fcd'])!)
        : null,
  );

  Lo? lo;
  Enp1s0? enp1s0;
  Wlx001c500e4fcd? wlx001c500e4fcd;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'lo': lo,
    'enp1s0': enp1s0,
    'wlx001c500e4fcd': wlx001c500e4fcd,
  };
}

class Lo {
  Lo({
    required this.rx_bytes,
    required this.tx_bytes,
    required this.rx_packets,
    required this.tx_packets,
    required this.rx_errs,
    required this.tx_errs,
    required this.rx_drop,
    required this.tx_drop,
    required this.bandwidth,
  });

  factory Lo.fromJson(Map<String, dynamic> json) => Lo(
    rx_bytes:
    json.containsKey('rx_bytes') ? asT<int>(json['rx_bytes'])! : 0,
    tx_bytes:
    json.containsKey('tx_bytes') ? asT<int>(json['tx_bytes'])! : 0,
    rx_packets:
    json.containsKey('rx_packets') ? asT<int>(json['rx_packets'])! : 0,
    tx_packets:
    json.containsKey('tx_packets') ? asT<int>(json['tx_packets'])! : 0,
    rx_errs: json.containsKey('rx_errs') ? asT<int>(json['rx_errs'])! : 0,
    tx_errs: json.containsKey('tx_errs') ? asT<int>(json['tx_errs'])! : 0,
    rx_drop: json.containsKey('rx_drop') ? asT<int>(json['rx_drop'])! : 0,
    tx_drop: json.containsKey('tx_drop') ? asT<int>(json['tx_drop'])! : 0,
    bandwidth:
    json.containsKey('bandwidth') ? asT<double>(json['bandwidth'])! : 0,
  );

  int rx_bytes;
  int tx_bytes;
  int rx_packets;
  int tx_packets;
  int rx_errs;
  int tx_errs;
  int rx_drop;
  int tx_drop;
  double bandwidth;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'rx_bytes': rx_bytes,
    'tx_bytes': tx_bytes,
    'rx_packets': rx_packets,
    'tx_packets': tx_packets,
    'rx_errs': rx_errs,
    'tx_errs': tx_errs,
    'rx_drop': rx_drop,
    'tx_drop': tx_drop,
    'bandwidth': bandwidth,
  };
}

class Enp1s0 {
  Enp1s0({
    required this.rx_bytes,
    required this.tx_bytes,
    required this.rx_packets,
    required this.tx_packets,
    required this.rx_errs,
    required this.tx_errs,
    required this.rx_drop,
    required this.tx_drop,
    required this.bandwidth,
  });

  factory Enp1s0.fromJson(Map<String, dynamic> json) => Enp1s0(
    rx_bytes:
    json.containsKey('rx_bytes') ? asT<int>(json['rx_bytes'])! : 0,
    tx_bytes:
    json.containsKey('tx_bytes') ? asT<int>(json['tx_bytes'])! : 0,
    rx_packets:
    json.containsKey('rx_packets') ? asT<int>(json['rx_packets'])! : 0,
    tx_packets:
    json.containsKey('tx_packets') ? asT<int>(json['tx_packets'])! : 0,
    rx_errs: json.containsKey('rx_errs') ? asT<int>(json['rx_errs'])! : 0,
    tx_errs: json.containsKey('tx_errs') ? asT<int>(json['tx_errs'])! : 0,
    rx_drop: json.containsKey('rx_drop') ? asT<int>(json['rx_drop'])! : 0,
    tx_drop: json.containsKey('tx_drop') ? asT<int>(json['tx_drop'])! : 0,
    bandwidth:
    json.containsKey('bandwidth') ? asT<double>(json['bandwidth'])! : 0,
  );

  int rx_bytes;
  int tx_bytes;
  int rx_packets;
  int tx_packets;
  int rx_errs;
  int tx_errs;
  int rx_drop;
  int tx_drop;
  double bandwidth;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'rx_bytes': rx_bytes,
    'tx_bytes': tx_bytes,
    'rx_packets': rx_packets,
    'tx_packets': tx_packets,
    'rx_errs': rx_errs,
    'tx_errs': tx_errs,
    'rx_drop': rx_drop,
    'tx_drop': tx_drop,
    'bandwidth': bandwidth,
  };
}

class Wlx001c500e4fcd {
  Wlx001c500e4fcd({
    required this.rx_bytes,
    required this.tx_bytes,
    required this.rx_packets,
    required this.tx_packets,
    required this.rx_errs,
    required this.tx_errs,
    required this.rx_drop,
    required this.tx_drop,
    required this.bandwidth,
  });

  factory Wlx001c500e4fcd.fromJson(Map<String, dynamic> json) =>
      Wlx001c500e4fcd(
        rx_bytes:
        json.containsKey('rx_bytes') ? asT<int>(json['rx_bytes'])! : 0,
        tx_bytes:
        json.containsKey('tx_bytes') ? asT<int>(json['tx_bytes'])! : 0,
        rx_packets:
        json.containsKey('rx_packets') ? asT<int>(json['rx_packets'])! : 0,
        tx_packets:
        json.containsKey('tx_packets') ? asT<int>(json['tx_packets'])! : 0,
        rx_errs: json.containsKey('rx_errs') ? asT<int>(json['rx_errs'])! : 0,
        tx_errs: json.containsKey('tx_errs') ? asT<int>(json['tx_errs'])! : 0,
        rx_drop: json.containsKey('rx_drop') ? asT<int>(json['rx_drop'])! : 0,
        tx_drop: json.containsKey('tx_drop') ? asT<int>(json['tx_drop'])! : 0,
        bandwidth:
        json.containsKey('bandwidth') ? asT<double>(json['bandwidth'])! : 0,
      );

  int rx_bytes;
  int tx_bytes;
  int rx_packets;
  int tx_packets;
  int rx_errs;
  int tx_errs;
  int rx_drop;
  int tx_drop;
  double bandwidth;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'rx_bytes': rx_bytes,
    'tx_bytes': tx_bytes,
    'rx_packets': rx_packets,
    'tx_packets': tx_packets,
    'rx_errs': rx_errs,
    'tx_errs': tx_errs,
    'rx_drop': rx_drop,
    'tx_drop': tx_drop,
    'bandwidth': bandwidth,
  };
}

class SystemCpuUsage {
  SystemCpuUsage({
    required this.cpu,
    required this.cpu0,
    required this.cpu1,
    required this.cpu2,
    required this.cpu3,
  });

  factory SystemCpuUsage.fromJson(Map<String, dynamic> json) => SystemCpuUsage(
    cpu: json.containsKey('cpu') ? asT<double>(json['cpu'])! : 0,
    cpu0: json.containsKey('cpu0') ? asT<double>(json['cpu0'])! : 0,
    cpu1: json.containsKey('cpu1') ? asT<double>(json['cpu1'])! : 0,
    cpu2: json.containsKey('cpu2') ? asT<double>(json['cpu2'])! : 0,
    cpu3: json.containsKey('cpu3') ? asT<double>(json['cpu3'])! : 0,
  );

  double cpu;
  double cpu0;
  double cpu1;
  double cpu2;
  double cpu3;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'cpu': cpu,
    'cpu0': cpu0,
    'cpu1': cpu1,
    'cpu2': cpu2,
    'cpu3': cpu3,
  };
}

class SystemMemory {
  SystemMemory({
    required this.total,
    required this.available,
    required this.used,
  });

  factory SystemMemory.fromJson(Map<String, dynamic> json) => SystemMemory(
    total: json.containsKey('total') ? asT<int>(json['total'])! : 0,
    available:
    json.containsKey('available') ? asT<int>(json['available'])! : 0,
    used: json.containsKey('used') ? asT<int>(json['used'])! : 0,
  );

  int total;
  int available;
  int used;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'total': total,
    'available': available,
    'used': used,
  };
}
