import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  Padding _padding() {
    return Padding(padding: EdgeInsets.only(top: 20));
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Form(
      key: _formkey,
      child: Center(
        child: SizedBox(
          width: _deviceWidth * 0.6,
          child: ListView(
            children: [
              _padding(),
              Text(
                "SIGN UP",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 0, 139, 1),
                ),
              ),
              _padding(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "First Name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please fill this field";
                  }
                  return null;
                },
              ),
              _padding(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Middle Name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please fill this field";
                  }
                  return null;
                },
              ),
              _padding(),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Last Name",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please fill this field";
                  }
                  return null;
                },
              ),
              _padding(),
              TextFormField(
                decoration: InputDecoration(labelText: "Email address"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter email";
                  }
                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
              ),
              _padding(),
              CustomDropDownWidget(),
              _padding(),
              TextFormField(
                decoration: InputDecoration(labelText: "Blood_Type"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Blood type";
                  }
                  return null;
                },
              ),
              _padding(),
              TextFormField(
                decoration: InputDecoration(labelText: "Date of Birth"),
              ),
              _padding(),
              TextFormField(
                decoration: InputDecoration(labelText: "City"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Blood type";
                  }
                  return null;
                },
              ),
              _padding(),
              TextFormField(
                decoration: InputDecoration(labelText: "Country"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Blood type";
                  }
                  return null;
                },
              ),
              _padding(),
              TextFormField(
                decoration: InputDecoration(labelText: "Phone Number"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Blood type";
                  }
                  if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(value)) {
                    return "Invalid Phone number";
                  }
                  return null;
                },
              ),
              _padding(),
              TextFormField(
                controller: _pass,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password";
                  }
                  return null;
                },
              ),
              _padding(),
              TextFormField(
                controller: _confirmPass,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password";
                  }
                  if (_pass != _confirmPass) {
                    return "Password doesn't match";
                  }

                  return null;
                },
              ),
              _padding(),
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
          ),
        ),
      ),
    ));
  }
}

class CustomDropDownWidget extends StatefulWidget {
  CustomDropDownWidget({Key? key}) : super(key: key);

  @override
  State<CustomDropDownWidget> createState() => _CustomDropDownWidgetState();
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    String dropDownValue = 'MALE';
    var items = ['MALE', 'FEMALE'];
    return DropdownButton(
      items: items.map((e) {
        return DropdownMenuItem(value: e, child: Text(e));
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          var dropdownvalue = newValue;
        });
      },
      value: dropDownValue,
    );
  }
}
