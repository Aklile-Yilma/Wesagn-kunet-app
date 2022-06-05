import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui';

import 'package:wesagnkunet/application/auth/SignupBloc.dart';
import 'package:wesagnkunet/infrastructure/auth/providers.dart';
import 'package:wesagnkunet/presentation/lib/widgets/DatePickerButton.dart';

class SignUpPage extends StatelessWidget {
  final int fieldsLen = 11;
  final List<TextEditingController> _controllers = [];
  final DatePickerController _datePickerController = DatePickerController();

  SignUpPage({Key? key}) : super(key: key) {
    for (int i = 0; i < fieldsLen; i++) {
      _controllers.add(TextEditingController());
    }
  }

  Padding _padding() {
    return Padding(padding: EdgeInsets.only(top: 20));
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = window.physicalSize.width/window.devicePixelRatio;
    double _deviceHeight = window.physicalSize.height/window.devicePixelRatio;

    return Scaffold(
        body: BlocProvider<SignupBloc>(
            create: (context) =>
                SignupBloc(AuthInfrastractureProvider.provideAuthRepository()),
            child:
                BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
              if (state.status == SignupStatus.done) {
                WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                  context.go("/core");
                });
              }

              return Form(
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
                        Builder(
                          builder: (context) {
                            if (state.error) {
                              return const Text(
                                "You're form contains error. Please review it.",
                                style: TextStyle(color: Colors.red),
                              );
                            }
                            return SizedBox.shrink();
                          },
                        ),
                        _padding(),
                        TextFormField(
                          controller: _controllers[0],
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
                          controller: _controllers[1],
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
                          controller: _controllers[2],
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
                          controller: _controllers[3],
                          decoration:
                              InputDecoration(labelText: "Email address"),
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
                        CustomDropDownWidget(_controllers[4]),
                        _padding(),
                        TextFormField(
                          controller: _controllers[5],
                          decoration: InputDecoration(labelText: "Blood_Type"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Blood type";
                            }
                            return null;
                          },
                        ),
                        _padding(),
                        DatePickerButton(
                            controller: _datePickerController,
                            child: Text("Date of Birth")),
                        _padding(),
                        TextFormField(
                          controller: _controllers[6],
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
                          controller: _controllers[7],
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
                          controller: _controllers[8],
                          decoration:
                              InputDecoration(labelText: "Phone Number"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter Blood type";
                            }
                            if (!RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                .hasMatch(value)) {
                              return "Invalid Phone number";
                            }
                            return null;
                          },
                        ),
                        _padding(),
                        TextFormField(
                          controller: _controllers[9],
                          decoration: InputDecoration(
                            labelText: "Password",
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter password";
                            }
                            return null;
                          },
                        ),
                        _padding(),
                        TextFormField(
                          controller: _controllers[10],
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter password";
                            }
                            if (_controllers[9] != _controllers[10]) {
                              return "Password doesn't match";
                            }

                            return null;
                          },
                        ),
                        _padding(),
                        TextButton(
                          onPressed: () {
                            if (state.status == SignupStatus.loading) {
                              return;
                            }
                            context.read<SignupBloc>().add(SubmitSignupForm(
                                _controllers[0].text,
                                _controllers[1].text,
                                _controllers[2].text,
                                _controllers[3].text,
                                _controllers[4].text,
                                _controllers[5].text,
                                _datePickerController.date,
                                _controllers[6].text,
                                _controllers[7].text,
                                _controllers[8].text,
                                _controllers[9].text));
                          },
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(255, 255, 255, 1)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromRGBO(0, 0, 149, 1)),
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.only(
                                right: _deviceWidth * 0.05,
                                left: _deviceWidth * 0.05,
                                bottom: _deviceWidth * 0.05,
                                top: _deviceWidth * 0.05,
                              ))),
                          child: Builder(builder: (context) {
                            if (state.status == SignupStatus.loading) {
                              return CircularProgressIndicator();
                            }

                            return Text(
                              "Sign up",
                              style: TextStyle(fontSize: 15),
                            );
                          }),
                        ),
                        _padding(),
                        Center(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Already have an account?",
                                  style: TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.go("/auth/login");
                                    })
                            ]),
                          ),
                        ),
                        _padding()
                      ],
                    ),
                  ),
                ),
              );
            })));
  }
}

class CustomDropDownWidget extends StatefulWidget {
  TextEditingController controller;

  CustomDropDownWidget(this.controller, {Key? key}) : super(key: key);

  @override
  State<CustomDropDownWidget> createState() =>
      _CustomDropDownWidgetState(controller);
}

class _CustomDropDownWidgetState extends State<CustomDropDownWidget> {
  TextEditingController controller;

  final items = ['MALE', 'FEMALE'];

  _CustomDropDownWidgetState(this.controller) {
    controller.text = items[0];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: items.map((e) {
        return DropdownMenuItem(value: e, child: Text(e));
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          if (newValue != null) {
            controller.text = newValue;
          }
        });
      },
      value: controller.text,
    );
  }
}
