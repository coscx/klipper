import '../../commands/base.dart';

class GetDebugDatabaseItemCommand extends JsonRPCCommand {
  @override
  String method = 'debug.database.get_item';

  @override
  Map<String, dynamic> parameters = {};

  GetDebugDatabaseItemCommand({
    required String namespace,
    required String key,
  }) {
    parameters['namespace'] = namespace;
    parameters['key'] = key;
  }
}
