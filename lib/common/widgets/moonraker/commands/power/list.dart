import '../../commands/base.dart';

class GetDeviceListCommand extends JsonRPCCommand {
  @override
  String method = 'machine.device_power.devices';

  @override
  Map<String, dynamic> parameters = {};
}
