import '../../commands/base.dart';

class GetJobCommand extends JsonRPCCommand {
  @override
  String method = 'server.history.get_job';

  @override
  Map<String, dynamic> parameters = {};

  GetJobCommand(int jobID) {
    parameters['uid'] = jobID;
  }
}
