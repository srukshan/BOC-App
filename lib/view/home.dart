import 'package:boc_app/controller/Localization/appTranslations.dart';
import 'package:boc_app/model/transaction.dart';
import 'package:boc_app/service/transactionService.dart';
import 'package:boc_app/view/customContainer.dart';
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
            Positioned(
              child: PriceCard(),
              top: 90,
              left: 35,
            )
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
            width: MediaQuery.of(context).size.width - 70,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      offset: Offset(1, 1), spreadRadius: 0.5, blurRadius: 1)
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
            padding: EdgeInsets.all(40),
          ),
          Container(
              color: Colors.white,
              padding: EdgeInsets.all(10).copyWith(top: 100, bottom: 20),
              child: SizedBox(
                  height: 150,
                  child: new HomeTransactions(transactions: transactions))),
        ],
      );
}

class HomeTransactions extends StatelessWidget {
  const HomeTransactions({
    Key key,
    @required this.transactions,
  }) : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.account_balance),
                Padding(padding: EdgeInsets.all(5)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
              ],
            ),
            Text(
              (transaction.type == "Income" ? "+" : "-") +
                  transaction.amount.toString(),
              style: Theme.of(context).textTheme.body1.copyWith(
                  color:
                      transaction.type == "Income" ? Colors.green : Colors.red),
            ),
          ],
        );
      },
    );
  }
}
