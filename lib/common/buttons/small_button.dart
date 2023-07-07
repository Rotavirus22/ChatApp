import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({super.key, required this.onPressed, this.color,required this.child});
  final Function()? onPressed;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      child: child,
    );
  }
}
