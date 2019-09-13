import 'package:flutter/material.dart';

class PayeeSelector extends StatelessWidget {
  final Function(int) onComplete;
  final List<String> payeeList;

  const PayeeSelector({Key key, this.onComplete, this.payeeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            "Select a Payee",
            style: Theme.of(context).textTheme.headline,
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.all(20)),
          Flexible(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: payeeList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: (){
                      onComplete(index);
                    },
                      title: Text(
                      payeeList[index],
                      style: Theme.of(context).textTheme.subhead,
                    ),
                  );
                },
              ),
            ),
          )
        ],
    );
  }
}
