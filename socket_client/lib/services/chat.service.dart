import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:socket_client/env.dart';

class ChatService {
  Future<http.Response> getChatById(int id) async {
    var uri = Uri.http(Environment().mainUrl, '/api/v1/getMessageByRoom',
        {"id": id.toString()});
    return http.get(uri);
  }
}
