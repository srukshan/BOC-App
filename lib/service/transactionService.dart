import 'package:boc_app/model/transaction.dart';

class TransactionService{
  static final transactionList = <Transaction>[
    new Transaction("Property Taxes", "Expense", new DateTime(2019, 5, 10), 750.00),
    new Transaction("Design Fee", "Income", new DateTime(2019, 6, 12), 10000.00),
    new Transaction("Property Taxes", "Expense", new DateTime(2019, 5, 10), 750.00),
    new Transaction("Design Fee", "Income", new DateTime(2019, 6, 12), 10000.00),
    new Transaction("Property Taxes", "Expense", new DateTime(2019, 5, 10), 750.00),
    new Transaction("Design Fee", "Income", new DateTime(2019, 6, 12), 10000.00),
    new Transaction("Property Taxes", "Expense", new DateTime(2019, 5, 10), 750.00),
    new Transaction("Design Fee", "Income", new DateTime(2019, 6, 12), 10000.00),
  ];

  static List<Transaction> getFirst5Transactions(){
    if(transactionList.length<=5){
      return transactionList;
    }else{
      return transactionList.sublist(0,5);
    }
  }
}