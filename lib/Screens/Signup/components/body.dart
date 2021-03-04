import 'package:flutter/material.dart';
import 'package:grocy/Screens/Login/login_screen.dart';
import 'package:grocy/Screens/Signup/components/or_divider.dart';
import 'package:grocy/Screens/Signup/components/social_icon.dart';
import 'package:grocy/components/already_have_an_account_acheck.dart';
import 'package:grocy/components/rounded_button.dart';
import 'package:grocy/components/rounded_input_field.dart';
import 'package:grocy/components/rounded_password_field.dart';
import 'package:grocy/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        child: SingleChildScrollView(
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
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              SizedBox(
                height: 7,
              ),
              RoundedButton(
                text: "SIGN UP AS CUSTOMER",
                press: () {},
              ),
              RoundedButton(
                text: "SIGN UP AS SHOP OWNER",
                press: () {},
              ),
              SizedBox(height: size.height * 0.04),
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
      ),
    );
  }
}
