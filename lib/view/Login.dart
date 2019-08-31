import 'package:boc_app/service/UserService.dart';
import 'package:boc_app/view/CustomContainer.dart';
import 'package:boc_app/view/MainMenu.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }

}

class _Login extends State<Login>{
  static TextEditingController username = new TextEditingController(text: '');
  static TextEditingController password = new TextEditingController(text: "");

  Widget usernameField = TextFormField(
    validator: (value) {
      if (value.isEmpty) {
        return AppTranslations.of(context).text('login_username_error');
      }
      return null;
    },
    controller: username,
    keyboardType: TextInputType.text,
    decoration: new InputDecoration(
      hintText:AppTranslations.of(context).text("username"),
    ),
  );

  Widget passwordField =  TextFormField(
    validator: (value) {
      if (value.length < 8) {
        return AppTranslations.of(context).text('login_password_error');
      }

      return null;
    },
    controller: password,
    obscureText: true,
    decoration: new InputDecoration(
        hintText:AppTranslations.of(context).text("password")
    ),
  );

  Widget loginButton;

  @override
  Widget build(BuildContext context) {
    loginButton = new RaisedButton(
        child: new Text(
          AppTranslations.of(context).text('login')
        ),
        onPressed: (){
          if (UserService.LogIn(username.text, password.text)){
            Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => MainMenu()
            )
            );
          }else{

          }
        },
      padding: EdgeInsets.all(10),
        color: Theme.of(context).buttonColor,
    );
    return Scaffold(
      appBar: AppBar(title: Padding(padding: EdgeInsets.all(10),child: Align(child:Image.asset("assets/image/logo-cropped.png")))),
      body: CustomContainer(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: new ListView(
                    children: <Widget>[
                      Text(
                        AppTranslations.of(context).text("login"), 
                        style: Theme.of(context).primaryTextTheme.display1
                          .copyWith(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 10),),
                      usernameField,
                      passwordField,
                      Padding(padding: EdgeInsets.only(bottom: 20),),
                      loginButton,
                      Padding(padding: EdgeInsets.only(bottom: 10),),
                      Row(
                        children: <Widget>[
                          Text(AppTranslations.of(context).text("login_forgot_pass")),
                          Text(AppTranslations.of(context).text("login_unlock_user"))
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 20),),
                      Container(
                        color: Theme.of(context).primaryColorDark,
                        padding:EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Text(
                              AppTranslations.of(context).text("call_us"), 
                              style: Theme.of(context).primaryTextTheme.subhead, 
                              textAlign: TextAlign.center,
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 10),),
                            Text(
                              "076 6154 361",
                              style: Theme.of(context).primaryTextTheme.subtitle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                        ),
                      )
                    ]
                  ),
                ),
              ),

      bottomNavigationBar: GestureDetector(
        onVerticalDragEnd: (drag){
          showMenu(context);
          },
        child:Column(
          children: <Widget>[
            Container(
                child: Text(
                    AppTranslations.of(context).text("Privacy & Security | Terms of use © 2019 Bank Of Ceylon. All Rights Reserved",
                    style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black),
                    textAlign: TextAlign.center,
                ),
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.all(10).copyWith(left: 1, right: 1),
            ),
            IconButton(
              onPressed: ()=>showMenu(context),
                icon: Icon(Icons.keyboard_arrow_up),
              alignment: Alignment.center,
            ),
          ],
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        )
      ),
    );
  }

  void showMenu(BuildContext context){
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft:Radius.circular(5),
                topRight:Radius.circular(5)
            )
        ),
        builder: (context){
      return Column(
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(AppTranslations.of(context).text("find_us"), style: Theme.of(context).textTheme.button, textAlign: TextAlign.center,),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(AppTranslations.of(context).text("faq"), style: Theme.of(context).textTheme.button, textAlign: TextAlign.center,),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(AppTranslations.of(context).text("offers"), style: Theme.of(context).textTheme.button, textAlign: TextAlign.center,),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(AppTranslations.of(context).text("calculator"), style: Theme.of(context).textTheme.button, textAlign: TextAlign.center,),
            ),
          ),
        ],
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      );
    });
  }

}