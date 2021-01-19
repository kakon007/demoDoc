import 'package:flutter/material.dart';

class CustomRectangularButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool primaryFill;

  final double width;
  final double height;
  final double fontSize;
  final Key key;

  CustomRectangularButton(
      {@required this.text,
        @required this.onPressed,
        this.primaryFill = true,
        this.key,
        this.fontSize = 20,
        this.width = 90,
        this.height = 35,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Material(
        shape: Border.all(color: Theme.of(context).primaryColor),
        color: primaryFill
            ? Theme.of(context).primaryColor
            : Theme.of(context).backgroundColor,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding:  EdgeInsets.all(primaryFill?5.0:5.0),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    color: primaryFill?Theme.of(context).backgroundColor:Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize),
              ),
            ),
          ),
        ),
      ),
    );
  }
}