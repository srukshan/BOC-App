import 'package:boc_app/controller/Localization/appTranslations.dart';
import 'package:flutter/material.dart';

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