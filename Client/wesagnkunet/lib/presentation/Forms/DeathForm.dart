import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wesagnkunet/application/core/death_form/bloc/death_certificate_form_bloc.dart';
import 'package:wesagnkunet/presentation/lib/widgets/DatePickerButton.dart';

class DeathForm extends StatelessWidget {
  final List<TextEditingController> _controllers = [];
  final DatePickerController _datePickerController = DatePickerController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  DeathForm({Key? key}) : super(key: key) {
    for (int i = 0; i < 10; i++) {
      _controllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocProvider(
        create: (context) => DeathCertificateFormBloc(),
        child: Form(
          key: _formkey,
          child: Center(
              child: SizedBox(
            width: _deviceWidth * 0.6,
            child: BlocBuilder<DeathCertificateFormBloc,
                DeathCertificateFormState>(
              builder: (context, state) {
                if (state is FailedSubmittingFormState) {
                  return Center(
                    child: Text(
                        "Your form seems to contain errors. Please review it."),
                  );
                }
                return ListView(
                  children: [
                    Text(
                      "Death Certificate Form",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 0, 139, 1),
                      ),
                    ),
                    _textField("Deceased first name", _controllers[0]),
                    _padding(),
                    _textField("Deceased middle name", _controllers[1]),
                    _padding(),
                    _textField("Deceased last name", _controllers[2]),
                    _padding(),
                    DatePickerButton(
                        controller: _datePickerController,
                        child: Text("Date of Birth")),
                    _padding(),
                    _textField("title", _controllers[3]),
                    _padding(),
                    _textField("Country", _controllers[4]),
                    _padding(),
                    _textField("Nationality", _controllers[5]),
                    _padding(),
                    _textField("City", _controllers[6]),
                    _padding(),
                    _textField("subcity", _controllers[7]),
                    _padding(),
                    _textField("woreda", _controllers[8]),
                    _padding(),
                    _textField("house number", _controllers[8]),
                    _padding(),
                    _textField("", _controllers[8]),
                    _padding(),
                    DatePickerButton(
                        controller: _datePickerController,
                        child: Text("Date of Birth")),
                    _padding(),
                    ElevatedButton(
                        onPressed: () {
                          if (state is SubmittingDeathCerificateFormState) {
                            return;
                          }
                          if (_formkey.currentState!.validate()) {
                            context.read<DeathCertificateFormBloc>().add(
                                SubmitDeathCertificateFormEvent(
                                    _controllers[0].text,
                                    _controllers[1].text,
                                    _controllers[2].text,
                                    _controllers[3].text,
                                    _datePickerController.date,
                                    _datePickerController.date,
                                    _controllers[4].text,
                                    _controllers[5].text,
                                    _controllers[6].text,
                                    _controllers[7].text,
                                    _controllers[8].text,
                                    _controllers[9].text));
                          }

                          if (state is SubmittingDeathCerificateFormState) {
                            CircularProgressIndicator.adaptive();
                          }
                          if (state is SubmittedDeathCertificateFormState) {
                            Center(
                              child: Text(
                                  "Your form has been submitted successfully.Waiting for verification"),
                            );
                          }
                          if (state is FailedSubmittingFormState) {
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
                );
              },
            ),
          )),
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
  final TextEditingController controller;

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
