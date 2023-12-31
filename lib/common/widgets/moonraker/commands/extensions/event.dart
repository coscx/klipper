import '../../commands/base.dart';

class SendAgentEventCommand extends JsonRPCCommand {
  @override
  String method = 'connection.send_event';

  @override
  Map<String, dynamic> parameters = {};

  SendAgentEventCommand(
    String event, {
    Map<String, dynamic>? data,
  }) {
    parameters = {
      'event': event,
    };
    if (data != null) {
      parameters['data'] = data;
    }
  }
}
