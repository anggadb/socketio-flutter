import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class RoomService {
  Future<http.Response> getPrivateRooms(int id) async {
    var uri = Uri.http(DotEnv().env['MAIN_URL'], '/api/v1/getPrivateRooms',
        {"id": id.toString()});
    return http.get(uri);
  }
}
