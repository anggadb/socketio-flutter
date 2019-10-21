import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ChatService {
  Future<http.Response> getAllMessage() async {
    return http.get(DotEnv().env['API_URL'] + '/getAllChats');
  }
}
