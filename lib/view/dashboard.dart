

import 'package:boc_app/service/transactionService.dart';
import 'package:boc_app/view/priceCard.dart';
import 'package:boc_app/view/transactions.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DashboardBody(),
        Positioned(
          child: PriceCard(),
          top: 90,
          left: 25,
        )
      ],
    );
  }

}

class DashboardBody extends StatelessWidget {
  final transactions = TransactionService.getFirst5Transactions();

  @override
  Widget build(BuildContext context) => new Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.all(10),
      ),
      Text(
        "Jason Derulo",
        style: Theme.of(context).textTheme.title,
      ),
      Text(
        "9722 6472 6412 6412",
        style: Theme.of(context).textTheme.caption,
      ),
      Padding(
        padding: EdgeInsets.all(50),
      ),
      Flexible(
        child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(10).copyWith(top: 100, bottom: 20),
            child: SizedBox(
                height: 180,
                child: new Transactions(transactions: transactions))),
      ),
    ],
  );
}