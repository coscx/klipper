import '../../commands/base.dart';

class GetJobTotalsCommand extends JsonRPCCommand {
  @override
  String method = 'server.history.totals';

  @override
  Map<String, dynamic> parameters = {};
}
