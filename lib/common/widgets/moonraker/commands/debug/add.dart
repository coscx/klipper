import '../../commands/base.dart';

class AddDebugDatabaseItemCommand extends JsonRPCCommand {
  @override
  String method = 'debug.database.post_item';

  @override
  Map<String, dynamic> parameters = {};

  AddDebugDatabaseItemCommand({
    required String namespace,
    required String key,
    required dynamic value,
  }) {
    parameters['namespace'] = namespace;
    parameters['key'] = key;
    parameters['value'] = value;
  }
}
