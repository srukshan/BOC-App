import 'package:boc_app/service/transactionService.dart';
import 'package:boc_app/view/appDefaults.dart';
import 'package:boc_app/view/customContainer.dart';
import 'package:boc_app/view/dashboard.dart';
import 'package:boc_app/view/transactionView.dart';
import 'package:boc_app/view/transactions.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _Home();
  }

}

class _Home extends State<Home>{
  int index = 0;
  build(context) => Scaffold(
        drawer: getDrawer(context),
        appBar: getAppBar(),
        bottomNavigationBar: getBottomMenu(context,
            onTap: (int index) => doTransition(index), index: this.index),
        body: CustomContainer(
            child: getView()
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.apps),
          backgroundColor: Colors.white,
          onPressed: () {
            showPaymentsMenu(context);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );

  void doTransition(int index) {
    setState(() {
      this.index = index;
    });
  }

  Widget getView() {
    switch(this.index){
      case 1:{
        return TransactionView();
      }
      default:{
        index = 0;
        return Dashboard();
      }
    }
  }
}
