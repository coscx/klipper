import '../../commands/base.dart';

class ListNotifiersCommand extends JsonRPCCommand {
  @override
  String method = 'server.notifiers.list';

  @override
  Map<String, dynamic> parameters = {};
}
