import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grocy/Screens/Welcome/welcome_screen.dart';
import 'package:grocy/constants.dart';

void main() => runApp(MyApp());

class CheckingScreen extends StatefulWidget {
  @override
  _CheckingScreenState createState() => _CheckingScreenState();
}

class _CheckingScreenState extends State<CheckingScreen> {
  @override
  void initState() async{
    final storage = new FlutterSecureStorage();
    String token = await storage.read(key: 'user_token');
    print(token);
  }
  Widget build(BuildContext context) {
    return Container();
  }
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
