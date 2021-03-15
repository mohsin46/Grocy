import 'dart:convert';

import 'package:http/http.dart' as http;

var url = 'https://540ae321db64.ngrok.io';
var url2 = 'https://localhost:3000';

class ConsumerApi {
  Future signup(String user) async {
    http.Response response = await http.post('$url/consumer/signup',
        headers: {"Content-Type": "application/json"},
        body:user);
    String data = response.body;
    var decodedData = jsonDecode(data);
    print(decodedData);
    return decodedData;
  }
}