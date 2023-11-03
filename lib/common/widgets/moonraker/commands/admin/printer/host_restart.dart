import '../../../commands/base.dart';

class HostRestartCommand extends JsonRPCCommand {
  @override
  String method = 'printer.restart';

  @override
  Map<String, dynamic> parameters = {};
}
