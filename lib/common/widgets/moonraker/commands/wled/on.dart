import '../../commands/base.dart';

class StripOnCommand extends JsonRPCCommand {
  @override
  String method = 'machine.wled.on';

  @override
  Map<String, dynamic> parameters = {};

  StripOnCommand(List<String> strips) {
    for (final strip in strips) {
      parameters[strip] = null;
    }
  }
}
