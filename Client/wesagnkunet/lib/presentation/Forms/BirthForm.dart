import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wesagnkunet/application/core/birth_form/bloc/birth_certificate_form_bloc.dart';
import 'package:wesagnkunet/presentation/lib/widgets/DatePickerButton.dart';

class BirthForm extends StatelessWidget {
  final List<TextEditingController> _controllers = [];
  final DatePickerController _datePickerController = DatePickerController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  BirthForm({Key? key}) : super(key: key) {
    for (int i = 0; i < 10; i++) {
      _controllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: _formkey,
        child: BlocProvider<BirthCertificateFormBloc>(
          create: (context) => BirthCertificateFormBloc(),
          child:
              BlocBuilder<BirthCertificateFormBloc, BirthCertificateFormState>(
            builder: (context, state) {
              if (state is SubmittingBirthCertificateFormState) {
                return Center(
                  child: Text("Submitting"),
                );
              }
              return Center(
                  child: SizedBox(
                width: _deviceWidth * 0.6,
                child: ListView(
                  children: [
                    Text(
                      "Birth Certificate Form",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 0, 139, 1),
                      ),
                    ),
                    _textField("Child's first name", _controllers[0]),
                    _padding(),
                    _textField("Child's middle name", _controllers[1]),
                    _padding(),
                    _textField("Child's last name", _controllers[2]),
                    _padding(),
                    _textField("Father's first name", _controllers[3]),
                    _padding(),
                    _textField("Father's middle name", _controllers[4]),
                    _padding(),
                    _textField("Father's last name", _controllers[5]),
                    _padding(),
                    _textField("Mother's first name", _controllers[6]),
                    _padding(),
                    _textField("Mother's middle name", _controllers[7]),
                    _padding(),
                    _textField("Mother's last name", _controllers[8]),
                    _padding(),
                    CustomDropDownWidget(_controllers[9]),
                    _padding(),
                    DatePickerButton(
                        controller: _datePickerController,
                        child: Text("Date of Birth")),
                    _padding(),
                    ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            SubmiteBirthCertificateFormEvent(
                                _controllers[0].text,
                                _controllers[1].text,
                                _controllers[2].text,
                                _controllers[3].text,
                                _controllers[4].text,
                                _controllers[5].text,
                                _controllers[6].text,
                                _controllers[7].text,
                                _controllers[8].text,
                                _datePickerController.date);
                          }

                          if (state is SubmittingBirthCertificateFormState) {
                            CircularProgressIndicator.adaptive();
                          }
                          if (state is SubmittedBirthCertificateFormState) {
                            Center(
                              child: Text(
                                  "Successfully Submitted your form. Waiting for verification"),
                            );
                            return;
                          }
                          if (state is FailedToSubmitForm) {
                            Center(
                              child: Text(
                                "Your form seems to contain errors. Please review it.",
                                style: TextStyle(color: Colors.red),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(fontSize: 20),
                        )),
                    _padding(),
                  ],
                ),
              ));
            },
          ),
        ),
      ),
    );
  }

  TextFormField _textField(String labelIn, TextEditingController controllerIn) {
    return TextFormField(
      controller: controllerIn,
      decoration: InputDecoration(
        labelText: labelIn,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please fill this field";
        }
        return null;
      },
    );
  }

  Padding _padding() {
    return Padding(padding: EdgeInsets.only(top: 20));
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
