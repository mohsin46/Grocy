import 'package:flutter/material.dart';
import 'package:grocy/Screens/ConsumerSignupDetails/ConsumerSignup.dart';
import 'package:grocy/Screens/Login/login_screen.dart';
import 'package:grocy/Screens/Signup/components/or_divider.dart';
import 'package:grocy/Screens/Signup/components/social_icon.dart';
import 'package:grocy/Screens/signupFunctions.dart';
import 'package:grocy/components/already_have_an_account_acheck.dart';
import 'package:grocy/components/rounded_button.dart';
import 'package:grocy/components/rounded_input_field.dart';
import 'package:grocy/components/rounded_password_field.dart';
import 'package:grocy/constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var email;
  var password;
  String userInfo;
  @override

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN UP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
                fontSize: size.height * 0.06,
              ),
            ),
            SizedBox(height: size.height * 0.06),
            RoundedInputField(
              hintText: "Your Email",
              icon: Icons.email,
              onChanged: (value) {
                email=value;
                print(email);
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password=value;
                print(password);
              },
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            RoundedButton(
              text: "SIGN UP AS CUSTOMER",
              press: () {
                userInfo = convertDetailsToJson(email, password);
                print(userInfo);
                Navigator.push(context,MaterialPageRoute(builder: (context) {
                  return ConsumerSignup(
                    userInfo : userInfo,
                  );
                }));
              },
            ),
            RoundedButton(
              text: "SIGN UP AS SHOP OWNER",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
