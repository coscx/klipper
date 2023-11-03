import '../../commands/base.dart';

class RemoveAnnouncementFeedCommand extends JsonRPCCommand {
  @override
  String method = 'server.announcements.delete_feed';

  @override
  Map<String, dynamic> parameters = {};

  RemoveAnnouncementFeedCommand(String name) {
    parameters['name'] = name;
  }
}
