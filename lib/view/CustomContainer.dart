import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget{
  final Widget child;

  CustomContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
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