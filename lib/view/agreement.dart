
import 'dart:io';

import 'package:boc_app/controller/Localization/appTranslations.dart';
import 'package:boc_app/view/login.dart';
import 'package:flutter/material.dart';

class Agreement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
              padding: EdgeInsets.all(10),
              child: Align(
                  child:Image.asset("assets/image/logo-cropped.png")
              )
          )
      ),
      body: Container(
        child: Column(
            children:<Widget>[
              Padding(padding: EdgeInsets.only(bottom: 20),),
              Container(
                child: Text(AppTranslations.of(context).text("Agreement"),
                  style: Theme.of(context).textTheme.display1,),
                padding: EdgeInsets.all(10),
              ),
              Padding(padding: EdgeInsets.only(bottom: 20),),
              Expanded(
                child: Container(
                  child: ListView(
                    padding: EdgeInsets.all(5),
                    children: <Widget>[
                      Text.rich(
                        TextSpan(children: <TextSpan>[
                          TextSpan(text: AppTranslations.of(context).text("Agreement_1"),style: Theme.of(context).textTheme.body1),
                        ]),
                        textAlign: TextAlign.justify,
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 20),),
                      Text.rich(
                        TextSpan(children: <TextSpan>[
                          TextSpan(text: AppTranslations.of(context).text("Agreement_title_1"),style: Theme.of(context).textTheme.body2),
                        ]),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 20),),
                      Text.rich(
                        TextSpan(children: <TextSpan>[
                          TextSpan(text: AppTranslations.of(context).text("Agreement_2"),style: Theme.of(context).textTheme.body1),
                        ]),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  color: Theme.of(context).primaryColorLight,
                  padding: EdgeInsets.all(10),
                ),
              )
            ]
        ),
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(child: FlatButton(
            child: Text(AppTranslations.of(context).text("btn_agree")),
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => Login()));
            },
          )),
          Expanded(child: FlatButton(
            child: Text(AppTranslations.of(context).text("btn_disagree")),
            onPressed: (){exit(0);},
          )),
        ],
      ),
    );
  }

}