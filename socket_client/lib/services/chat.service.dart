import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ChatService {
  Future<http.Response> getChatById(int id) async {
    var uri = Uri.http(DotEnv().env['MAIN_URL'], '/api/v1/getMessageByRoom',
        {"id": id.toString()});
    return http.get(uri);
  }
}
