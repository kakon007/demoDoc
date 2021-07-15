import 'package:flutter/material.dart';

class HomeScreenBackgroundWrapper extends StatelessWidget {
  final Widget child;

  HomeScreenBackgroundWrapper({@required this.child});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/dashboardNoewImage.png"), fit: BoxFit.fill),
          ),
          height: width <= 1250 && width >= 1000
              ? 380
              : width <= 999 && width >= 850
                  ? 305
                  : 250,
        ),
        child,
      ],
    );
  }
}
