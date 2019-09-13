import 'package:boc_app/controller/Localization/appTranslations.dart';
import 'package:boc_app/model/transaction.dart';
import 'package:boc_app/service/transactionService.dart';
import 'package:boc_app/view/appDefaults.dart';
import 'package:boc_app/view/customContainer.dart';
import 'package:boc_app/view/payBills.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  build(context) => Scaffold(
        drawer: getDrawer(context),
        appBar: getAppBar(),
        body: CustomContainer(
            child: Stack(
          children: <Widget>[
            HomeApp(),
            Positioned(
              child: PriceCard(),
              top: 90,
              left: 25,
            )
          ],
        )),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.apps),
          backgroundColor: Colors.white,
          onPressed: () {
            showMenu(context);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );

  void showMenu(BuildContext context) {
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
                      gridCard(context, Icons.compare_arrows,
                          "Third Party Transfers",
                          onPress: () {}),
                      gridCard(
                          context, Icons.compare_arrows, "Own Account Transfer",
                          onPress: () {}),
                    ],
                  )));
        });
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
}

class PriceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(3),
        width: MediaQuery.of(context).size.width - 50,
        height: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(offset: Offset(1, 1), spreadRadius: 0.5, blurRadius: 1)
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
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.account_balance),
                        Padding(
                          padding: EdgeInsets.all(2),
                        ),
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
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.account_balance),
                        Padding(
                          padding: EdgeInsets.all(2),
                        ),
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
                ),
              ],
            )
          ],
        ));
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
            padding: EdgeInsets.all(50),
          ),
          Container(
              color: Colors.white,
              padding: EdgeInsets.all(10).copyWith(top: 100, bottom: 20),
              child: SizedBox(
                  height: 180,
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
