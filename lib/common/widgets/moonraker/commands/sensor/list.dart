import '../../commands/base.dart';

class GetSensorsCommand extends JsonRPCCommand {
  @override
  String method = 'server.sensors.list';

  @override
  Map<String, dynamic> parameters = {};
}
