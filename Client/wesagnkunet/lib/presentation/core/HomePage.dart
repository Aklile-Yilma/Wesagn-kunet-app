import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wesagnkunet/application/core/home_bloc.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _text(String text, List color, double fontsizeIn) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontsizeIn,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(color[0], color[1], color[2], 1)),
    );
  }

  Widget _box(double width, double height, String imagePath, String text) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(244, 226, 198, 1),
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3)),
          BoxShadow(
            color: Colors.white,
            offset: Offset(0, 0),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: width * 0.5, child: Image.asset(imagePath)),
          Text(text)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double _deviceWidth = MediaQuery.of(context).size.width;
    final double _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Wesagn Kunet",
      )),
      body: BlocProvider<HomeBloc>(
        create: (context){
          return HomeBloc()..add(HomeInit());
        },

        child: BlocBuilder<HomeBloc, HomeState>(

          
          builder: (context, state) {

            log("Building For state: ${state.status}");

            if(state.status == HomeStatus.loading){
              return Stack(
                children: const [
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              );
            }

            return SizedBox(
              height: _deviceHeight,
              child: Stack(children: [
                Container(
                  width: _deviceWidth,
                  height: _deviceHeight * 0.3,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(
                      top: _deviceHeight * 0.05, left: _deviceWidth * 0.05),
                  color: const Color.fromRGBO(0, 0, 139, 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: _text("Good Morning", [255, 255, 255], 30)),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: _text("${state.client!.firstName} ${state.client!.middleName}", [255, 255, 255], 20)),
                      ]),
                    ],
                  ),
                ),
                Positioned(
                  top: _deviceHeight * 0.3,
                  child: SizedBox(
                    height: _deviceHeight * 0.7,
                    width: _deviceWidth,
                    child: Image.asset(
                      "assets/images/texture.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    top: _deviceHeight * 0.25,
                    left: _deviceHeight * 0.1,
                    child: GestureDetector(
                      onTap: () {
                        context.go("/forms/birthform");
                      },
                      child: _box(_deviceWidth * 0.3, _deviceHeight * 0.2,
                          "/images/home_page/stork.png", "Birth Certificate"),
                    )),
                Positioned(
                    top: _deviceHeight * 0.25,
                    left: _deviceWidth * 0.6,
                    child: GestureDetector(
                      onTap: () {
                        context.go("/core/certificates/new/marriage");
                      },
                      child: _box(_deviceWidth * 0.3, _deviceHeight * 0.2,
                          "/images/home_page/marriage.png", "Marriage Certificate"),
                    )),
                Positioned(
                    top: _deviceHeight * 0.6,
                    left: _deviceHeight * 0.1,
                    child: GestureDetector(
                      onTap: () {
                        context.go("forms/deathForm");
                      },
                      child: _box(_deviceWidth * 0.3, _deviceHeight * 0.2,
                          "/images/home_page/casket.png", "Death Certificate"),
                    )),
                Builder(
                  builder: (context) {

                    if(!(state.client!.user.isAdmin)){
                      return SizedBox.shrink();
                    }

                    return Positioned(
                        top: _deviceHeight * 0.6,
                        left: _deviceWidth * 0.6,
                        child: GestureDetector(
                          onTap: () {
                            context.go("/auth");
                          },
                          child: _box(_deviceWidth * 0.3, _deviceHeight * 0.2,
                              "/images/home_page/admin.png", "Birth Certificate"),
                        ));
                  }
                ),
              ]),
            );
          }
        ),
      ),
      bottomNavigationBar: _navBar(context, _deviceWidth, _deviceHeight),
    );
  }
}

Widget _navBar(
    BuildContext context, double _deviceWidth, double _deviceHeight) {
  return SizedBox(
    width: _deviceWidth,
    height: _deviceHeight * 0.1,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {
            context.go("/MyAccounts");
          },
          child: Tooltip(
            message: "My Certificates",
            child: Image.asset(
              "/images/certificate_icon.jpg",
              height: 40,
            ),
          ),
        ),
        TextButton(
            onPressed: () {
              context.go("/");
            },
            child: Tooltip(
              message: "Home",
              child: Icon(
                Icons.home,
                color: Colors.blue,
              ),
            )),
        TextButton(
            onPressed: () {
              context.go("/Settings");
            },
            child: Tooltip(
              message: "Settings",
              child: Icon(
                Icons.settings,
                color: Colors.blue,
              ),
            ))
      ],
    ),
  );
}
