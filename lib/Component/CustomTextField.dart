import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.obscureText:false,
    this.inputType,
    this.suffixIcon,
    this.onChange
  }) : super(key: key);

  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? inputType;
  final Widget? suffixIcon;
  final Function(String)? onChange;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> with SingleTickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController animationController;
  late Tween<double> tween;
  late FocusNode _focusNode;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    tween = Tween<double>(begin: 0, end: 1);
    animation = tween.animate(CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if(_focusNode.hasFocus){
        animationController.forward();
      }else{
        animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          TextFormField(
            focusNode: _focusNode,
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: InputBorder.none,
              suffixIcon: widget.suffixIcon
            ),
            onChanged: (value)=>widget.onChange?.call(value),
            keyboardType: widget.inputType,
            controller: widget.controller,
            obscureText: widget.obscureText,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedBuilder(
              animation: animation,
              builder: (BuildContext context, Widget? child) {
                return LinearProgressIndicator(
                  value: animation.value,
                  backgroundColor: Colors.grey.withOpacity(0.5),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}