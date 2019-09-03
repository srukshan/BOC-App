import 'package:boc_app/controller/Localization/AppTranslations.dart';
import 'package:boc_app/model/Transaction.dart';
import 'package:boc_app/service/TransactionService.dart';
import 'package:boc_app/view/CustomContainer.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  build(context) => Scaffold(
        appBar: AppBar(
            title: Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                    child: Image.asset("assets/image/logo-cropped.png")))),
        body: CustomContainer(
            child: Stack(
              children: <Widget>[
                HomeApp(),
                //Positioned(child: PriceCard(),top: 30,)
              ],
        )),
      );
}

class PriceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
            width: MediaQuery.of(context).size.width - 100,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(offset: Offset(1, 1), spreadRadius: 5)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  AppTranslations.of(context).text("current_balance"),
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Rs. 75 000.00",
                  style: Theme.of(context).textTheme.title,
                  textAlign: TextAlign.center,
                ),
                Text(
                  AppTranslations.of(context).text("this_month"),
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.account_balance),
                          Column(
                            children: <Widget>[
                              Text(
                                AppTranslations.of(context).text("income"),
                                style: Theme.of(context).textTheme.caption,
                              ),
                              Text(
                                "Rs. 150 000.00",
                                style: Theme.of(context).textTheme.body2,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.account_balance),
                          Column(
                            children: <Widget>[
                              Text(
                                AppTranslations.of(context).text("expenses"),
                                style: Theme.of(context).textTheme.caption,
                              ),
                              Text(
                                "Rs. 75 000.00",
                                style: Theme.of(context).textTheme.body2,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}

class HomeApp extends StatelessWidget {
  final transactions = TransactionService.getFirst5Transactions();

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      new Column(
            children: <Widget>[
              Text(
                "Jason Derulo",
                style: Theme.of(context).textTheme.subtitle,
              ),
              Text(
                "9722 6472 6412 6412",
                style: Theme.of(context).textTheme.body1,
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(30).copyWith(top: 50),
                  child: ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = transactions[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.account_balance),
                          Column(
                            children: <Widget>[
                              Text(
                                transaction.title,
                                style: Theme.of(context).textTheme.body2,
                              ),
                              Text(
                                transaction.dateTime.year.toString() +
                                    "/" +
                                    transaction.dateTime.month.toString() +
                                    "/" +
                                    transaction.dateTime.day.toString(),
                                style: Theme.of(context).textTheme.caption,
                              )
                            ],
                          ),
                          Text(
                            (transaction.type == "Income" ? "+" : "-") +
                                transaction.amount.toString(),
                            style: Theme.of(context).textTheme.body1.copyWith(
                                color: transaction.type == "Income"
                                    ? Colors.green
                                    : Colors.red),
                          )
                        ],
                      );
                    },
                  ))
            ],
          ),
    ],
  );
}
