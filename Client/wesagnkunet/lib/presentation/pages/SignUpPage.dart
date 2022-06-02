import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

// void main() {
//   runApp(SignUpPage());
// }

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
              "SIGN UP",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(0, 0, 139, 1),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Full name",
              ),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Email address"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Password",
                // suffixIcon:Icon(
                //   icon: Icon(Icons.visibility_off))
              ),
            ),
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
                  ))),
              child: Text(
                "Sign up",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Center(
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Already have an account?",
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("Log in");
                        })
                ]),
              ),
            )
          ],
        )),
      ),
    ));
  }
}
