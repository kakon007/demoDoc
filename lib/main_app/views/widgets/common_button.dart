
import 'package:flutter/material.dart';


class CommonButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final double circularRadius;
  final Key key;

  /// width could be null
  /// default width 135 for large device and 115 for mobile device
  final double width;
  final double height;
  final double fontSize;

  const CommonButton({
    @required this.label,
    @required this.onTap,
    this.key,
    this.fontSize = 18,
    this.width = 115,
    this.height = 60,
    this.circularRadius = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(circularRadius),
      color: Colors.transparent,
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
                style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
