import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grocy/Screens/Welcome/welcome_screen.dart';

class ShopOwnerProfile extends StatefulWidget {
  @override
  _ShopOwnerProfileState createState() => _ShopOwnerProfileState();
}

class _ShopOwnerProfileState extends State<ShopOwnerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: TextButton(
            onPressed: () async{
              final storage = new FlutterSecureStorage();
              await storage.delete(key: 'user_token');
              await storage.delete(key: 'shop_token');
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => WelcomeScreen()),(route) => false);
            },
            child: Text(
                'Logout'
            ),
          ),
        ),
      )
    );
  }
}
