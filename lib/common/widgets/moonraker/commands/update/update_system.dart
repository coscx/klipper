import '../../commands/base.dart';

class UpdateSystemCommand extends JsonRPCCommand {
  @override
  String method = 'machine.update.system';

  @override
  Map<String, dynamic> parameters = {};
}
