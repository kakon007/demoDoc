
import 'package:flutter/material.dart';

class EditScreenSaveButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  EditScreenSaveButton({@required this.onPressed, @required this.text, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text ?? "",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
