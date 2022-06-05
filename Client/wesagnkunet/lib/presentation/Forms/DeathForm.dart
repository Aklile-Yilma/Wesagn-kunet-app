import 'package:flutter/material.dart';
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
      body: Form(
        key: _formkey,
        child: Center(
            child: SizedBox(
          width: _deviceWidth * 0.6,
          child: ListView(
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
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 20),
                  )),
              _padding(),
            ],
          ),
        )),
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
