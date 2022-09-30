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
          backgroundColor: Color(0xFF1A1A1A),
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
                        'Login_txt'.tr(context),
                        style: OwnTheme.hugeBoldTextStyle(lang: lang)
                            .colorChange(color: 'white'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'email_title_txt'.tr(context),
                        style: OwnTheme.normalTextStyle(lang: lang)
                            .colorChange(color: 'gray'),
                      ),
                      TextFormField(
                        style: OwnTheme.normalTextStyle(lang: lang)
                            .colorChange(color: 'gray'),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        onChanged: (String value) {
                          print(value);
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Email_Table'.tr(context);
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
                        'password_txt'.tr(context),
                        style: OwnTheme.normalTextStyle(lang: lang)
                            .colorChange(color: 'gray'),
                      ),
                      TextFormField(
                        style: OwnTheme.normalTextStyle(lang: lang)
                            .colorChange(color: 'white'),
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        onChanged: (String value) {
                          print(value);
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Password_Table'.tr(context);
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: OwnTheme.colorPalette['gray'],
                          contentPadding: const EdgeInsets.all(space1),
                          labelText: 'Box_Password_Text'.tr(context),
                          prefixIcon: Icon(
                            Icons.lock,
                          ),
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              width: 5,
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
                              'Login_Title '.tr(context),
                              style: OwnTheme.normalTextStyle(lang: lang)
                                  .colorChange(color: 'gray'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ButtonKey(//Button_Login
                        buttonText: 'Button_Login'.tr(context),
                        textColor: OwnTheme.colorPalette['gray'],
                        isLoading: (state is LoginLoadingState),
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
