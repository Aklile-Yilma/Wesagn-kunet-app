import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _deviceWidth = MediaQuery.of(context).size.width;
    final double _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(children: [
      Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 40, 100, 190),
                  Color.fromARGB(255, 169, 207, 233),
                  Color.fromARGB(255, 131, 184, 230),
                ]),
          )),
      SizedBox(
        height: _deviceHeight * .2,
      ),
      Positioned(
        top: _deviceHeight * .3,
        left: _deviceWidth * .4,
        child: Image.asset('/images/cartoon.png'),
      ),
      SizedBox(
        height: _deviceHeight * .05,
      ),
      Text("wesagn kunet", style: TextStyle(color: Colors.white, fontSize: 20))
    ]));
  }
}
