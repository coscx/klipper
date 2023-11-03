import '../../commands/base.dart';
import '../../commands/status/status_objects.dart';

class PrinterObjectsStatusCommand extends JsonRPCCommand {
  @override
  String method = 'printer.objects.query';

  @override
  Map<String, dynamic> parameters = {};

  PrinterObjectsStatusCommand({required List<ObjectStatusQuery> objects}) {
    for (final element in objects) {
      final tempParameters = parameters as Map<String, Map<String, dynamic>>;
      tempParameters['objects'] = {};
      tempParameters['objects']![element.name] =
          element.parameters.isEmpty ? null : element.parameters;
      parameters = tempParameters;
    }
  }
}
