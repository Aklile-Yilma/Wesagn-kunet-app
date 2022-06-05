import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wesagnkunet/application/auth/login/bloc.dart';
import 'package:wesagnkunet/application/auth/providers.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    // double _deviceWidth = window.physicalSize.width/window.devicePixelRatio;
    // double _deviceHeight = window.physicalSize.height/window.devicePixelRatio;

    double _deviceWidth = window.physicalSize.width/window.devicePixelRatio;
    double _deviceHeight = window.physicalSize.height/window.devicePixelRatio;
    

    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      log("Building for state. Status: ${state.status}");
    log("Device Size: ($_deviceWidth, $_deviceHeight)");

      if (state.status == LoginStatus.loggedIn) {
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
          log("Popping back to LaunchPage");
          context.go("/core");
        });
      }

      return Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "LOGIN",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 0, 139, 1)),
            ),
            Builder(
              builder: (context) {
                if (state.apiException != null) {
                  return const Text(
                    "Incorrect Username of password",
                    style: TextStyle(color: Colors.red),
                  );
                }
                return SizedBox.shrink();
              },
            ),
            TextFormField(
              controller: usernameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter email";
                }
                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  return "Please enter a valid email address";
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'user@example.com',
                hintText: 'Enter your Email',
              ),
            ),
            TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                )),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromRGBO(0, 0, 139, 1),
              ),
              onPressed: () {
                if (state.status != LoginStatus.none) {
                  return;
                }

                log("Logging in username: ${usernameController.text}, password: ${passwordController.text}");

                if (_formkey.currentState!.validate()) {
                  context.read<LoginBloc>().add(SubmitLogin(
                      usernameController.text, passwordController.text));
                }
              },
              child: Builder(builder: (context) {
                log("State Status: ${state.status}");
                if (state.status == LoginStatus.loggingIn) {
                  return const CircularProgressIndicator();
                }
                return const Text(
                  'LogIn',
                  style: TextStyle(fontSize: 20),
                );
              }),
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Don't have an account yet? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                        text: 'Sign Up',
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.go("/auth/signup");
                          }),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: _deviceHeight * 0.1),
              child: Image.asset(
                "assets/images/logo-primary.png",
                width: _deviceWidth * 0.2,
                height: _deviceWidth * 0.2,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double _deviceWidth = window.physicalSize.width/window.devicePixelRatio;
    // double _deviceHeight = window.physicalSize.height/window.devicePixelRatio;

    double _deviceWidth = window.physicalSize.width/window.devicePixelRatio;
    double _deviceHeight = window.physicalSize.height/window.devicePixelRatio;
    log("Device Size: ($_deviceWidth, $_deviceHeight)");
    
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: _deviceWidth * 0.5,
          height: _deviceHeight * 0.8,
          child: Center(
            child: BlocProvider<LoginBloc>(
              create: (_) => AuthApplicationProviders.provideLoginBloc(),
              child: LoginForm(),
            ),
          ),
        ),
      ),
    );
  }
}
