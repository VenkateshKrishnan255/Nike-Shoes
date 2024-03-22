import 'package:flutter/cupertino.dart';

class Transition extends StatelessWidget {
  const Transition(
      {
      Key? key,
      required this.child,
      required this.duration,
      required this.offset,
      required this.axis,
      required this.left}) : super(key: key);

  final Widget child;

  final Duration duration;

  final double offset;

  final Axis axis;

  final bool left;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween(begin: 1.0, end: 0.0),
        duration: duration,
        curve: Curves.easeInOut,
        builder: (BuildContext context, double value, Widget? child){
          return Transform.translate(
            offset: left
            ? Offset(-value * offset, value * offset)
            : Offset(value * offset, -value * offset),
            child: child,
          );
        }
    );
  }
}
