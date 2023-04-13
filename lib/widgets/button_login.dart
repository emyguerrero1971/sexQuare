import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  final ButtonStyle buttonStyle;
  final String text;
  final void Function()? onPressed;

  const ButtonLogin({
    Key? key,
    required this.buttonStyle,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: SizedBox(
        width: double.infinity,
        height: 45.0,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 17.0),
          ),
        ),
      ),
    );
  }
}
