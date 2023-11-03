import '../../commands/base.dart';

class GenerateOneshotTokenCommand extends JsonRPCCommand {
  @override
  String method = 'access.oneshot_token';

  @override
  Map<String, dynamic> parameters = {};
}
