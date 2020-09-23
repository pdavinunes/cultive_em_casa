import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {

  Color color; 
  Widget child;
  Function onTap;

  CustomFloatingButton(this.color, this.child, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(100))),
            child: GestureDetector(
              child: child,
              onTap: onTap,
            ));
  }
}