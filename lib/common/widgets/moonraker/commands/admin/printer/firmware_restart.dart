import '../../../commands/base.dart';

class FirmwareRestartCommand extends JsonRPCCommand {
  @override
  String method = 'printer.firmware_restart';

  @override
  Map<String, dynamic> parameters = {};
}
