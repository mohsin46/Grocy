import 'dart:convert';

String convertDetailsToJson(var email,var password) {
  var res={};
  res["email"]=email;
  res["password"]=password;
  String js = json.encode(res);
  print(js);
  return js;
}

String convertToJson(var email,var password,var contact,var address,var name) {
  var res = {};
  res["consumer_email"]=email;
  res["consumer_password"]=password;
  res["consumer_contact"]=contact;
  res["consumer_address"]=address;
  res["consumer_name"]=name;
  String js = json.encode(res);
  print(js);
  return js;
}