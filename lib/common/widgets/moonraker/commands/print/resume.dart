import '../../commands/base.dart';

class ResumePrintCommand extends JsonRPCCommand {
  @override
  String method = 'printer.print.resume';

  @override
  Map<String, dynamic> parameters = {};
}
