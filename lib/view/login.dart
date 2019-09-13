import 'package:boc_app/controller/Localization/appTranslations.dart';
import 'package:boc_app/service/userService.dart';
import 'package:boc_app/view/customContainer.dart';
import 'package:boc_app/view/faq.dart';
import 'package:boc_app/view/findUs.dart';
import 'package:boc_app/view/home.dart';
import 'package:boc_app/view/offers.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  static TextEditingController username = new TextEditingController(text: '');
  static TextEditingController password = new TextEditingController(text: "");

  static Widget usernameField, passwordField;

  @override
  Widget build(BuildContext context) {
    usernameField = TextFormField(
      controller: username,
      keyboardType: TextInputType.text,
      decoration: new InputDecoration(
        hintText: AppTranslations.of(context).text("username"),
      ),
    );

    passwordField = TextFormField(
      controller: password,
      obscureText: true,
      decoration: new InputDecoration(
          hintText: AppTranslations.of(context).text("password")),
    );

    return Scaffold(
      appBar: AppBar(
          title: Padding(
              padding: EdgeInsets.all(10),
              child:
                  Align(child: Image.asset("assets/image/logo-cropped.png")))),
      body: Builder(
        builder: (context) => CustomContainer(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: new ListView(children: <Widget>[
              Text(
                AppTranslations.of(context).text("login"),
                style: Theme.of(context)
                    .primaryTextTheme
                    .display1
                    .copyWith(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              usernameField,
              passwordField,
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              getLoginButton(context),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Row(
                children: <Widget>[
                  Text(
                    AppTranslations.of(context).text("login_forgot_pass"),
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    AppTranslations.of(context).text("login_unlock_user"),
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              InkWell(
                onTap: (){
                  launch('tel:076 6154 361');
                },
                child: Container(
                  color: Theme.of(context).primaryColorDark,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Text(
                        AppTranslations.of(context).text("call_us"),
                        style: Theme.of(context).primaryTextTheme.subhead,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                      ),
                      Text(
                        "076 6154 361",
                        style: Theme.of(context).primaryTextTheme.subtitle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
          onVerticalDragEnd: (drag) {
            showMenu(context);
          },
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  AppTranslations.of(context).text("footer_content"),
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.all(10).copyWith(left: 1, right: 1),
              ),
              IconButton(
                onPressed: () => showMenu(context),
                icon: Icon(Icons.keyboard_arrow_up),
                alignment: Alignment.center,
              ),
            ],
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          )),
    );
  }

  void showMenu(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5))),
        builder: (context) {
          return Column(
            children: <Widget>[
              InkWell(
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => FindUs()));
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      AppTranslations.of(context).text("find_us"),
                      style: Theme.of(context).textTheme.button,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              InkWell(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      AppTranslations.of(context).text("faq"),
                      style: Theme.of(context).textTheme.button,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => FAQ()));
                },
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Offers()));
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      AppTranslations.of(context).text("offers"),
                      style: Theme.of(context).textTheme.button,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    AppTranslations.of(context).text("calculator"),
                    style: Theme.of(context).textTheme.button,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          );
        });
  }

  Widget getLoginButton(BuildContext context) {
    return new RaisedButton(
      child: new Text(AppTranslations.of(context).text('login')),
      onPressed: () {
        if (UserService.logIn(username.text, password.text)) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        } else {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text(AppTranslations.of(context).text("login_error")),
          ));
        }
      },
      padding: EdgeInsets.all(10),
      color: Theme.of(context).buttonColor,
    );
  }
}
