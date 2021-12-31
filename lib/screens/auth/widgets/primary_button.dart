import 'package:flutter/material.dart';
import 'package:mobile/screens/auth/auth.dart';
import 'package:mobile/screens/home.dart';
import 'package:mobile/screens/auth/theme.dart';

class CustomPrimaryButton extends StatelessWidget {
  final Color buttonColor;
  final String textValue;
  final Color textColor;
  final bool isRegister;
  final bool isLogin;
  final CookieRequest? request;
  final String? username;
  final String? password;

  dynamic login() async {
    // 'username' and 'password' should be the values of the user login form.
    final response = await request!
        .login("https://stu-do-list.herokuapp.com/login_flutter/", {
      'username': username,
      'password': password,
    });
    if (request!.loggedIn) {
      return response;
    } else {
      return response;
    }
  }

  CustomPrimaryButton(
      {required this.buttonColor,
      required this.textValue,
      required this.textColor,
      required this.isRegister,
      required this.isLogin,
      this.request,
      this.username,
      this.password});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(14.0),
      elevation: 0,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              if (isRegister) {
                await login();
              }
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            borderRadius: BorderRadius.circular(14.0),
            child: Center(
              child: Text(
                textValue,
                style: heading5.copyWith(color: textColor),
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
