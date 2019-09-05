import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget{
  final Widget child;
  final EdgeInsetsGeometry padding;

  CustomContainer({this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: this.padding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Theme.of(context).primaryColorDark,Theme.of(context).primaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        ),
      ),
      child: child,
    );
  }


}