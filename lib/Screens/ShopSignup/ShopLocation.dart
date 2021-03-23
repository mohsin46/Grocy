import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grocy/Screens/ShopScreens/BottomTabs.dart';
import 'package:grocy/Screens/signupFunctions.dart';
import 'package:grocy/consumer_api.dart';

class ShopLocationScreen extends StatefulWidget {
  final email;
  final password;
  final shopName;
  final ownerName;
  final shopContact;
  final address;
  final upiId;
  ShopLocationScreen({this.email,this.password,this.shopName,this.ownerName,this.shopContact,this.upiId,this.address});
  @override
  _ShopLocationScreenState createState() => _ShopLocationScreenState();
}

class _ShopLocationScreenState extends State<ShopLocationScreen> {
  var latitude;
  var longitude;
  var apiKey='AIzaSyB1hSZ48f5wir9fhHtrNWV6yhVW0H0ZDck';
  var shop;
  ShopApi shopApi = new ShopApi();
  LatLng Pos;
  LocationResult _pickedLocation;
  final storage = new FlutterSecureStorage();
  var error;

  void storeShopToken(var token) async{
    await storage.delete(key: 'user_token');
    await storage.write(key: 'shop_token', value: token);
    print(token);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => BottomTabs()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          side: BorderSide(color:Colors.green)
                      ),
                    ),
                  ),
                  child: Container(
                    width: size.width-105,
                    height: size.height/21,
                    child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_location,
                              color: Colors.white,
                              size: size.height/22.5,
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Text(
                              'Get Location',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.height/41,
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                  onPressed: () async{
                    //Navigator.push(context, ProductTile())
                    LocationResult result = await showLocationPicker(
                      context,
                      apiKey,
                      initialCenter: LatLng(31.1975844, 29.9598339),
//                      automaticallyAnimateToCurrentLocation: true,
//                      mapStylePath: 'assets/mapStyle.json',
                      myLocationButtonEnabled: true,
                      // requiredGPS: true,
                      layersButtonEnabled: true,
                      // countries: ['AE', 'NG']

//                      resultCardAlignment: Alignment.bottomCenter,
                      desiredAccuracy: LocationAccuracy.best,
                    );
                    print("result = $result");
                    setState(() {
                      _pickedLocation = result;
                      latitude=result.latLng.latitude.toString();
                      longitude=result.latLng.longitude.toString();
                    }
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5,35, 5, 0),
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Latitude : $latitude',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.green
                      ),
                    )
                  ],
                )
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(5,35, 5, 0),
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Longitude : $longitude',
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.green
                        ),
                      )
                    ],
                  )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, size.height/9, 0, 0),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          side: BorderSide(color:Colors.green)
                      ),
                    ),
                  ),
                  child: Container(
                    width: size.width-25,
                    height: size.height/21,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_box_outlined,
                              color: Colors.white,
                              size: size.height/22.5,
                            ),
                            SizedBox(
                              width: 9,
                            ),
                            Text(
                              'Signup',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.height/41,
                              ),
                            ),
                          ],
                        )
                    ),
                  ),
                  onPressed: () async{
                    shop=convertShopSignupDetailsToJson(widget.email, widget.password, widget.shopName, widget.ownerName, widget.shopContact, widget.upiId, latitude, longitude, widget.address);
                    print(shop);
                    var data = await shopApi.signup(shop);
                    print(data);
                    if(data['token']!=null) {
                      await storeShopToken(data['token']);
                    } else {
                      error=data['error'];
                      await storage.write(key: 'error', value: error);
                      print(error);
                    }
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
