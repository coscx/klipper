import '../../commands/base.dart';

class PausePrintCommand extends JsonRPCCommand {
  @override
  String method = 'printer.print.pause';

  @override
  Map<String, dynamic> parameters = {};
}
