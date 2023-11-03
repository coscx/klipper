import '../../../commands/base.dart';

class CachedTemperatureDataCommand extends JsonRPCCommand {
  @override
  String method = 'server.temperature_store';

  @override
  Map<String, dynamic> parameters = {};
}
