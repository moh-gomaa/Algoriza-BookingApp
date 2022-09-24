import 'package:booking_app/resources/constants/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

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
                  'Login',
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
                  'Your Email',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 14,
                      color:  Color(0xFF8b8b98),
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
                    labelText:  'Eg.example@gmail.com',
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white
                      ),
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
                      color:  Color(0xFF8b8b98),
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
                // ButtonKey(
                //   text: 'LOGIN',
                //   background: Colors.teal,
                //   textColor: Colors.white,
                //   function: () {
                //     if (formKey.currentState!.validate())
                //       print(emailController.text);
                //     print(passwordController.text);
                //   },
                // ),

              SizedBox(
               height: 10,
                 ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot your Password  ?  ',
                      textAlign:TextAlign.center,
                      style: TextStyle(color: Colors.teal),
                    ),
                    // TextButton(
                    //   onPressed: () {
                    //     navigateTo(context, SigninScreen());
                    //   },
                    //   child: Text(
                    //     'Login',
                    //     style: TextStyle(color: Colors.teal),
                    //   ),
                    // ),
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
