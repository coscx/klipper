import '../../commands/base.dart';

class GetAuthorizationEndpointInfoCommand extends JsonRPCCommand {
  @override
  String method = 'access.info';

  @override
  Map<String, dynamic> parameters = {};
}
