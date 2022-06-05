import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Certificates()));
}

class Certificates extends StatelessWidget {
  const Certificates({Key? key}) : super(key: key);

  Widget _card(String imagePath, String label, DateTime issueDate,
      double _deviceWidth, double _deviceHeight) {
    return Card(
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 139, 1),
                  ),
                ),
              ),
              Text(issueDate.toString()),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(children: [
        SizedBox(
          child: _card("images/baby.jpg", "Birth Certificate", DateTime.now(),
              _deviceWidth, _deviceHeight),
        ),
        SizedBox(
          width: _deviceWidth * 0.8,
          child: _card("images/marriage.webp", "Marriage Certificate",
              DateTime.now(), _deviceWidth, _deviceHeight),
        ),
        SizedBox(
          width: _deviceWidth * 0.8,
          child: _card("images/death.jpg", "Death Certificate", DateTime.now(),
              _deviceWidth, _deviceHeight),
        ),
      ]),
    );
  }
}
