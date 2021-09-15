import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Modules extends StatefulWidget {
  @override
  _ModulesState createState() => _ModulesState();
}

class _ModulesState extends State<Modules> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isTapped = !isTapped;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(top: 15, left: 10, right: 10),
              child: Container(
                width: width,
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xffEFF5FF),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.2),
                  //     spreadRadius: 5,
                  //     blurRadius: 5,
                  //     offset: Offset(0, 3), // changes position of shadow
                  //   ),
                  // ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(color: Color(0XFFAFBBFF)),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Prescription Module',
                                style: GoogleFonts.poppins(),
                              )),
                        )
                      ],
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(isTapped
                            ? Icons.keyboard_arrow_up_outlined
                            : Icons.keyboard_arrow_down_outlined)),
                  ],
                ),
              ),
            ),
          ),
          isTapped? Padding(
            padding: EdgeInsets.only(top: 0, left: 10, right: 10),
            child: Container(
              width: width,
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xffEFF5FF),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey.withOpacity(0.2),
                //     spreadRadius: 5,
                //     blurRadius: 5,
                //     offset: Offset(0, 3), // changes position of shadow
                //   ),
                // ],
              ),
            ),
          ) : SizedBox(),
        ],
      ),
    );
  }
}
