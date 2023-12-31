import '../../commands/base.dart';

class DeleteWebcamCommand extends JsonRPCCommand {
  @override
  String method = 'server.webcams.delete_item';

  @override
  Map<String, dynamic> parameters = {};

  DeleteWebcamCommand(String name) {
    parameters = {
      'name': name,
    };
  }
}
