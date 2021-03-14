import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomCard extends StatelessWidget {
  String titleText;
  String subTitleText;
  String countText;
  CustomCard(@required this.titleText,@required this.subTitleText,@required this.countText,);
  @override
  Widget build(BuildContext context) {
    return Container(

      //height: 40,
      width: 230,
      height: 100,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child:Row(
          children: [
            Container(
                width: 80,

                child: Image.asset("assets/images/my_health_logo.png")),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titleText,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,),textAlign:TextAlign.start),
                  SizedBox(height: 3,),
                  Text(subTitleText,style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),textAlign:TextAlign.start),
                  SizedBox(height: 3,),
                  Row(
                    children: [
                      CircleAvatar(
                        minRadius: 3,
                        backgroundColor: HexColor("#1DBF6D"),
                      ),
                      SizedBox(width: 3,),
                      Text(countText,style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        elevation:2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        shadowColor: HexColor("#354291"),
      ),
    );
  }
}