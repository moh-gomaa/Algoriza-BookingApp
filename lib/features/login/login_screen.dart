import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/features/login/bloc/login_cubit.dart';

import 'package:booking_app/resources/buttonkey/button.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushNamed(context, '/main');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 40,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w500,
                            fontFamily:
                                lang == "ar" ? "fontArBold" : "fontEnBold"),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text('lang_txt'.tr(context),
                          textAlign: TextAlign.start,
                          style: OwnTheme.normalTextStyle(lang: lang)
                              .colorChange(color: 'gray')),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Email must be not be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Eg.example@gmail.com',
                          prefixIcon: Icon(
                            Icons.email,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Password',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF8b8b98),
                            fontFamily: lang == "ar" ? "fontAr" : "fontEn"),
                      ),
                      TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Password must be not be empty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.teal,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/password');
                            },
                            child: Text(
                              'Forgot your Password ?  ',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.teal),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ButtonKey(
                        isLoading: (state is LoginLoadingState),
                        buttonText: 'LOGIN',
                        function: () {
                          if (formKey.currentState!.validate()) {
                            LoginCubit.get(context).login(
                              email: emailController.text,
                              pass: passwordController.text,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
