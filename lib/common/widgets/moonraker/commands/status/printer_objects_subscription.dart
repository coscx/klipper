import '../../commands/base.dart';
import '../../commands/status/status_objects.dart';

class PrinterObjectsSubscribeCommand extends JsonRPCCommand {
  @override
  String method = 'printer.objects.subscribe';

  @override
  Map<String, dynamic> parameters = {};

  PrinterObjectsSubscribeCommand({required List<ObjectStatusQuery> objects}) {
    Map<String, Map<String, dynamic>> tempParameters = Map<String, Map<String, dynamic>>.from(parameters);
    tempParameters['objects'] = {};
    for (final element in objects) {


      tempParameters['objects']![element.name] = element.parameters.isEmpty ? null : element.parameters;

    }
    parameters = tempParameters;
  }
}

class PrinterObjectsUnSubscribeCommand extends JsonRPCCommand {
  @override
  String method = 'printer.objects.subscribe';

  @override
  Map<String, dynamic> parameters = {"objects": null};
}
