import 'package:boc_app/model/transaction.dart';
import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  const Transactions({
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