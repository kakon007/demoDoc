import 'package:flutter/material.dart';

class FailureFullScreenWidget extends StatelessWidget {
  final String errorMessage;
  final Function onTap;
  const FailureFullScreenWidget({
    @required this.errorMessage,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height -(AppBar().preferredSize.height * 2.5),
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            errorMessage ?? "",
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.subtitle1.apply(color: Colors.grey),
          ),
        ),
      ),
    );
  }


}
