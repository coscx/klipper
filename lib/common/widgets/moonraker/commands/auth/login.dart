import '../../commands/base.dart';

class LoginUserCommand extends JsonRPCCommand {
  @override
  String method = 'access.login';

  @override
  Map<String, dynamic> parameters = {};

  LoginUserCommand(
    String username,
    String password, {
    AuthSource source = AuthSource.moonraker,
  }) {
    parameters = {
      'username': username,
      'password': password,
      'source': source.toString()
    };
  }
}

enum AuthSource { ldap, moonraker }
