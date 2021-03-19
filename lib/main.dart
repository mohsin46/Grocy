import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:grocy/Screens/Welcome/welcome_screen.dart';
import 'package:grocy/constants.dart';
import 'package:grocy/redux/model.dart';
import 'package:grocy/redux/reducers.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() {
  //final Store<AppState> _store = Store(appReducer, initialState: AppState(new shopDetails()),);
  runApp(MyApp());
}

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
  /*
  final Store<AppState> store;
  MyApp({this.store});
   */

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
      middleware: [thunkMiddleware]
    );
    return StoreProvider(store: store,
        child:MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Auth',
          theme: ThemeData(
            primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white,
          ),
          home: WelcomeScreen(),
        ),
    );
  }
}
