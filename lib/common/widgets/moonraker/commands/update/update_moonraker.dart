import '../../commands/base.dart';

class UpdateMoonrakerCommand extends JsonRPCCommand {
  @override
  String method = 'machine.update.moonraker';

  @override
  Map<String, dynamic> parameters = {};
}
