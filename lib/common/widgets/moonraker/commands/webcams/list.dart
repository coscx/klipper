import '../../commands/base.dart';

class GetWebcamsCommand extends JsonRPCCommand {
  @override
  String method = 'server.webcams.list';

  @override
  Map<String, dynamic> parameters = {};
}
