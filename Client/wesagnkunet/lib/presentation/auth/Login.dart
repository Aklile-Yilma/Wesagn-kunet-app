import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          width: _deviceWidth * 0.5,
          height: _deviceHeight * 0.8,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "LOGIN",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 0, 139, 1)),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'user@example.com',
                    hintText: 'Enter your Email',
                  ),
                ),
                TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                )),
                TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(255, 255, 255, 1)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(0, 0, 149, 1)),
                      padding:
                          MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(
                        right: _deviceWidth * 0.05,
                        left: _deviceWidth * 0.05,
                        bottom: _deviceWidth * 0.05,
                        top: _deviceWidth * 0.05,
                      )),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 15),
                    )),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account yet? ",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("Sign Up clicked");
                              }),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: _deviceHeight * 0.1),
                  child: Image.asset(
                    "assets/images/logo-primary.png",
                    width: _deviceWidth * 0.2,
                    height: _deviceWidth * 0.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
