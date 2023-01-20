import 'package:class_k/Component/CustomTextField.dart';
import 'package:flutter/material.dart';

class EmailField extends StatefulWidget {
  const EmailField({Key? key, this.controller}) : super(key: key);
  final TextEditingController? controller;
  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  bool _visiable = false;
  bool _isValid = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      hintText: 'Email',
      inputType: TextInputType.emailAddress,
      onChange: (value){
        if(value.isNotEmpty){
          _visiable = true;
          if(_isValidEmail(value)){
            _isValid = true;
          }else{
            _isValid = false;
          }
        }else{
          _visiable = false;
        }
        setState(() {

        });
      },
      suffixIcon: Visibility(
        visible: _visiable,
        child: _isValid ? const Icon(Icons.check, color: Colors.green,) : const Icon(Icons.close,color: Colors.redAccent,),
      ),
    );
  }

  bool _isValidEmail(String email) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

}
