import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MarriageForm extends StatelessWidget {
  MarriageForm({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: _deviceWidth * 0.6,
          height: _deviceHeight,
          child: Form(
            key: _formkey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Marriage Information",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 0, 139, 1),
                    ),
                  ),
                  _textField("Wife's First Name"),
                  _textField("Wife's Middle Name"),
                  _textField("Wife's Last Name"),
                  _textField("Husbands's First Name"),
                  _textField("Husbands's Middle Name"),
                  _textField("Husbands's Last Name"),
                  _dateField("Date of Marriage"),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      key: Key("elevButton"),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(0, 0, 139, 1),
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          context.go("/");
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Widget _textField(String labelIn) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter text";
        }
        if (double.tryParse(value) != null) {
          return "Wrong Input";
        }
        return null;
      },
      controller: _controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), labelText: labelIn),
    );
  }

  Widget _numField(String labelIn) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter text";
        }
        return null;
      },
      controller: _controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelIn,
      ),
    );
  }

  Widget _dateField(String label) {
    return Column(
      children: [
        Text(label),
        ElevatedButton(
          child: const Text("Pick A Date"),
          onPressed: () {
            //   context: context,
            //   intialDate: DateTime.now(),
            //   firstDate: DateTime(1900),
            //   lastDate: DateTime(2022),
          },
        ),
      ],
    );
  }
}
