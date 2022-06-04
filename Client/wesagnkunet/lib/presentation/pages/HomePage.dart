import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _text(String text, List color, double fontsizeIn) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontsizeIn,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(color[0], color[1], color[2], 1)),
    );
  }

  Widget _box(double width, double height, String imagePath, String text) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(244, 226, 198, 1),
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3)),
          BoxShadow(
            color: Colors.white,
            offset: Offset(0, 0),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: width * 0.5, child: Image.asset(imagePath)),
          Text(text)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double _deviceWidth = MediaQuery.of(context).size.width;
    final double _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Wesagn Kunet",
      )),
      body: SizedBox(
        height: _deviceHeight,
        child: Stack(children: [
          Container(
            width: _deviceWidth,
            height: _deviceHeight * 0.3,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
                top: _deviceHeight * 0.05, left: _deviceWidth * 0.05),
            color: const Color.fromRGBO(0, 0, 139, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: _text("Good Morning", [255, 255, 255], 30)),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: _text("UserName", [255, 255, 255], 20)),
                ]),
              ],
            ),
          ),
          Positioned(
            top: _deviceHeight * 0.3,
            child: SizedBox(
              height: _deviceHeight * 0.7,
              width: _deviceWidth,
              child: Image.asset(
                "assets/images/texture.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.go("/birthForm");
            },
            child: Positioned(
                top: _deviceHeight * 0.25,
                left: _deviceHeight * 0.1,
                child: _box(_deviceWidth * 0.3, _deviceHeight * 0.2,
                    "/images/home_page/stork.png", "Birth Certificate")),
          ),
          GestureDetector(
            onTap: () {
              context.go("marriageForm");
            },
            child: Positioned(
                top: _deviceHeight * 0.25,
                left: _deviceWidth * 0.6,
                child: _box(_deviceWidth * 0.3, _deviceHeight * 0.2,
                    "/images/home_page/marriage.png", "Marriage Certificate")),
          ),
          GestureDetector(
            onTap: () {
              context.go("deathForm");
            },
            child: Positioned(
                top: _deviceHeight * 0.6,
                left: _deviceHeight * 0.1,
                child: _box(_deviceWidth * 0.3, _deviceHeight * 0.2,
                    "/images/home_page/casket.png", "Death Certificate")),
          ),
          GestureDetector(
            onTap: () {
              context.go("birthForm");
            },
            child: Positioned(
                top: _deviceHeight * 0.6,
                left: _deviceWidth * 0.6,
                child: _box(_deviceWidth * 0.3, _deviceHeight * 0.2,
                    "/images/home_page/marriage.png", "Birth Certificate")),
          ),
        ]),
      ),
      bottomNavigationBar: navBar(context, _deviceWidth, _deviceHeight),
    );
  }
}

Widget navBar(BuildContext context, double _deviceWidth, double _deviceHeight) {
  return SizedBox(
    width: _deviceWidth,
    height: _deviceHeight * 0.1,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {
            context.go("/MyAccounts");
          },
          child: Tooltip(
            message: "My Certificates",
            child: Image.asset(
              "/images/certificate_icon.jpg",
              height: 40,
            ),
          ),
        ),
        TextButton(
            onPressed: () {
              context.go("/");
            },
            child: Tooltip(
              message: "Home",
              child: Icon(
                Icons.home,
                color: Colors.blue,
              ),
            )),
        TextButton(
            onPressed: () {
              context.go("/Settings");
            },
            child: Tooltip(
              message: "Settings",
              child: Icon(
                Icons.settings,
                color: Colors.blue,
              ),
            ))
      ],
    ),
  );
}
