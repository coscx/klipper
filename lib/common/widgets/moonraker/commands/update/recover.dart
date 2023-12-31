import '../../commands/base.dart';

class RecoverCorruptRepositoryCommand extends JsonRPCCommand {
  @override
  String method = 'machine.update.system';

  @override
  Map<String, dynamic> parameters = {};

  RecoverCorruptRepositoryCommand(String name, {bool hard = false}) {
    parameters = {
      'name': name,
      'hard': hard,
    };
  }
}
