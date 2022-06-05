import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wesagnkunet/application/core/marriage_certificate_form_bloc.dart';
import 'package:wesagnkunet/presentation/core/widgets/BottomNavigation.dart';
import 'package:wesagnkunet/presentation/lib/widgets/DatePickerButton.dart';
import 'dart:ui';


class MarriageForm extends StatelessWidget {
  
  
  List<TextEditingController> _controllers = [];
  DatePickerController _datePickerController = DatePickerController();

  MarriageForm({Key? key}) : super(key: key){

    for(int i=0; i<6; i++){
      _controllers.add(TextEditingController());
    }

  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = window.physicalSize.width/window.devicePixelRatio;
    double _deviceHeight = window.physicalSize.height/window.devicePixelRatio;
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: _deviceWidth * 0.6,
          height: _deviceHeight,
          child: BlocProvider<MarriageCertificateFormBloc>(

            create: (context) => MarriageCertificateFormBloc(),
            child: BlocBuilder<MarriageCertificateFormBloc, MarriageCertificateFormState>(
              builder: (context, state) {

                if(state.status == MarriageCertificateFormStatus.done){
                  
                  WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                              "Certificate created successfully. Waiting for verification from admin",
                              style: TextStyle(
                                color: Colors.green
                              ),
                            ),
                      )
                    );

                    context.go("/core");            

                  });

                }

                return Form(
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

                          Builder(
                            builder: (_) {

                              if(state.error){
                                return const Text(
                                          "Your form seems to contain errors. Please review it.",
                                          style: TextStyle(
                                              color: Colors.red
                                          ),
                                         );
                              }

                              return SizedBox.shrink();

                            }
                          ),


                          _textField("Wife's First Name", _controllers[0]),
                          _textField("Wife's Middle Name", _controllers[1]),
                          _textField("Wife's Last Name", _controllers[2]),
                          _textField("Husbands's First Name", _controllers[3]),
                          _textField("Husbands's Middle Name", _controllers[4]),
                          _textField("Husbands's Last Name", _controllers[5]),
                          DatePickerButton(controller: _datePickerController, child: Text("Date of Marriage")),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              key: Key("elevButton"),
                              style: ElevatedButton.styleFrom(
                                primary: const Color.fromRGBO(0, 0, 139, 1),
                              ),
                              onPressed: () {

                                if(state.status == MarriageCertificateFormStatus.loading){
                                  return;
                                }

                                if (_formkey.currentState!.validate()) {
                                  context.read<MarriageCertificateFormBloc>().add(
                                    SubmitForm(
                                      _controllers[0].text,
                                      _controllers[1].text,
                                      _controllers[2].text,
                                      _controllers[3].text,
                                      _controllers[4].text,
                                      _controllers[5].text,
                                      _datePickerController.date
                                    )
                                  );
                                }
                              },
                              child: Builder(
                                builder: (context) {
                                  if(state.status == MarriageCertificateFormStatus.loading){
                                    return CircularProgressIndicator();
                                  }

                                  return const Text(
                                    'Submit',
                                    style: TextStyle(fontSize: 20),
                                  );
                                }
                              ),
                            ),
                          ),
                        ]),
                  );
              }
            )
          )
        )
      ),
      bottomNavigationBar: const CoreBottomNavigation(),
    );
  }

  Widget _textField(String labelIn, TextEditingController controller) {
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
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), labelText: labelIn),
    );
  }
}