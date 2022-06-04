import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

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
        left: _deviceWidth * .01,
        bottom: _deviceHeight * .7,
        right: _deviceWidth * .7,
        child: Image.asset("images/logo-primary.png"),
      ),
      Positioned(
          top: _deviceHeight * .1,
          left: _deviceWidth * .3,
          child: Column(
            children: [
              Text(
                "Create new password",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 4, 4, 106),
                ),
              ),
              Text(
                "Create a new password and never  ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 233, 234, 236),
                ),
              ),
              Text(" share it with anyone for your safety",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 233, 234, 236),
                  )),
            ],
          )),
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
                ]),
            child: Positioned(
              left: _deviceWidth * .4,
              child: Column(children: [
                SizedBox(
                  height: _deviceHeight * .05,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          gapPadding: _deviceHeight * .2),
                      labelText: "New password"),
                ),
                SizedBox(
                  height: _deviceHeight * .04,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          gapPadding: _deviceHeight * .02),
                      labelText: "Confirm your password"),
                ),
                SizedBox(
                  height: _deviceHeight * .1,
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(255, 255, 255, 1)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 101, 151, 191),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(_deviceWidth * .05))),
                  child: Text(
                    "Change password",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ]),
            ),
          ))
    ]));
  }
}
//   