import '../../commands/base.dart';

class ResetJobTotalsCommand extends JsonRPCCommand {
  @override
  String method = 'server.history.reset_totals';

  @override
  Map<String, dynamic> parameters = {};
}
