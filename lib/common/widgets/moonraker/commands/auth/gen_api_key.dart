import '../../commands/base.dart';

class GenerateApiKeyCommand extends JsonRPCCommand {
  @override
  String method = 'access.post_api_key';

  @override
  Map<String, dynamic> parameters = {};
}
