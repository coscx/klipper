import '../../../commands/base.dart';

class RestartCommand extends JsonRPCCommand {
  @override
  String method = 'server.restart';

  @override
  Map<String, dynamic> parameters = {};
}
