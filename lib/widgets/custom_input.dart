import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconButton? suffixIcon;
  final IconData icon;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool autocorrect;
  final bool autofocus;

  const CustomInput({
    super.key,
    this.labelText,
    this.helperText,
    this.suffixIcon,
    this.autofocus = false,
    this.autocorrect = false,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    required this.icon,
    required this.hintText,
    required this.textEditingController,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {


  @override
  void initState() {
    switch (widget.hintText) {
      case 'Nombre':
        widget.textEditingController.text = 'powerXquare';
        break;
      case 'Email':
        widget.textEditingController.text = 'powerxquare@gmail.com';
        break;
      case 'Password':
      widget.textEditingController.text = '6n1kym501D';
      break;
      default:
        widget.textEditingController.text = '';
    }
    super.initState();
  }

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    widget.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(
            top: 5.0, left: 15.0, bottom: 5.0, right: 20.0),
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(0.0, 5.0),
                blurRadius: 5.0)
          ],
        ),
        child: TextField(
          autofocus: widget.autofocus,
          controller: widget.textEditingController,
          autocorrect: widget.autocorrect,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword,
          decoration: InputDecoration(
            hintText: widget.hintText,
            labelText: widget.labelText,
            helperText: widget.helperText,
            icon: Icon(widget.icon),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            suffixIcon: widget.suffixIcon,
          ),
        ));
  }
}



// import 'package:flutter/material.dart';

// class CustomInput extends StatelessWidget {
//   final String? hintText;
//   final String? labelText;
//   final String? helperText;
//   final IconButton? suffixIcon;
//   final IconData icon;
//   final TextEditingController textEditingController;
//   final TextInputType keyboardType;
//   final bool isPassword;
//   final bool autocorrect;
//   final bool autofocus;

//   const CustomInput({
//     super.key,
//     this.labelText,
//     this.helperText,
//     this.suffixIcon,
//     this.autofocus = false,
//     this.autocorrect = false,
//     this.isPassword = false,
//     this.keyboardType = TextInputType.text,
//     required this.icon,
//     required this.hintText,
//     required this.textEditingController,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: const EdgeInsets.only(
//             top: 5.0, left: 15.0, bottom: 5.0, right: 20.0),
//         margin: const EdgeInsets.only(bottom: 20.0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(30.0),
//           boxShadow: <BoxShadow>[
//             BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 offset: const Offset(0.0, 5.0),
//                 blurRadius: 5.0)
//           ],
//         ),
//         child: TextField(
//           autofocus: autofocus,
//           controller: textEditingController,
//           autocorrect: autocorrect,
//           keyboardType: keyboardType,
//           obscureText: isPassword,
//           decoration: InputDecoration(
//             hintText: hintText,
//             labelText: labelText,
//             helperText: helperText,
//             icon: Icon(icon),
//             focusedBorder: InputBorder.none,
//             border: InputBorder.none,
//             suffixIcon: suffixIcon,
//           ),
//         ));
//   }
// }
