import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/constants.dart';

class RestaurantButton extends StatelessWidget {
  final String btnText;

  RestaurantButton({@required this.btnText});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: kMainTilesBorderRadius,
      ),
      child: Text(
        btnText,
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
      onPressed: () {},
    );
  }
}
