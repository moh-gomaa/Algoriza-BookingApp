import 'package:booking_app/features/login/login_screen.dart';
import 'package:booking_app/resources/buttonkey/button.dart';
import 'package:booking_app/resources/constants/constants.dart';
import 'package:flutter/material.dart';

class SiginScreen extends StatelessWidget {
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign up',
                  style: TextStyle(
                      fontSize: 40,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w500,
                      fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'First name',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF8b8b98),
                      fontFamily: lang == "ar" ? "fontAr" : "fontEn"),
                ),
                TextFormField(
                  controller: firstName,
                  keyboardType: TextInputType.name,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'First Name must be not be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter first name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Last name',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF8b8b98),
                      fontFamily: lang == "ar" ? "fontAr" : "fontEn"),
                ),
                TextFormField(
                  controller: lastName,
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Last Name must be not be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Last name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Your Email',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF8b8b98),
                      fontFamily: lang == "ar" ? "fontAr" : "fontEn"),
                ),
                TextFormField(
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
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
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
                  height: 15,
                ),
                ButtonKey(
                  function: () {
                    Navigator.pushNamed(context, '/login');
                    if (formKey.currentState!.validate())
                      print(emailController.text);
                    print(passwordController.text);
                  },
                  buttonText: 'Sign up',
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'By Signing up,you agreed with our terms \n of  Services and privacy policy',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.teal),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account ? ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF8b8b98),
                          fontFamily: lang == "ar" ? "fontAr" : "fontEn"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF8b8b98),
                            fontFamily: lang == "ar" ? "fontAr" : "fontEn"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
