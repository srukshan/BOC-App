import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';

AppBar getAppBar() {
  return AppBar(
      title: Padding(
          padding: EdgeInsets.all(10),
          child: Align(child: Image.asset("assets/image/logo-cropped.png"))));
}

Widget getDrawer(BuildContext context) {
  return SizedBox(
    width: 300,
    child: Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 200,
            width: 300,
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Theme.of(context).primaryColorDark,
                  Theme.of(context).primaryColorLight
                ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Jason Derulo",
                      style: Theme.of(context).textTheme.display1,
                    ),
                    Text(
                      "2344 4634 4623",
                      style: Theme.of(context).textTheme.subhead,
                    )
                  ],
                )),
          ),
          Flexible(
              child: ListView(
            children: <Widget>[],
          ))
        ],
      ),
    ),
  );
}

void goToView(BuildContext context, Widget view) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => view));
}

void replaceView(BuildContext context, Widget view) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => view));
}
