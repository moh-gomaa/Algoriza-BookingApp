import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/utils/extensions/layout_extensions.dart';
import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/core/utils/widgets/custom_app_bar.dart';
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(
                  leadingWidget: BackIconAppBar(
                    lang: lang,
                  ),
                ).safeArea(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: space1, right: side, left: side, bottom: bottom),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login_txt'.tr(context),
                          style: OwnTheme.titleBoldTextStyle(lang: lang)
                              .colorChange(color: 'white'),
                        ),
                        SizedBox(
                          height: space2,
                        ),
                        Text(
                          'email_title_txt'.tr(context),
                          style: OwnTheme.normalTextStyle(lang: lang)
                              .colorChange(color: 'gray'),
                        ),
                        SizedBox(
                          height: space0,
                        ),
                        TextFormField(
                          style: OwnTheme.normalBoldTextStyle(lang: lang)
                              .colorChange(color: 'white'),
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
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            filled: true,
                            fillColor: OwnTheme.colorPalette['bgGray'],
                            labelText: 'Eg.example@gmail.com',
                            prefixIcon: Icon(
                              Icons.email,
                              color: OwnTheme.colorPalette['gray'],
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: OwnTheme.colorPalette['primary']!,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(round),
                            ),
                            labelStyle: OwnTheme.normalBoldTextStyle(lang: lang)
                                .colorChange(color: 'gray'),
                          ),
                        ),
                        SizedBox(
                          height: space1,
                        ),
                        Text(
                          'password_txt'.tr(context),
                          style: OwnTheme.normalTextStyle(lang: lang)
                              .colorChange(color: 'gray'),
                        ),
                        SizedBox(
                          height: space0,
                        ),
                        TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          style: OwnTheme.normalBoldTextStyle(lang: lang)
                              .colorChange(color: 'white'),
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: LoginCubit.get(context).isPassword,
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              filled: true,
                              fillColor: OwnTheme.colorPalette['bgGray'],
                              labelText: 'Box_Password_Text'.tr(context),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: OwnTheme.colorPalette['gray'],
                              ),

                              suffixIcon: GestureDetector(
                                onTap: (){
                                  LoginCubit.get(context).ChangePassword();
                                },
                                child: Icon(
                                  LoginCubit.get(context).suffix,                                color: OwnTheme.colorPalette['gray'],
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: OwnTheme.colorPalette['primary']!,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(round),
                              ),
                              labelStyle:
                                  OwnTheme.normalBoldTextStyle(lang: lang)
                                      .colorChange(color: 'gray')),
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
                        ButtonKey(
                          //Button_Login
                          buttonText: 'Button_Login'.tr(context),
                          textColor: OwnTheme.colorPalette['white'],
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
              ],
            ),
          ),
        );
      },
    );
  }
}
