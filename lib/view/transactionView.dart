import 'package:boc_app/service/transactionService.dart';
import 'package:boc_app/view/transactions.dart';
import 'package:flutter/material.dart';

class TransactionView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(10),),
        Text("Transaction History", style: Theme.of(context).textTheme.title,),
        Padding(padding: EdgeInsets.all(10),),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(5),
            color: Colors.white,
            child: Transactions(transactions: TransactionService.transactionList,),
          )
        )
      ],
    );
  }
}