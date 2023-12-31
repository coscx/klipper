import '../../commands/base.dart';

class DeleteDebugDatabaseItemCommand extends JsonRPCCommand {
  @override
  String method = 'debug.database.delete_item';

  @override
  Map<String, dynamic> parameters = {};

  DeleteDebugDatabaseItemCommand({
    required String namespace,
    required String key,
  }) {
    parameters['namespace'] = namespace;
    parameters['key'] = key;
  }
}
