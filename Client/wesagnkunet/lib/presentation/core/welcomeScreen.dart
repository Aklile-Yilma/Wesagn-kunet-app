import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:wesagnkunet/application/core/launch/bloc.dart';
import 'package:wesagnkunet/presentation/auth/Login.dart';
import 'package:wesagnkunet/presentation/core/HomePage.dart';
import 'package:wesagnkunet/presentation/routes.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _deviceWidth = MediaQuery.of(context).size.width;
    final double _deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: BlocProvider<LaunchBloc>(
          create: (_) { 
            LaunchBloc bloc = LaunchBloc();
            bloc.add(LaunchEvent());
            return bloc;
          },
          child: Stack(children: [
            BlocBuilder<LaunchBloc, LaunchState>(
              builder:(context, state) {
                
                log("Building For State. Status: ${state.status}");

                if(state.status == AuthenticationStatus.authenticated){
                    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) { 
                      context.push('/core');
                    });
                }
                else if(state.status == AuthenticationStatus.unauthenticated){
                     WidgetsBinding.instance!.addPostFrameCallback((timeStamp) { 
                      context.push('/auth');
                    });
                }

                return SizedBox.shrink();
              },
            )
            ,

      Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 40, 100, 190),
                      Color.fromARGB(255, 169, 207, 233),
                      Color.fromARGB(255, 131, 184, 230),
                    ]),
              )
              ),
      Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: _deviceHeight * .2,
              ),
              Center(
                child: Image.asset('/images/cartoon.png')
                // child: Positioned(
                //   // top: _deviceHeight * .3,
                //   // left: _deviceWidth * .4,
                //   child: Image.asset('/images/cartoon.png'),
                // ),
              ),
              SizedBox(
                height: _deviceHeight * .05,
              ),
              Text("wesagn kunet",
                  style: TextStyle(color: Colors.white, fontSize: 20))
            ],
      )
    ])
        )
    );
  }
}
