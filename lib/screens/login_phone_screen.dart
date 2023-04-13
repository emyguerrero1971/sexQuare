import 'package:flutter/material.dart';

import 'package:sexquare/widgets/widgets.dart';

class LoginPhoneScreen extends StatelessWidget {
  static const String routeName = 'loginPhone';

  const LoginPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Logo(
                  subTitle: 'Chasqui',
                ),
                _Form(),
                const Labels(
                    route: 'register',
                    textCuenta: 'No tienes cuenta?',
                    textEnlace: 'Crea una cuenta Ahora'),
                const SizedBox(
                  height: 5.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    minimumSize: const Size(88.0, 36.0),
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    shape: const StadiumBorder(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40.0),
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: [
          CustomInput(
              autofocus: true,
              autocorrect: false,
              icon: Icons.mail_outline,
              hintText: 'Email',
              textEditingController: emailController,
              keyboardType: TextInputType.emailAddress,
              suffixIcon: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  emailController.clear();
                },
              )),
          CustomInput(
              autocorrect: false,
              icon: Icons.lock_outline,
              hintText: 'Password',
              textEditingController: passwordController,
              isPassword: true,
              suffixIcon: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  passwordController.clear();
                },
              )),
          ButtonLogin(
            buttonStyle: buttonStyle,
            text: 'Ingresar',
            onPressed: () {
              // print(emailController.text);
              // print(passwordController.text);
            },
          ),
        ],
      ),
    );
  }
}
