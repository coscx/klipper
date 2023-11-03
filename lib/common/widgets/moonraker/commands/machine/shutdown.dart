import '../../commands/base.dart';

class ShutdownMachineCommand extends JsonRPCCommand {
  @override
  String method = 'machine.shutdown';

  @override
  Map<String, dynamic> parameters = {};
}
