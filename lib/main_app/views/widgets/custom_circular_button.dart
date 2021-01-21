
import 'package:flutter/material.dart';


class CustomCircularButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final double circularRadius;
  final Key key;
  //final Color color;

  /// width could be null
  /// default width 135 for large device and 115 for mobile device
  final double width;
  final double height;
  final double fontSize;

  const CustomCircularButton({
    @required this.label,
    @required this.onTap,
   // @required this.color,
    this.key,
    this.fontSize = 18,
    this.width = 180,
    this.height = 35,
    this.circularRadius = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(circularRadius),
     // color: color,
      elevation: onTap == null ? 0 : 5.0,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: onTap == null ? Colors.grey : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(circularRadius),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(circularRadius),
            onTap: onTap,
            child: Center(
              child: Text(
                label,
                style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),

          ),
        ),
      ),
    );
  }
}
