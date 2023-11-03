import '../../../commands/base.dart';

class ServerInfoCommand extends JsonRPCCommand {
  @override
  String method = 'server.info';

  @override
  Map<String, dynamic> parameters = {};
}
