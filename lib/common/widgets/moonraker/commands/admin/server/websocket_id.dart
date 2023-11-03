import '../../../commands/base.dart';

@Deprecated('Use [IdentifyConnectionCommand] instead')
class WebSocketIDCommand extends JsonRPCCommand {
  @override
  String method = 'server.websocket.id';

  @override
  Map<String, dynamic> parameters = {};
}
