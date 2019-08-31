import 'package:boc_app/controller/Localization/AppTranslationsDelegate.dart';
import 'package:boc_app/controller/Localization/Application.dart';
import 'package:boc_app/view/AppLoader.dart';
import 'package:boc_app/view/FirstTimeConfigurer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock/wakelock.dart';

import 'controller/ThemeController.dart';

main(){
  Wakelock.enable();
  return runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _App();
  }
}

class _App extends State<App>{
  AppTranslationsDelegate _newLocaleDelegate;
  bool first;

  _App(){
    checkFirst();
  }

  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
  }

  void checkFirst () async {
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    first = prefs.getBool("First");

  }

  @override
  Widget build(BuildContext context){
    if(first==null)
      first=true;
    return MaterialApp(
        theme: ThemeController.mainTheme,
        debugShowCheckedModeBanner: false,
        title: "BOC Online Banking",
        home: first?FirstTimeConfigurer():AppLoader(),
        localizationsDelegates: [
          _newLocaleDelegate,
          //provides localised strings
          GlobalMaterialLocalizations.delegate,
          //provides RTL support
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale("en", ""),
          const Locale("si_LK", ""),
          const Locale("ta_IN", ""),
        ],
    );
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }
}