import 'package:boc_app/controller/Localization/AppTranslations.dart';
import 'package:boc_app/view/Agreement.dart';
import 'package:boc_app/view/CustomContainer.dart';
import 'package:flutter/material.dart';

class LanguageSelector extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomContainer(
          child: Align(
            child:Wrap(
              children: <Widget>[
                Image.asset("assets/image/logo-cropped.png", width: 120,),
                Padding(padding: EdgeInsets.only(bottom: 20),),
                RaisedButton(
                  onPressed:(){selectLanguage(context, "si_LK");},
                  child: Text("සිංහල", style: Theme.of(context).textTheme.button,),
                  color: Theme.of(context).primaryColorLight,
                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                ),
                RaisedButton(
                  onPressed:(){selectLanguage(context, "en");},
                  child: Text("English", style: Theme.of(context).textTheme.button,),
                  color: Theme.of(context).primaryColorLight,
                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                ),
                RaisedButton(
                  onPressed:(){selectLanguage(context, "ta_IN");},
                  child: Text("தமிழ்", style: Theme.of(context).textTheme.button,),
                  color: Theme.of(context).primaryColorLight,
                  padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                ),
              ],
              direction: Axis.vertical,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
            ),
            alignment: Alignment.center,
          ),
        )
    );
  }

  void selectLanguage(BuildContext context,String lang){
    AppTranslations.load(Locale(lang));
    Navigator.pushReplacement(
        context, MaterialPageRoute(
        builder: (context) => Agreement()
    )
    );
  }
}

