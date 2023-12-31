import '../../commands/base.dart';

class StartServiceCommand extends JsonRPCCommand {
  @override
  String method = 'machine.services.start';

  @override
  Map<String, dynamic> parameters = {};

  StartServiceCommand(StartableService service) {
    parameters = {'service': service.toString()};
  }
}

enum StartableService { webcamd, klipper }
