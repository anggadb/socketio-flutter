import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class RoomService {
  Future<http.Response> getPrivateRooms(String id) async {
    var uri = Uri.http(
        DotEnv().env['MAIN_URL'], '/api/v1/getPrivateRooms', {"id": id});
    return http.get(uri);
  }
}
