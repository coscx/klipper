import '../../commands/base.dart';

class GetNamespacesCommand extends JsonRPCCommand {
  @override
  String method = 'server.database.list';

  @override
  Map<String, dynamic> parameters = {};
}
