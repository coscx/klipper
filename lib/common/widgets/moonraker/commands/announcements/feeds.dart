import '../../commands/base.dart';

class ListAnnouncementFeedsCommand extends JsonRPCCommand {
  @override
  String method = 'server.announcements.feeds';

  @override
  Map<String, dynamic> parameters = {};
}
