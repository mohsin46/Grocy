import 'dart:convert';

String convertDetailsToJson(var email,var password) {
  var res={};
  res["consumer_email"]=email;
  res["consumer_password"]=password;
  String js = json.encode(res);
  print(js);
  return js;
}

String convertShopDetailsToJson(var email,var password) {
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

String convertProductDetailsToJson(var name, var price,var qty,var imageUrl,var type) {
  var res = {};
  res["product_name"]=name;
  res["product_price"]=price;
  res["product_quantity"]=qty;
  res["product_type"]=type;
  res["product_image"]=imageUrl;
  String js = json.encode(res);
  print(js);
  return js;
}

String convertShopSignupDetailsToJson(var email,var password,var shopName,var ownerName,var shopContact,var upiId,var latitude,var longitude,var address){
  var res = {};
  res["shop_email"]=email;
  res["shop_password"]=password;
  res["shop_name"]=shopName;
  res["shop_owner"]=ownerName;
  res["shop_contact"]=shopContact;
  res["shop_upiId"]=upiId;
  res["shop_location"]=address;
  res["shop_latitude"]=latitude;
  res["shop_longitude"]=longitude;
  String js = json.encode(res);
  print(js);
  return js;
}
