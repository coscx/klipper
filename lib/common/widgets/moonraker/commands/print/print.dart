import '../../commands/base.dart';

class PrintFileCommand extends JsonRPCCommand {
  @override
  String method = 'printer.print.start';

  @override
  Map<String, dynamic> parameters = {};

  PrintFileCommand(String filename) {
    parameters['filename'] = filename;
  }
}
