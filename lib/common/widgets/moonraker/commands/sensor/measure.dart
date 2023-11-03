import '../../commands/base.dart';

class GetSensorMeasurementsCommand extends JsonRPCCommand {
  @override
  String method = 'server.sensors.measurements';

  @override
  Map<String, dynamic> parameters = {};

  GetSensorMeasurementsCommand(String sensor) {
    parameters['sensor'] = sensor;
  }
}
