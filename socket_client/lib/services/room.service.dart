import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:socket_client/env.dart';

class RoomService {
  Future<http.Response> getPrivateRooms(String id) async {
    var uri =
        Uri.http(Environment().mainUrl, '/api/v1/getPrivateRooms', {"id": id});
    return http.get(uri);
  }
}
