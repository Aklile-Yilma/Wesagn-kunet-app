import 'package:flutter/material.dart';

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

  Widget _navigationBar() {
    return Container(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
              backgroundColor: Colors.blueAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.pink,
            ),
          ],
        ),
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
                  // _text("Wesagn Kunet", [255, 255, 255], 50),
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
          Positioned(
              top: _deviceHeight * 0.25,
              left: _deviceHeight * 0.1,
              child: _box(_deviceWidth * 0.3, _deviceHeight * 0.2,
                  "/images/home_page/stork.png", "Birth Certificate")),
          Positioned(
              top: _deviceHeight * 0.25,
              left: _deviceWidth * 0.6,
              child: _box(_deviceWidth * 0.3, _deviceHeight * 0.2,
                  "/images/home_page/marriage.png", "Marriage Certificate")),
          Positioned(
              top: _deviceHeight * 0.6,
              left: _deviceHeight * 0.1,
              child: _box(_deviceWidth * 0.3, _deviceHeight * 0.2,
                  "/images/home_page/casket.png", "Death Certificate")),
          Positioned(
              top: _deviceHeight * 0.6,
              left: _deviceWidth * 0.6,
              child: _box(_deviceWidth * 0.3, _deviceHeight * 0.2,
                  "/images/home_page/marriage.png", "Birth Certificate")),
        ]),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
          backgroundColor: Colors.blueAccent,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
          backgroundColor: Colors.pink,
        ),
      ],
    );
  }
}
