import '../../commands/base.dart';

class PerformFullUpdateCommand extends JsonRPCCommand {
  @override
  String method = 'machine.update.full';

  @override
  Map<String, dynamic> parameters = {};
}
