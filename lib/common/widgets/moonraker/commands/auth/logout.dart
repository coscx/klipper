import '../../commands/base.dart';

class LogoutUserCommand extends JsonRPCCommand {
  @override
  String method = 'access.logout';

  @override
  Map<String, dynamic> parameters = {};
}
