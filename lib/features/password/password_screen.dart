// import 'package:booking_app/resources/buttonkey/button.dart';
// import 'package:booking_app/resources/constants/constants.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class ForgetPasswordScreen extends StatefulWidget {
//   const ForgetPasswordScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
// }
//
// class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
//   var emailController = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//
//
//   @override
// void dispose(){
//     emailController.dispose();
//     super.dispose();
//   }
// Future PasswordReset()async{
//   try{
//   await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim(),);
// Utils.showSnackBar('Password Reset Email Sent');
// } on FirebaseAuthException catch(error){
//   print('error');
//   Utils.showSnackBar(error.message);
// }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text('Find Your Account',
//                   style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.w500,
//                       fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold"),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Text('Enter your Email and we will \n Send you a Password rest link',
//               style: TextStyle(
//                   fontSize: 16,
//                   color: Color(0xFF8b8b98),
//                   height: 1.5,
//                   fontFamily: lang == "ar" ? "fontAr" : "fontEn"),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               TextFormField(
//                 controller: emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 onFieldSubmitted: (String value) {
//                   print(value);
//                 },
//                 onChanged: (String value) {
//                   print(value);
//                 },
//                 validator: (String? value) {
//                   if (value!.isEmpty) {
//                     return 'Email must be not be empty';
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Eg.example@gmail.com',
//                   prefixIcon: Icon(
//                     Icons.email,
//                   ),
//                   border: OutlineInputBorder(
//                     borderSide: BorderSide(
//                         color: Colors.white
//                     ),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               ButtonKey(
//                 function: (){},
//                 buttonText: 'Reset Password',
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
