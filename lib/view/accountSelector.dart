import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class AccountSelector extends StatefulWidget {
  final Function(String, String) onComplete;

  const AccountSelector({Key key, this.onComplete}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AccountSelector(onComplete: onComplete);
  }
}

class _AccountSelector extends State<AccountSelector>{
  final Function(String, String) onComplete;
  final List accountDetails = const [
    {'account': 'Account 1', 'amount': 10000.00},
    {'account': 'Account 2', 'amount': 42000.00},
    {'account': 'Account 3', 'amount': 12400.00},
  ];
  final accounts = const [
    'Account 1',
    'Account 2',
    'Account 3',
  ];
  String account = 'Account 1';
  var controller = new MaskedTextController(mask: '000,000,000.00');

  _AccountSelector({this.onComplete});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(padding: EdgeInsets.all(5)),
        Text(
          "Select an Account",
          style: Theme.of(context).textTheme.headline,
          textAlign: TextAlign.left,
        ),
        DropdownButton(
          value: account,
          items: accounts.map((val){
            return DropdownMenuItem(
              value: val,
              child: Text(val),
            );
          }).toList(),
          onChanged: (value){
            setState(() {
              account = value;
            });
          },
        ),
        Padding(padding: EdgeInsets.all(10)),
        Text(
          "Amount",
          style: Theme.of(context).textTheme.headline,
          textAlign: TextAlign.left,
        ),
        TextField(
          controller: controller,
        ),
        Padding(padding: EdgeInsets.all(20),),
        RaisedButton(
          child: new Text("Pay"),
          onPressed: (){
            widget.onComplete(controller.text, account);
          },
        )
      ],
    );
  }
}
