import 'package:flutter/material.dart';

class SearchBarViewWidget extends StatelessWidget {
  final Function onTap;

  SearchBarViewWidget({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    var deviceWidth=MediaQuery.of(context).size.width;
    var contrainerWidth=deviceWidth>=400?double.infinity:400.00;
    return Container(
      width: contrainerWidth,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 8,
            ),
            Text(
              "  Type hospital / Diagnosis / Doctor Camber",
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: deviceWidth>=400?15:12,
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right:8.0),
              child: Icon(
                Icons.search,
                color: Colors.grey,
                size: 28,
              ),
            ),

          ],
        ),
      ),
    );
  }
}