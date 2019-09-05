import 'package:boc_app/view/customContainer.dart';
import 'package:flutter/material.dart';

class FindUs extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(

    appBar: AppBar(
        title: Padding(
            padding: EdgeInsets.all(10),
            child:
            Align(child: Image.asset("assets/image/logo-cropped.png")))),
    body: CustomContainer(

    ),
  );
}