import 'dart:ui' as prefix0;

import 'package:boc_app/view/faq.dart';
import 'package:boc_app/view/findUs.dart';
import 'package:boc_app/view/login.dart';
import 'package:boc_app/view/offers.dart';
import 'package:boc_app/view/payBills.dart';
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
          InkWell(
            //onTap:()=>goToView(context, EditProfile()),
            child: SizedBox(
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
          ),
          Flexible(
              child: ListView(
            children: <Widget>[
              ListTile(
                title: Text("Find Us"),
                onTap: () => goToView(context, FindUs()),
              ),
              ListTile(
                title: Text("FAQ"),
                onTap: () => goToView(context, FAQ()),
              ),
              ListTile(
                title: Text("Offers"),
                onTap: () => goToView(context, Offers()),
              ),
              ListTile(
                title: Text("Calculator"),
              ),
              ListTile(
                title: Text("Logout"),
                onTap: (){
                  Navigator.popUntil(context, (route)=>route.isFirst);
                  replaceView(context, Login());
                },
              ),
            ],
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

Widget getBottomMenu(BuildContext context, {void Function(int index) onTap, int index}) {
  return BottomNavigationBar(
    backgroundColor: Theme.of(context).primaryColorDark,
    currentIndex: index,
    fixedColor: Colors.white,
    type: BottomNavigationBarType.shifting,
    onTap: onTap,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        title: Text("Dashboard"),
        backgroundColor: Theme.of(context).accentColor,
        icon: Icon(Icons.home),
        activeIcon: Icon(
          Icons.home,
          color: Theme.of(context).primaryColorLight,
        ),
      ),
      BottomNavigationBarItem(
        title: Text("Transactions"),
        icon: Icon(Icons.compare_arrows),
        backgroundColor: Theme.of(context).accentColor,
        activeIcon: Icon(
          Icons.compare_arrows,
          color: Theme.of(context).primaryColorLight,
        ),
      ),
    ],
  );
}

Widget gridCard(BuildContext context, IconData icon, String text,
    {Function() onPress}) {
  return GestureDetector(
    onTap: onPress,
    child: Card(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.black,
              size: 50,
            ),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.subtitle,
            ),
          ],
        ),
      ),
    ),
  );
}

void showPaymentsMenu(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                color: Theme.of(context).accentColor),
            padding: EdgeInsets.all(15).copyWith(top: 10, bottom: 10),
            child: SizedBox(
                height: (54 * 6).toDouble(),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: <Widget>[
                    gridCard(context, Icons.account_balance, "Accounts",
                        onPress: () {}),
                    gridCard(context, Icons.spellcheck, "Pay Bills",
                        onPress: () {
                      goToView(context, PayBills());
                    }),
                    gridCard(
                        context, Icons.compare_arrows, "Third Party Transfers",
                        onPress: () {}),
                    gridCard(
                        context, Icons.compare_arrows, "Own Account Transfer",
                        onPress: () {}),
                  ],
                )));
      });
}
