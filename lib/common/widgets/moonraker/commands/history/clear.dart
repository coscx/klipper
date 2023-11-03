import '../../commands/base.dart';

class ClearHistoryCommand extends JsonRPCCommand {
  @override
  String method = 'server.history.delete_job';

  @override
  Map<String, dynamic> parameters = {'all': true};
}
