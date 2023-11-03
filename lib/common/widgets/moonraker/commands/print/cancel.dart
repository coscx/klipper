import '../../commands/base.dart';

class CancelPrintCommand extends JsonRPCCommand {
  @override
  String method = 'printer.print.cancel';

  @override
  Map<String, dynamic> parameters = {};
}
