import '../../commands/base.dart';

class CreateUserCommand extends JsonRPCCommand {
  @override
  String method = 'access.post_user';

  @override
  Map<String, dynamic> parameters = {};

  CreateUserCommand(String username, String password) {
    parameters = {
      'username': username,
      'password': password,
    };
  }
}
