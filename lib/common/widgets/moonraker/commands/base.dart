import 'dart:convert';
import 'dart:io';

import '../errors/klipper_com_error.dart';

abstract class JsonRPCCommand {
  abstract String method;
  abstract Map<String, dynamic> parameters;

  dynamic parseResponse(dynamic response) {
    if (response.toString().contains("JSON-RPC error")) {
      var res = response
          .toString()
          .substring(response.toString().indexOf(':') + 2)
          .replaceAll('"', '\\"')
          .replaceAll("'", '"');
      if (res.contains("{") && res.contains("}") ){
        Map error = json.decode(res) as Map;
        return{
          "error":error['error'].toString(),
          "message":['message'].toString(),
        };
      }else{
        return {"message":res};
      }

    } else {
      return response;
    }
  }
}
