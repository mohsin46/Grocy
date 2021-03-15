import 'package:flutter/material.dart';
import 'package:grocy/Screens/Signup/signup_screen.dart';
import 'package:grocy/components/already_have_an_account_acheck.dart';
import 'package:grocy/components/rounded_button.dart';
import 'package:grocy/components/rounded_input_field.dart';
import 'package:grocy/components/rounded_password_field.dart';
import 'package:grocy/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              "Welcome to Grocy",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
                fontSize: size.height * 0.07,
                fontFamily: "Lobster",
              ),
            ),
            SizedBox(height: size.height * 0.12),
            RoundedInputField(
              hintText: "Your Email",
              icon: Icons.person,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {},
            ),
            SizedBox(height: size.height * 0.02),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
