import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wesagnkunet/application/core/settings_bloc.dart';
import 'package:wesagnkunet/presentation/core/FrameForForms.dart';
import 'package:wesagnkunet/presentation/core/widgets/BottomNavigation.dart';
import 'dart:ui';

class Accounts extends StatelessWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = window.physicalSize.width/window.devicePixelRatio;
    double _deviceHeight = window.physicalSize.height/window.devicePixelRatio;
    return Scaffold(
        body: BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc()..add(InitEvent()),

          child: BlocBuilder<SettingsBloc, SettingsState>(
            
            builder: (context, state){

                if(state.status == SettingStatus.loading){
                  return CircularProgressIndicator();
                }

                if(state.status == SettingStatus.signedout){
                  
                  WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                    context.go("/auth");
                  });
                  

                  return SizedBox.shrink();

                }


                return ListView(
                      children: [
                  
                  Container(
                    color: Color.fromARGB(200, 200, 200, 200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 0, 139, 1),
                            borderRadius: BorderRadius.circular(100.0)
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "${state.client!.firstName[0]} ${state.client!.lastName[0]}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "${state.client!.firstName} ${state.client!.lastName}",
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(state.client!.user.email),
                         // SizedBox(
                        //   height: 20,
                        // ),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        
                        SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          height: _deviceHeight * .05,
                        ),

                        _tile("Signout", [255, 255, 255], (){
                          context.read<SettingsBloc>().add(SignoutEvent());
                        }),
                        SizedBox(
                          height: _deviceHeight * .05,
                        ),
                        SizedBox(
                          height: _deviceHeight * .05,
                        ),
                      ],
                    ),
                  ),
                      ]);
            }
              ),
          ),
          bottomNavigationBar: CoreBottomNavigation()
        );
  }

  Widget _tile(String labelIn, List color, onPressed) {
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
        child: TextButton(onPressed: onPressed, child: Text(labelIn, style: TextStyle(color: Colors.white),)),
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
