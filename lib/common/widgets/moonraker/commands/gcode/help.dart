import '../../commands/base.dart';

class GCodeHelpCommand extends JsonRPCCommand {
  @override
  String method = 'printer.gcode.help';

  @override
  Map<String, dynamic> parameters = {};
}
