import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/appointments/view_model/available_slot_view_model.dart';
import 'package:myhealthbd_app/features/find_doctor/view_model/doctor_list_view_model.dart';
import 'package:myhealthbd_app/main_app/api_helper/url_launcher_helper.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_rectangular_button.dart';
import 'package:provider/provider.dart';

class CustomCardNews extends StatelessWidget {
  Uint8List image;
  String titleText;
  String subTitleText;
  String url;
  CustomCardNews(@required this.image,@required this.titleText,@required this.subTitleText,@required this.url,);
  @override
  Widget build(BuildContext context) {

    return Container(
      //height: 40,
      width: 300,
      height: 120,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child:Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 100,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Image.memory(image,gaplessPlayback: true,)),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(titleText,style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold,color: Colors.grey),textAlign:TextAlign.start),
                        Spacer(),
                        Row(
                          children: [
                            Icon(Icons.star,size: 8,color:HexColor('#F5D63C')),
                            Icon(Icons.star,size: 8,color: HexColor('#F5D63C')),
                            Icon(Icons.star,size: 8,color: HexColor('#F5D63C')),
                            Icon(Icons.star,size: 8,color: HexColor('#F5D63C')),
                            Icon(Icons.star,size: 8,color: HexColor('#D2D2D2')),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text(subTitleText,style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500),textAlign:TextAlign.start),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        if (url != null) {
                          if (url.isNotEmpty)
                            UrlLauncherHelper.launchUrl(url);
                        }
                      },
                      child: Material(
                        elevation: 0  ,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        color: HexColor("#354291"),
                        child: SizedBox(
                          width: 130,
                          height: 30,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Read News",style:  GoogleFonts.poppins(color: Colors.white,fontSize: 11,fontWeight: FontWeight.w600),),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        elevation:2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: Colors.grey.withOpacity(0.2),
            width: 1,
          ),
        ),
        shadowColor: HexColor("#354291").withOpacity(0.2),
      ),
    );
  }
}