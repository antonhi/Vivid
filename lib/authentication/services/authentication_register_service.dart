import 'dart:convert';

import 'package:projectvivid/authentication/services/test.dart';
import 'package:http/http.dart' as http;

class AuthenticationRegisterService {

  Future<bool> registerEmailAndPassword(String username, String password) async {
    
    return false;
  }

  Future<void> testService() async {
    final response = await http.post(Uri.parse('http://localhost:1337/authentication/test'), body: 'Hello');
    print(jsonDecode(response.body));
    print(Fact.fromJson(jsonDecode(response.body)));
  }
}