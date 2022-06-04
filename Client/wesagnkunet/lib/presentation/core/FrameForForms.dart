import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: Settings()));
// }

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: _deviceHeight * .5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color.fromARGB(255, 110, 160, 201),
              ),
            )),
        Positioned(
          top: _deviceHeight * .04,
          left: _deviceWidth * .02,
          bottom: _deviceHeight * .7,
          right: _deviceWidth * .5,
          child: Image.asset("images/logo-primary.png"),
        ),
        Positioned(
          top: _deviceHeight * .35,
          left: _deviceWidth * .05,
          bottom: _deviceHeight * 0.05,
          child: Container(
              height: _deviceHeight * .6,
              width: _deviceWidth * .8,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        blurRadius: 15,
                        spreadRadius: 5)
                  ])),
        )
      ]),
    );
  }
}
//     