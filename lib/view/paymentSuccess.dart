import 'package:flutter/material.dart';

class PaymentSuccess extends StatelessWidget{
  final Function() onComplete;
  final String payee, account, amount;

  const PaymentSuccess(this.payee, this.account, this.amount, {Key key, this.onComplete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(payee, style: Theme.of(context).textTheme.title,textAlign: TextAlign.center,),
        Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Text('Account', style: Theme.of(context).textTheme.caption,textAlign: TextAlign.center,),
              Text(account, style: Theme.of(context).textTheme.body2,textAlign: TextAlign.center,),
            ],
          ),
        ),
        Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Text('Amount', style: Theme.of(context).textTheme.caption,textAlign: TextAlign.center,),
              Text('Rs. $amount', style: Theme.of(context).textTheme.body2,textAlign: TextAlign.center,),
            ],
          ),
        ),
        FlatButton(
          child: Text(
            "CONFIRM",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white),
          ),
          color: Theme.of(context).accentColor,
          onPressed: onComplete,
          padding: EdgeInsets.all(10),
        ),
        Padding(padding: EdgeInsets.all(5)),
      ],
    );
  }

}