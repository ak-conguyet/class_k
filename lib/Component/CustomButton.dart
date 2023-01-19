import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({Key? key, this.onTap}) : super(key: key);
  final Function()? onTap;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Get started',
              style: TextStyle(
                  fontSize: 20,
                color: Colors.white
              ),
            ),
            Icon(Icons.arrow_forward_rounded, size: 35,color: Colors.white,)
          ],
        ),
      ),
      onTap: (){
        widget.onTap?.call();
      },
    );
  }
}

