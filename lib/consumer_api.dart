import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

Uri url = Uri.parse('https://4ca5c28fb3e4.ngrok.io');
var url2 = 'https://localhost:3000';

final storage = new FlutterSecureStorage();

class ConsumerApi {
  Future signup(String user) async {
    http.Response response = await http.post(Uri.parse('$url/consumer/signup'),
        headers: {"Content-Type": "application/json"},
        body:user);
    String data = response.body;
    var decodedData = jsonDecode(data);
    print(decodedData);
    return decodedData;
  }

  Future login(String user) async {
    http.Response response = await http.post(Uri.parse('$url/consumer/login'),
        headers: {"Content-Type": "application/json"},
        body:user);
    String data = response.body;
    var decodedData = jsonDecode(data);
    print(decodedData);
    return decodedData;
  }
}

class ShopApi {

  Future getProducts() async{
    var token = await storage.read(key: 'shop_token');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    var shop_id = decodedToken['shop_id'];
    print(decodedToken);
    print(token);
    http.Response response = await http.get(Uri.parse('$url/consumer/$shop_id/products'),
      headers: {"Authorization": 'Bearer $token'},
    );
    //print(response.body);
    var decodedData = jsonDecode(response.body);
    print(decodedData);
    return decodedData;
  }

  Future signup(String shop) async {
    http.Response response = await http.post(Uri.parse('$url/shop/signup'),
        headers: {"Content-Type": "application/json"},
        body:shop);
    String data = response.body;
    print(data);
    var decodedData = jsonDecode(data);
    print(decodedData);
    return decodedData;
  }


  Future login(String shop) async {
    http.Response response = await http.post(Uri.parse('$url/shop/login'),
        headers: {"Content-Type": "application/json"},
        body:shop);
    String data = response.body;
    print(data);
    var decodedData = jsonDecode(data);
    print(decodedData);
    return decodedData;
  }

  Future addProduct(String product) async {
    var token = await storage.read(key: 'shop_token');
    print(token);
    http.Response response = await http.post(Uri.parse('$url/shop/product'),
        headers: {"Content-Type": "application/json","Authorization": 'Bearer $token'},
        body:product);
    String data = response.body;
    print(data);
    var decodedData = jsonDecode(data);
    print(decodedData);
    return decodedData;
  }
}