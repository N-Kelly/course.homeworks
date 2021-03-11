import 'package:flutter/material.dart';

class AddProductionToCardButton extends StatefulWidget {
  final Function onOrder;
  final Function onCancelOrder;

  AddProductionToCardButton({ this.onOrder, this.onCancelOrder });

  @override
  _AddProductionToCardButtonState createState() => _AddProductionToCardButtonState(this.onOrder, this.onCancelOrder);
}

class _AddProductionToCardButtonState extends State<AddProductionToCardButton> {
  bool isChecked = false;

  final Function onOrder;
  final Function onCancelOrder;
  _AddProductionToCardButtonState(this.onOrder, this.onCancelOrder);

  @override
  Widget build(BuildContext context) {
    return SizedBox( width: 64, child: !isChecked ? FlatButton(
      minWidth: 30,
      onPressed: () {
        onOrder();
        setState(() { isChecked = true; });
      },
      child: Text(
        'ADD',
        style: new TextStyle(fontSize: 16),
      ),
    ) : IconButton(
        icon: Icon(Icons.check),
        onPressed: () {
          onCancelOrder();
          setState(() { isChecked = false; });
        },
    ));
  }
}