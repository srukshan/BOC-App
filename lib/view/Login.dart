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
        return 'Please enter the username';
      }
      return null;
    },
    controller: username,
    keyboardType: TextInputType.text,
    decoration: new InputDecoration(
      hintText:"Username",
    ),
  );

  Widget passwordField =  TextFormField(
    validator: (value) {
      if (value.length < 8) {
        return 'The Password must be at least 8 characters.';
      }

      return null;
    },
    controller: password,
    obscureText: true,
    decoration: new InputDecoration(
        hintText:"Password"
    ),
  );

  Widget loginButton;

  @override
  Widget build(BuildContext context) {
    loginButton = new RaisedButton(
        child: new Text(
          'Login'
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
                      Text("Login", style: Theme.of(context).primaryTextTheme.display1.copyWith(color: Colors.black),textAlign: TextAlign.center,),
                      Padding(padding: EdgeInsets.only(bottom: 10),),
                      usernameField,
                      passwordField,
                      Padding(padding: EdgeInsets.only(bottom: 20),),
                      loginButton,
                      Padding(padding: EdgeInsets.only(bottom: 10),),
                      Row(
                        children: <Widget>[
                          Text("Forgot Password?"),
                          Text("Unlock User")
                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 20),),
                      Container(
                        color: Theme.of(context).primaryColorDark,
                        padding:EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Text("Call Us Now", style: Theme.of(context).primaryTextTheme.subhead, textAlign: TextAlign.center,),
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
                    "Privacy & Security | Terms of use © 2019 Bank Of Ceylon. All Rights Reserved",
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
              child: Text("Find Us", style: Theme.of(context).textTheme.button, textAlign: TextAlign.center,),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text("FAQ", style: Theme.of(context).textTheme.button, textAlign: TextAlign.center,),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Offers", style: Theme.of(context).textTheme.button, textAlign: TextAlign.center,),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Calculator", style: Theme.of(context).textTheme.button, textAlign: TextAlign.center,),
            ),
          ),
        ],
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
      );
    });
  }

}