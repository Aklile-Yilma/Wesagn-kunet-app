import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Certificates()));
}

class Certificates extends StatelessWidget {
  const Certificates({super.key});

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: ListView(children: [
      SizedBox(
        height: _deviceHeight * .05,
      ),
      Positioned(
          child: Container(
        height: _deviceHeight * .3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(_deviceHeight * .1)),
            color: Color.fromRGBO(0, 0, 139, 1),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  blurRadius: 25,
                  spreadRadius: 5)
            ]),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: _deviceHeight * .2,
              child: Image.asset("images/baby.jpg"),
            ),
            Positioned(
                top: _deviceHeight * .1,
                left: _deviceWidth * .62,
                child: Text("Birth certificate",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 254, 255, 255),
                    )))
          ],
        ),
      )),
      SizedBox(
        height: _deviceHeight * .05,
      ),
      Positioned(
          child: Container(
        height: _deviceHeight * .3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(_deviceHeight * .2)),
            color: Color.fromRGBO(0, 0, 139, 1),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  blurRadius: 25,
                  spreadRadius: 5)
            ]),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset("images/marriage.webp"),
            ),
            Positioned(
                top: _deviceHeight * .1,
                left: 0,
                child: Text("Marriage certificate",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 254, 255, 255),
                    )))
          ],
        ),
      )),
      SizedBox(
        height: _deviceHeight * .05,
      ),
      Positioned(
          child: Container(
        height: _deviceHeight * .3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(_deviceHeight * .1)),
            color: Color.fromRGBO(0, 0, 139, 1),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  blurRadius: 25,
                  spreadRadius: 5)
            ]),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset("images/death.jpg"),
            ),
            Positioned(
                top: _deviceHeight * .1,
                left: _deviceWidth * .62,
                child: Text("Death certificate",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 254, 255, 255),
                    ))),
          ],
        ),
      )),
      SizedBox(
        height: _deviceHeight * .05,
      ),
    ]));
  }
}
