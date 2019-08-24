import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0){
      return;
    }

    widget.addTx(enteredTitle,enteredAmount);
    Navigator.of(context).pop(); // unuk menutup bottom sheet setelah btn add transaction di tap
  }

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  TextField(                  //TextField TITLE
                    decoration: InputDecoration(labelText: 'Nama Transaksi'),
                    controller: titleController,
                    onSubmitted: (_) => submitData(),
                    
                  ),
                  TextField(                  //TextField AMOUNT
                    decoration: InputDecoration(labelText: 'Jumlah'),
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => submitData(),
                    
                  ),
                  FlatButton( //BUTTON ADD TRANSACTION
                    child: Text('BELANJA TEROOOSSS'),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: submitData,
                  )
                ],
              ),
            ),
          );
  }
}