import 'package:flutter/material.dart';

class CustomRectangularButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool primaryFill;

  CustomRectangularButton(
      {@required this.text,
        @required this.onPressed,
        this.primaryFill = true});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: Border.all(color: Theme.of(context).primaryColor),
      color: primaryFill
          ? Theme.of(context).primaryColor
          : Theme.of(context).backgroundColor,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding:  EdgeInsets.all(primaryFill?5.0:5.0),
          child: Text(
            text,
            style: TextStyle(
                color: primaryFill?Theme.of(context).backgroundColor:Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
        ),
      ),
    );
  }
}