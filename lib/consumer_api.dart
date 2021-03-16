import 'dart:convert';

import 'package:http/http.dart' as http;

var url = 'https://ca0d1af47c66.ngrok.io';
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

  Future login(String user) async {
    http.Response response = await http.post('$url/consumer/login',
        headers: {"Content-Type": "application/json"},
        body:user);
    String data = response.body;
    var decodedData = jsonDecode(data);
    print(decodedData);
    return decodedData;
  }
}

class ShopApi {
  Future login(String shop) async {
    http.Response response = await http.post('$url/shop/login',
        headers: {"Content-Type": "application/json"},
        body:shop);
    String data = response.body;
    print(data);
    var decodedData = jsonDecode(data);
    print(decodedData);
    return decodedData;
  }
}