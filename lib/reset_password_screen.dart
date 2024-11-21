import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/snack_bar.dart';

import 'login.dart';


class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailTextInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextInputController.dispose();

    super.dispose();
  }

  Future<void> resetPassword() async {
    final navigator = Navigator.of(context);
    final scaffoldMassager = ScaffoldMessenger.of(context);

    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailTextInputController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'user-not-found') {
        SnackBarService.showSnackBar(
          context,
          'Такой email незарегистрирован!',
          true,
        );
        return;
      } else {
        SnackBarService.showSnackBar(
          context,
          'Неизвестная ошибка! Попробуйте еще раз или обратитесь в поддержку.',
          true,
        );
        return;
      }
    }

    const snackBar = SnackBar(
      content: Text('Сброс пароля осуществен. Проверьте почту'),
      backgroundColor: Colors.green,
    );

    scaffoldMassager.showSnackBar(snackBar);

    navigator.pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 58, 71),
        toolbarHeight: 50,
        centerTitle: true,
        title: Text("CyberPench",
          style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w700,
              height: 0,
              decoration: TextDecoration.none),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.white,
            height: 2.5,
          ),
        ),
      ),
    body:
    Form(
    key: formKey,

    child:
    Container(
    decoration: const BoxDecoration(
    image: DecorationImage(
    image: AssetImage("lib/assets/image/BACKGROUND/Product.png"),
    fit: BoxFit.cover,
    ),
    ),
    height: 8000,
    child: Center(
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Color.fromRGBO(31, 84, 96, 1.0),
    border: Border.all(color: Color(0xFFFFFFFF), width: 1.5),
    ),
    height: 240,
    margin: const EdgeInsets.symmetric(horizontal: 16),
    padding:
    const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
    child: Column(
            children: [

              const Text(
                "Сброс пароля",
                style: TextStyle(
                  fontFamily: 'Actay',
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                controller: emailTextInputController,
                validator: (email) =>
                email != null && !EmailValidator.validate(email)
                    ? 'Введите правильный Email'
                    : null,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(),
                  hintText: 'Введите Email',
                  hintStyle: TextStyle(
                    fontFamily: 'Actay',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  backgroundColor: const Color.fromARGB(255, 10, 58, 69),
                ),

                child:

                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Сбросить пароль",
                      style: TextStyle(
                        fontFamily: 'Actay',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onPressed: () async {
                  try {
                    await resetPassword(); // Убедитесь, что signUp - это функция
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  } catch (e) {
                    // Обработка ошибки
                    print('Ошибка при регистрации: $e');
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
  }
}