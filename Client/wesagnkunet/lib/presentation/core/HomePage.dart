import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wesagnkunet/application/core/home_bloc.dart';
import 'package:wesagnkunet/domain/core/marriage_certificate.dart';
import 'package:wesagnkunet/presentation/core/widgets/BottomNavigation.dart';
import 'dart:ui';


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
    final double _deviceWidth = window.physicalSize.width/window.devicePixelRatio;
    final double _deviceHeight = window.physicalSize.height/window.devicePixelRatio;
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      SizedBox(height: 30),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: _text("Welcome", [0, 0, 0], 30)),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: _text("${state.client!.firstName} ${state.client!.middleName}", [0, 0, 0], 20)),
                      const SizedBox(height: 50),
                      Stack(
                        children:[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                                "Your Certificates",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17
                                ),
                              ),
                          ),
                            
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: (){
                                  context.go("/core/certificates");
                                },
                                child: const Text(
                                  "more",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            )
                        ] 
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.certificates!.length,
                          itemBuilder: (context, index) {
                            
                            MarriageCertificate certificate = state.certificates![index];

                            return SizedBox(
                              width:190,
                              child: GestureDetector(
                                onTap: (() {
                                  context.go("/core/certificates/marriage", extra: state.certificates![index]);
                                }),
                                child: Card(
                                  child: Column(
                                    children: [
                                      Image.asset("assets/images/marriage.webp"),
                                      const SizedBox(height: 5),
                                      const Text(
                                        "Marriage Certificate",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold
                                        )
                                      ),
                                      const SizedBox(height: 5),
                                      Builder(builder: ((context) {
                    
                                        if(certificate.detail.issueDate == null){
                                          return const Text(
                                            "Not Approved Yet",
                                            style: TextStyle(
                                              color: Colors.red
                                            ),
                                          );
                                        }

                                        return Text(
                                          certificate.detail.issueDate.toString().split(" ")[0],
                                          style: const TextStyle(
                                            fontSize: 15,
                                          ),
                                        );


                                      }))
                                    ]
                                  ),
                                ),
                              ),
                            );
                          }),
                      ),
                      SizedBox(height: 70),
                      const Text(
                        "Create New",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Color.fromARGB(20, 0, 0, 0))
                          ]
                        ),
                        width: 200,
                        child: GestureDetector(
                          onTap: (() {
                            context.go("/core/certificates/new/marriage");
                          }),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Image.asset("assets/images/home_page/marriage.png"),
                                  const SizedBox(height: 20),
                                  const Text(
                                    "Marriage Certificate",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    )
                                  ),
                                ]
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
              
                        
                    ]
                  ),
                ),
              ));
          })
      ),
      bottomNavigationBar: CoreBottomNavigation(1),

    );
  }
}
