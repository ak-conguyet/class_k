import 'package:class_k/Constans/KColors.dart';
import 'package:flutter/material.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({
    Key? key,
    this.size =50,
    this.startValue =0.5,
    this.endValue =2,
    this.color = const Color(0xFF194350),
    this.loop =true
  }) : super(key: key);

  final double size;
  final double startValue;
  final double endValue;
  final Color color;
  final bool loop;
  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;


  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: const Duration(milliseconds: 1000));
    _animation = Tween<double>(begin: 0.5, end: 2).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    super.initState();
    widget.loop ? _animationController.repeat(reverse: true) : _animationController.forward() ;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (_,child){
          return Transform.rotate(
            angle: _animation.value * 2 * 3.14,
            child: Container(
              height: (widget.size)*_animation.value,
              width: (widget.size)*_animation.value,
              decoration: BoxDecoration(
                color: KColors.primary,
                borderRadius: const BorderRadius.all(Radius.circular(50/2))
              ),
            ),
          );
        }
    );
  }
}
