

import 'package:flutter/material.dart';


class DatePickerController{
  DateTime date = DateTime.now();
}


class DatePickerButton extends StatefulWidget{

  Widget child;
  DatePickerController controller;
  ButtonStyle? buttonStyle;
  

  DatePickerButton({Key? key, required this.controller,required this.child, this.buttonStyle}): super(
    key: key, 
  );

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DatePickerState(controller: controller, child: child, buttonStyle: buttonStyle);
  }

}


class _DatePickerState extends State{
  
  DatePickerController controller;
  Widget child;
  ButtonStyle? buttonStyle;

  _DatePickerState({required this.controller,required this.child, this.buttonStyle});
  
  void _showDialog(BuildContext context) async{
    

    final DateTime? selected = await showDatePicker(
                                          context: context, 
                                          initialDate: controller.date,
                                          firstDate: DateTime(1991), 
                                          lastDate: DateTime(2030)
                                        );
    if(selected != null){
      setState(() {
        controller.date = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

     return Row(
       children: [
         TextButton(
            onPressed:(){
              _showDialog(context);
            },
            child: child,
            style: buttonStyle
          ),
          Text(controller.date.toString().split(" ")[0])
       ], 
     );

  }

}
