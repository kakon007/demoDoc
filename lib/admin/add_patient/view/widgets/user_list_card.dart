import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';

import 'delete_user_prompt.dart';

class UserListCard extends StatefulWidget {

  @override
  _UserListCardState createState() => _UserListCardState();
}

class _UserListCardState extends State<UserListCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'User id. GHATAIL01',
                        style: GoogleFonts.poppins(
                            color: Color(0xffFFB14A)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10,top: 15),
                        child: Container(
                          constraints: BoxConstraints(
                            minWidth: 100,
                          ),
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppTheme.buttonActiveColor),
                          //color: HexColor("#107B3E"),
                          child: Center(
                            child: Text(
                              "View Details",
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          //color: AppTheme.buttonActiveColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text('MH22012014368',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500),),
                      SizedBox(width: 10,),
                      Icon(
                        Icons.circle,
                        size: 12,
                        color: Color(0xff55CFA6),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Active',
                        style: GoogleFonts.poppins(
                            color: Color(0xff55CFA6), fontSize: 11),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Created at:',style: GoogleFonts.poppins(fontSize: 12),),
                          SizedBox(
                            width: 10,
                          ),
                          Text('04-07-2021',style: GoogleFonts.poppins(fontSize: 12),),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Account Status:',style: GoogleFonts.poppins(fontSize: 12),),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Regular',style: GoogleFonts.poppins(fontSize: 12),),
                        ],
                      ),
                      SizedBox(width: 10,)
                    ],
                  )
                ],
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 10.0, right: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () async {
                      showDialog(
                          context: context,
                          builder: (context) {

                            return DeleteUserPrompt();
                          });
                    },
                    child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Color(0xffFF8585),
                            borderRadius: BorderRadius.all(
                                Radius.circular(5))),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        )),
                  ),

                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: 130,
                    height: 35,
                    decoration: BoxDecoration(
                      color: AppTheme.buttonActiveColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Reset Password",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: 130,
                    height: 35,
                    decoration: BoxDecoration(
                      color: AppTheme.buttonActiveColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Update Info",
                          style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

  }
}
