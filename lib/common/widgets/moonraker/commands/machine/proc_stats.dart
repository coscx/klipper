import '../../commands/base.dart';

class MoonrakerProcessStatsCommand extends JsonRPCCommand {
  @override
  String method = 'moonraker.proc_stats';

  @override
  Map<String, dynamic> parameters = {};
}
