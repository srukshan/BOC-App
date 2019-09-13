import 'package:boc_app/view/accountSelector.dart';
import 'package:boc_app/view/appDefaults.dart';
import 'package:boc_app/view/customContainer.dart';
import 'package:boc_app/view/home.dart';
import 'package:boc_app/view/payeeSelector.dart';
import 'package:boc_app/view/paymentSuccess.dart';
import 'package:flutter/material.dart';

class PayBills extends StatefulWidget {
  @override
  _PayBillsState createState() => _PayBillsState();
}

class _PayBillsState extends State<PayBills> {
  int step = 0;
  String amount;
  String account;
  final payeeList = [
    'Dialog',
    'Mobitel',
    'Airtel'
  ];
  int payeeIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      drawer: getDrawer(context),
      body: Builder(
          builder: (context)=>CustomContainer(
            child: Column(
              children: <Widget>[
                Spacer(flex: 1,),
                Text("Pay Bills", style: Theme.of(context).textTheme.title,),
                Spacer(flex: 1,),
                Flexible(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: getContent(step),
                ), flex: 20,),
              ],
            ),
          ),
      ),
    );
  }

  Widget getContent(int step) {
    switch(step){
      case 1:
        {
          return PayeeSelector(payeeList: payeeList,onComplete: (int index) {
            setState(() {
              this.step = 2;
              this.payeeIndex = index;
            });
          },);
        }
        break;
      case 2:
        {
          return PaymentSuccess(payeeList[payeeIndex], account, amount, onComplete: (){
            step=0;
            replaceView(context, Home());
          },);
        }
      default:
        {
          return AccountSelector(onComplete: (String amount, String account) {
            setState(() {
              this.amount = amount+".00";
              this.account = account;
              this.step = 1;
            });
          },);
        }
        break;
    }
  }
}
