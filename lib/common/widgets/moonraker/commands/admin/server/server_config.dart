import '../../../commands/base.dart';

class ServerConfigurationCommand extends JsonRPCCommand {
  @override
  String method = 'server.config';

  @override
  Map<String, dynamic> parameters = {};
}
