import 'package:flutter/material.dart';

class SearchBarViewWidget extends StatelessWidget {
  final Function onTap;

  SearchBarViewWidget({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
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
              "Type hospital / Diagnosis / Doctor Camber",
              style: TextStyle(
                color: Colors.grey[400],
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