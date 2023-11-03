import '../../commands/base.dart';

class RetrieveJobQueueStatusCommand extends JsonRPCCommand {
  @override
  String method = 'server.job_queue.status';

  @override
  Map<String, dynamic> parameters = {};
}
