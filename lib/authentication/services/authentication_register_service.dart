import 'dart:convert';

import 'package:projectvivid/authentication/services/test.dart';
import 'package:http/http.dart' as http;

class AuthenticationRegisterService {
  Future<void> testService() async {
    final response = await http.get(Uri.parse('http://localhost:1337/authentication/test'));
    print(jsonDecode(response.body));
    print(Fact.fromJson(jsonDecode(response.body)));
  }
}