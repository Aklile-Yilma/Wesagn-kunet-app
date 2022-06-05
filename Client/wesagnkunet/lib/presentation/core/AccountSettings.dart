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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Account Information",
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 134, 187, 230)),
              ),
              SizedBox(
                height: 15,
              ),
              _tile("UserName", [0, 0, 139]),
              SizedBox(
                height: 10,
              ),
              _tile("Email", [255, 255, 255]),
              // SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        ),
        Divider(
            height: _deviceHeight * .2,
            thickness: _deviceHeight * .01,
            indent: _deviceWidth * .2,
            endIndent: _deviceWidth * .2,
            color: Color.fromARGB(255, 153, 178, 225)),
        Container(
          child: Column(
            children: [
              const Text(
                "Account",
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              SizedBox(
                height: 12,
              ),
              _tile("ChangePassword", [0, 0, 139]),
              SizedBox(
                height: _deviceHeight * .05,
              ),
              _tile("Signout", [255, 255, 255]),
              SizedBox(
                height: _deviceHeight * .05,
              ),
              _tile("DeleteAccount", [0, 0, 139]),
              SizedBox(
                height: _deviceHeight * .05,
              ),
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
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(15)),
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
