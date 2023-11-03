import '../../commands/base.dart';

class MachineRebootCommand extends JsonRPCCommand {
  @override
  String method = 'machine.reboot';

  @override
  Map<String, dynamic> parameters = {};
}
