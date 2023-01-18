import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'CustomTextField.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

  bool _isVisiable = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: 'Password',
      obscureText: !_isVisiable,
      suffixIcon: GestureDetector(
        child: _isVisiable ? const Icon(Iconsax.eye_slash) : const Icon(Iconsax.eye),
        onTap:()=> setState((){
          _isVisiable = !_isVisiable;
        }),
      )
    );
  }
}
