import 'package:booking_app/core/localization/setup/app_localization.dart';
import 'package:booking_app/core/utils/extensions/layout_extensions.dart';
import 'package:booking_app/core/utils/extensions/theme_extensions.dart';
import 'package:booking_app/core/utils/widgets/custom_app_bar.dart';
import 'package:booking_app/data/models/user_model.dart';
import 'package:booking_app/features/login/login_screen.dart';
import 'package:booking_app/features/register/bloc/register_cubit.dart';
import 'package:booking_app/features/register/bloc/register_state.dart';
import 'package:booking_app/resources/buttonkey/button.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:booking_app/resources/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  UserModel user = UserModel();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          Navigator.pushNamed(context, '/main');
        }
      },
      builder: (context, state) {
        return Scaffold(
          // backgroundColor: Color(0xFFFFFFFF),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomAppBar(
                    leadingWidget: BackIconAppBar(
                      lang: lang,
                    ),
                  ).safeArea(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'sign_up_txt'.tr(context),
                        style: OwnTheme.hugeBoldTextStyle(lang: lang)
                            .colorChange(color: 'white'),
                      ),
                      SizedBox(
                        height: space2,
                      ),
                      Text(
                        'first_name_txt'.tr(context),
                        style: OwnTheme.normalTextStyle(lang: lang)
                            .colorChange(color: 'gray'),
                      ),
                      SizedBox(
                        height: space0,
                      ),
                      TextFormField(
                        style: OwnTheme.normalBoldTextStyle(lang: lang)
                            .colorChange(color: 'white'),
                        controller: firstNameController,
                        keyboardType: TextInputType.name,
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        onChanged: (String value) {
                          print(value);
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'first_table_txt'.tr(context);
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: OwnTheme.colorPalette['bgGray'],
                          labelText: 'Box_First_Text'.tr(context),
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
                                .colorChange(color: 'gray')
                        ),
                      ),
                      SizedBox(
                        height: space0,
                      ),
                      Text(
                        'last_name_txt'.tr(context),
                        style: OwnTheme.normalTextStyle(lang: lang)
                            .colorChange(color: 'gray'),
                      ),
                      SizedBox(
                        height: space0,
                      ),
                      TextFormField(
                        style: OwnTheme.normalBoldTextStyle(lang: lang)
                            .colorChange(color: 'white'),
                        controller: lastNameController,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        onChanged: (String value) {
                          print(value);
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'last_table_txt'.tr(context);
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          fillColor: OwnTheme.colorPalette['bgGray'],
                          labelText: 'Box_Last_Text'.tr(context),
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
                                .colorChange(color: 'gray')
                        ),

                      ),
                      SizedBox(
                        height: space0,
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
                        height: space0,
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
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            filled: true,
                            fillColor: OwnTheme.colorPalette['bgGray'],
                            labelText: 'Box_Password_Text'.tr(context),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: OwnTheme.colorPalette['gray'],
                            ),
                            suffixIcon: Icon(
                              Icons.remove_red_eye,
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
                                .colorChange(color: 'gray')),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ButtonKey(
                      function: () {
                        {
                          if (formKey.currentState!.validate()) {
                            FocusScope.of(context).requestFocus(new FocusNode());

                            user = UserModel(
                                name: firstNameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                passwordConfirmation: passwordController.text);
                            RegisterCubit.get(context).register(obj: user);
                          }
                        }
                      },
                      buttonText: 'Button_Register'.tr(context),
                      textColor: OwnTheme.colorPalette['gray'],
                      isLoading: (state is RegisterLoadingState),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Register_title1_txt'.tr(context),
                          style: OwnTheme.normalTextStyle(lang: lang)
                              .colorChange(color: 'gray'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'first_text'.tr(context),
                          textAlign: TextAlign.center,
                          style: OwnTheme.prNormalTextStyle(lang: lang)
                              .colorChange(color: 'gray'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: Text(
                            'last_text'.tr(context),
                            style: OwnTheme.prNormalTextStyle(lang: lang)
                                .colorChange(color: 'gray'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                      SizedBox(
                        height: 30,
                      ),
                      ButtonKey(
                        function: () {
                          {
                            if (formKey.currentState!.validate()) {
                              user = UserModel(
                                  name: firstNameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  passwordConfirmation: passwordController.text);
                              RegisterCubit.get(context).register(obj: user);
                            }
                          }
                        },
                        buttonText: 'Button_Register'.tr(context),
                        textColor: OwnTheme.colorPalette['white'],
                        isLoading: (state is RegisterLoadingState),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Register_title1_txt'.tr(context),
                            style: OwnTheme.normalTextStyle(lang: lang)
                                .colorChange(color: 'gray'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'first_text'.tr(context),
                            textAlign: TextAlign.center,
                            style: OwnTheme.prNormalTextStyle(lang: lang)
                                .colorChange(color: 'gray'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text(
                              'last_text'.tr(context),
                              style: OwnTheme.prNormalTextStyle(lang: lang)
                                  .colorChange(color: 'gray'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ).wholePadding(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
