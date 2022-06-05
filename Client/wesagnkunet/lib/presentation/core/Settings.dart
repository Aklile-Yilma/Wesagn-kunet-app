import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Accounts extends StatelessWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: _deviceHeight * .02,
        ),
        Container(
          color: Color.fromARGB(255, 242, 244, 245),
          height: _deviceHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: _deviceHeight * .02,
              ),
              CircleAvatar(
                radius: _deviceHeight * .1,
                backgroundImage: AssetImage("images/texture.jpg"),
              ),

              Text(
                "User name",
                style: TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 134, 187, 230)),
              ),
              Text(
                "example@gmail.com",
                style: TextStyle(
                    fontSize: 12, color: Color.fromARGB(255, 134, 187, 230)),
              ),
              SizedBox(
                height: 15,
              ),

              // _tile("UserName", [0, 0, 139]),
              SizedBox(
                height: 10,
              ),
              _tile("Change profile  ", [255, 255, 255]),
              SizedBox(
                height: 15,
              ),
              _tile("Sign out ", [255, 255, 255]),
              // SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _tile(String labelIn, List color) {
    return Center(
      // left: 5,
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromRGBO(0, 0, 139, 1),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  blurRadius: 25,
                  spreadRadius: 10)
            ]),
        // color: Color.fromRGBO(color[0], color[1], color[2], 1),
        child: TextButton(onPressed: () {}, child: Text(labelIn)),
      ),
    );
  }

  Widget _alertBox(String warning) {
    return AlertDialog(
      title: const Text("Alert"),
      content: Text(warning),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {},
          child: const Text("Yes"),
        )
      ],
    );
  }
}
