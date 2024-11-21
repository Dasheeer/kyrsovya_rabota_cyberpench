import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/registrazia.dart';
import 'package:flutter_application_1/reset_password_screen.dart';
import 'package:flutter_application_1/services/snack_bar.dart';


import 'chat.dart';
import 'main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHiddenPassword = true;
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> login() async {
    final navigator = Navigator.of(context);

    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextInputController.text.trim(),
        password: passwordTextInputController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        SnackBarService.showSnackBar(
          context,
          'Неправильный email или пароль. Повторите попытку',
          true,
        );
        return;
      } else {
        SnackBarService.showSnackBar(
          context,
          'Неправильный email или пароль. Повторите попытку или обратитесь в поддержку.',
          true,
        );
        return;
      }
    }

    Navigator.pushAndRemoveUntil<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => Mainpage(),
      ),
          (route) => false,//if you want to disable back feature set to false
    );

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
                height: 547,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
          child: Column(
            children: [

              const Text(
                "Вход",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),

              const SizedBox(height: 30),

              //ввод почты
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

                    const SizedBox(height: 10),

              //ввод пароля
                    TextFormField(
                      autocorrect: false,
                      controller: passwordTextInputController,
                      obscureText: isHiddenPassword,
                      validator: (value) => value != null && value.length < 6
                          ? 'Минимум 6 символов'
                          : null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(),
                        hintText: 'Введите пароль',
                        hintStyle: TextStyle(
                          fontFamily: 'Actay',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        suffix: InkWell(
                          onTap: togglePasswordView,
                          child: Icon(
                            isHiddenPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

              const SizedBox(height: 0),

              //кнопка сброса пароля
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordScreen(),
                    ),
                  );
                },
                child: const Text('Сбросить пароль',
                  style: TextStyle(
                    fontFamily: 'Actay',
                    fontSize: 13,
                    color: const Color.fromARGB(255, 178, 247, 255),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              //кнопка войти

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
                      "Войти",
                      style: TextStyle(
                        fontFamily: 'Actay',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onPressed: login,
              ),

              const SizedBox(height: 0),

              //кнопка зарегистрироваться
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
                      "Зарегистрироваться",
                      style: TextStyle(
                        fontFamily: 'Actay',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 70),

              //кнопка теххподдержки
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
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "Техподдержка",
                      style: TextStyle(
                        fontFamily: 'Actay',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LiveChat(),
                    ),
                  );
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