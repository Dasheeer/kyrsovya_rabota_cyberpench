// import 'package:flutter/material.dart';
// import 'registrazia.dart';
// import 'main.dart';
//
// class Login extends StatelessWidget {
//   const Login({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           toolbarHeight: 35,
//           flexibleSpace: Container(
//               decoration: BoxDecoration(
//                   image: DecorationImage(image: AssetImage("lib/assets/image/лого/fon1.jpg"),
//                       fit: BoxFit.fill
//                   )
//               )
//           ),
//           bottom: PreferredSize(
//               preferredSize: const Size.fromHeight(4.0),
//               child: Container(
//                 color: Colors.white,
//                 height: 2.0,
//               )),
//
//         ),
//         body: Stack(
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("lib/assets/image/BACKGROUND/Product.png"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Center(
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Color.fromRGBO(16, 68, 80, 1.0),
//                   border: Border.all(color: Color(0xFFFFFFFF), width: 1.5),
//                 ),
//                 height: 360,
//                 margin: const EdgeInsets.symmetric(horizontal: 16),
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
//                 child: Column(
//                   children: [
//                     //ЗАГОЛОВОК
//                     const Text(
//                       "Вход",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 36,
//                         fontWeight: FontWeight.w700,
//                         height: 0,
//                       ),
//                     ),
//
//                     //ОТСТУП
//                     const SizedBox(
//                       height: 16,
//                     ),
//
//                     //ЛОГИН
//                     const TextField(
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                         fontFamily: 'Actay',
//                         fontSize: 20,
//                         color: Colors.white,
//                       ),
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(horizontal: 18),
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Color.fromARGB(255, 255, 255, 255),
//                               width: 1),
//                         ),
//                         hintStyle: TextStyle(
//                           fontFamily: 'Actay',
//                           fontSize: 20,
//                           color: Colors.white,
//                         ),
//                         hintText: "Логин",
//                         hintFadeDuration: Durations.extralong1,
//                       ),
//                     ),
//
//                     //ОТСТУП
//                     const SizedBox(
//                       height: 16,
//                     ),
//
//                     //ПАРОЛЬ
//                     const TextField(
//                       obscureText: true,
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                         fontFamily: 'Actay',
//                         fontSize: 20,
//                         color: Colors.white,
//                       ),
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(horizontal: 18),
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(
//                               color: Color.fromARGB(255, 255, 255, 255),
//                               width: 1),
//                         ),
//                         hintStyle: TextStyle(
//                           fontFamily: 'Actay',
//                           fontSize: 20,
//                           color: Colors.white,
//                         ),
//                         hintText: "Пароль",
//                         hintFadeDuration: Durations.extralong1,
//                       ),
//                     ),
//
//                     //ОТСТУП
//                     const SizedBox(
//                       height: 16,
//                     ),
//
//                     //BUTTON ВХОД
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12)),
//                         padding: const EdgeInsets.symmetric(horizontal: 38),
//                         backgroundColor: const Color.fromARGB(255, 11, 58, 70),
//                       ),
//                       child: const Text(
//                         "Войти",
//                         style: TextStyle(
//                           fontFamily: 'Actay',
//                           fontSize: 20,
//                           color: Colors.white,
//                         ),
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const Mainpage(),
//                           ),
//                         );
//                       },
//                     ),
//
//                     //ОТСТУП
//                     const SizedBox(
//                       height: 16,
//                     ),
//
//                     //BUTTON РЕГИСТРАЦИИ
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         side: const BorderSide(
//                             width: 1,
//                             color: Color.fromARGB(255, 255, 255, 255)),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12)),
//                         padding: const EdgeInsets.symmetric(horizontal: 38),
//                         backgroundColor: const Color.fromARGB(255, 11, 58, 70),
//                       ),
//                       child: const Text(
//                         "Зарегистрироваться",
//                         style: TextStyle(
//                           fontFamily: 'Actay',
//                           fontSize: 20,
//                           color: Colors.white,
//                         ),
//                       ),
//
//
//
//
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// //
// import 'package:email_validator/email_validator.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/registrazia.dart';
// import 'package:flutter_application_1/reset_password_screen.dart';
// import 'package:flutter_application_1/services/snack_bar.dart';
// import 'chat.dart';
// import 'main.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   bool isHiddenPassword = true;
//   TextEditingController emailTextInputController = TextEditingController();
//   TextEditingController passwordTextInputController = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//
//   @override
//   void dispose() {
//     emailTextInputController.dispose();
//     passwordTextInputController.dispose();
//
//     super.dispose();
//   }
//
//   void togglePasswordView() {
//     setState(() {
//       isHiddenPassword = !isHiddenPassword;
//     });
//   }
//
//   Future<void> login() async {
//     final navigator = Navigator.of(context);
//
//     final isValid = formKey.currentState!.validate();
//     if (!isValid) return;
//
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailTextInputController.text.trim(),
//         password: passwordTextInputController.text.trim(),
//       );
//     } on FirebaseAuthException catch (e) {
//       print(e.code);
//
//       if (e.code == 'user-not-found' || e.code == 'wrong-password') {
//         SnackBarService.showSnackBar(
//           context,
//           'Неправильный email или пароль. Повторите попытку',
//           true,
//         );
//         return;
//       } else {
//         SnackBarService.showSnackBar(
//           context,
//           'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
//           true,
//         );
//         return;
//       }
//     }
//
//     Navigator.pushAndRemoveUntil<dynamic>(
//       context,
//       MaterialPageRoute<dynamic>(
//         builder: (BuildContext context) => Mainpage(),
//       ),
//           (route) => false,//if you want to disable back feature set to false
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: const Color.fromARGB(189, 93, 94, 96),
//       appBar: AppBar(
//         toolbarHeight: 40,
//         flexibleSpace: Container(
//             decoration: BoxDecoration(
//                 image: DecorationImage(image: AssetImage("lib/assets/image/лого/fon1.jpg"),
//                     fit: BoxFit.fill
//                 )
//             )
//         ),
//         bottom: PreferredSize(
//             preferredSize: const Size.fromHeight(4.0),
//             child: Container(
//               color: Colors.white,
//               height: 2.5,
//             )),
//         centerTitle: true,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               "  ",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                   fontFamily: 'Actay',
//                   fontWeight: FontWeight.w700,
//                   height: 0,
//                   decoration: TextDecoration.none),
//             ),
//           ],
//         ),
//       ),
//
//       body:Stack(
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("lib/assets/image/BACKGROUND/Product.png"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Center(
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Color.fromRGBO(31, 84, 96, 1.0),
//                   border: Border.all(color: Color(0xFFFFFFFF), width: 1.5),
//                 ),
//                 height: 550,
//                 margin: const EdgeInsets.symmetric(horizontal: 16),
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
//                 child: Column(
//                   children: [
//
//                     const Text(
//                       "Вход",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 30,
//                         fontWeight: FontWeight.w700,
//                         height: 0,
//                       ),
//                     ),
//
//                     const SizedBox(height: 25),
//
//                     TextFormField(
//                       keyboardType: TextInputType.emailAddress,
//                       autocorrect: false,
//                       controller: emailTextInputController,
//                       validator: (email) =>
//                       email != null && !EmailValidator.validate(email)
//                           ? 'Введите правильный Email'
//                           : null,
//                       decoration: const InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(horizontal: 10),
//                         border: OutlineInputBorder(),
//                         hintText: 'Введите Email',
//                         hintStyle: TextStyle(
//                           fontFamily: 'Actay',
//                           fontSize: 16,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(height: 10),
//
//                     TextFormField(
//                       autocorrect: false,
//                       controller: passwordTextInputController,
//                       obscureText: isHiddenPassword,
//                       validator: (value) => value != null && value.length < 6
//                           ? 'Минимум 6 символов'
//                           : null,
//                       autovalidateMode: AutovalidateMode.onUserInteraction,
//                       decoration: const InputDecoration(
//                         contentPadding: EdgeInsets.symmetric(horizontal: 10),
//                         border: OutlineInputBorder(),
//                         hintText: 'Введите пароль',
//                         hintStyle: TextStyle(
//                           fontFamily: 'Actay',
//                           fontSize: 16,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(height: 0),
//
//                     //кнопка сброса пароля
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ResetPasswordScreen(),
//                           ),
//                         );
//                       },
//                       child: const Text('Сбросить пароль',
//                         style: TextStyle(
//                           fontFamily: 'Actay',
//                           fontSize: 13,
//                           color: const Color.fromARGB(255, 255, 255, 255),
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(height: 20),
//
//                     //кнопка входа
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         shape:
//                         RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//                         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//                         backgroundColor: const Color.fromARGB(255, 10, 58, 69),
//                       ),
//                       child:
//                       const Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             "Войти",
//                             style: TextStyle(
//                               fontFamily: 'Actay',
//                               fontSize: 16,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                       onPressed: login,
//                     ),
//
//                     //кнопка регистрации
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         shape:
//                         RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//                         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//                         backgroundColor: const Color.fromARGB(255, 10, 58, 69),
//                       ),
//                       child:
//                       const Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             "Зарегистрироваться",
//                             style: TextStyle(
//                               fontFamily: 'Actay',
//                               fontSize: 16,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => SignUpScreen(),
//                           ),
//                         );
//                       },
//                     ),
//
//                     const SizedBox(height: 90),
//
//                     //кнопка техподдержка
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         shape:
//                         RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//                         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//                         backgroundColor: const Color.fromARGB(255, 10, 58, 69),
//                       ),
//                       child:
//                       const Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           SizedBox(
//                             width: 2,
//                           ),
//                           Text(
//                             "Техподдержка",
//                             style: TextStyle(
//                               fontFamily: 'Actay',
//                               fontSize: 20,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => LiveChat(),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ]
//       ),
//     );
//   }
// }
//
//
//
//
// import 'package:email_validator/email_validator.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_firebase_auth/services/snack_bar.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   bool isHiddenPassword = true;
//   TextEditingController emailTextInputController = TextEditingController();
//   TextEditingController passwordTextInputController = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//
//   @override
//   void dispose() {
//     emailTextInputController.dispose();
//     passwordTextInputController.dispose();
//
//     super.dispose();
//   }
//
//   void togglePasswordView() {
//     setState(() {
//       isHiddenPassword = !isHiddenPassword;
//     });
//   }
//
//   Future<void> login() async {
//     final navigator = Navigator.of(context);
//
//     final isValid = formKey.currentState!.validate();
//     if (!isValid) return;
//
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailTextInputController.text.trim(),
//         password: passwordTextInputController.text.trim(),
//       );
//     } on FirebaseAuthException catch (e) {
//       print(e.code);
//
//       if (e.code == 'user-not-found' || e.code == 'wrong-password') {
//         SnackBarService.showSnackBar(
//           context,
//           'Неправильный email или пароль. Повторите попытку',
//           true,
//         );
//         return;
//       } else {
//         SnackBarService.showSnackBar(
//           context,
//           'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
//           true,
//         );
//         return;
//       }
//     }
//
//     navigator.pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: const Text('Войти'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(30.0),
//         child: Form(
//           key: formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 keyboardType: TextInputType.emailAddress,
//                 autocorrect: false,
//                 controller: emailTextInputController,
//                 validator: (email) =>
//                 email != null && !EmailValidator.validate(email)
//                     ? 'Введите правильный Email'
//                     : null,
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Введите Email',
//                 ),
//               ),
//               const SizedBox(height: 30),
//               TextFormField(
//                 autocorrect: false,
//                 controller: passwordTextInputController,
//                 obscureText: isHiddenPassword,
//                 validator: (value) => value != null && value.length < 6
//                     ? 'Минимум 6 символов'
//                     : null,
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 decoration: InputDecoration(
//                   border: const OutlineInputBorder(),
//                   hintText: 'Введите пароль',
//                   suffix: InkWell(
//                     onTap: togglePasswordView,
//                     child: Icon(
//                       isHiddenPassword
//                           ? Icons.visibility_off
//                           : Icons.visibility,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               ElevatedButton(
//                 onPressed: login,
//                 child: const Center(child: Text('Войти')),
//               ),
//               const SizedBox(height: 30),
//               TextButton(
//                 onPressed: () => Navigator.of(context).pushNamed('/signup'),
//                 child: const Text(
//                   'Регистрация',
//                   style: TextStyle(
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () =>
//                     Navigator.of(context).pushNamed('/reset_password'),
//                 child: const Text('Сбросить пароль'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }