import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
          border: Border.all(color: HexColor('#E1E1E1')),
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
        // child: Row(
        //   children: <Widget>[
        //     SizedBox(
        //       width: 8,
        //     ),
        //     Text(
        //       "  Type hospital / Diagnosis / Doctor Chamber",
        //       style: TextStyle(
        //         color: Colors.grey[400],
        //         fontSize: deviceWidth>=400?15:12,
        //       ),
        //     ),
        //     Spacer(),
        //     Padding(
        //       padding: const EdgeInsets.only(right:8.0),
        //       child: Icon(
        //         Icons.search,
        //         color: Colors.grey,
        //         size: 28,
        //       ),
        //     ),
        //
        //   ],
        // ),
        child:
        TextFormField(
          cursorColor: Colors.black,
          //keyboardType: ,
          decoration: new InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              hintText: " Type hospital / Diagnosis / Doctor Chamber",
              helperStyle:TextStyle(
            color: Colors.grey[400],
            fontSize: deviceWidth>=400?15:12,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right:10.0),
                child: Icon(Icons.search_sharp,color: Colors.grey,),
              ),
          ),
        )
      ),
    );
  }
}