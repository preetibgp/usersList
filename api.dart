import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://reqres.in/api/users?page=2";

class API {
  static Future getUsers() {
    var url = baseUrl + "/users";
    return http.get(url);
  }
}
