import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/dashboard/view/widgets/blog_details.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
class CustomBlogWidget extends StatefulWidget {
  Uint8List logo;
  String image;
  String title;
  String news;
  String author;
  String index;
  CustomBlogWidget({this.logo,this.title, this.image, this.author, this.news, this.index});
  @override
  _CustomBlogWidgetState createState() => _CustomBlogWidgetState();
}

class _CustomBlogWidgetState extends State<CustomBlogWidget> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var width = MediaQuery.of(context).size.width;
    return Container(
      //height: 40,
      width: width<=1250 && width>=1000 ? 380 : width<=999 && width>=650? 340 :300,
      height:width<=1250 && width>=1000 ? 175 : width<=999 && width>=650? 140 :120,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child:Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: width<=1250 && width>=1000 ? 140 : width<=999 && width>=650?  115 : 80,
                  width: width<=1250 && width>=1000 ? 110 : width<=999 && width>=650?  105 : 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Image.memory(widget.logo,gaplessPlayback: true,fit: BoxFit.fill,)),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5,),
                    Container(
                        height: width<=1250 && width>=1000 ? 55 : 40,
                        child: Text(widget.title,style: TextStyle(fontSize: width<=1250 && width>=1000 ? 15 : width<=999 && width>=650? 13 : 11,fontWeight: FontWeight.w500),textAlign:TextAlign.start)),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext){
                          return BlogDetails(title: widget.title,details: widget.news,);
                        }));
                      },
                      child: Material(
                        elevation: 0  ,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        color: HexColor("#354291"),
                        child: SizedBox(
                          width: width<=1250 && width>=1000 ? 170 : width<=999 && width>=650?  155 : 130,
                          height: width<=1250 && width>=1000 ? 40 : width<=999 && width>=650? 35: 30,
                          child: Center(
                            child: Text("Read Blog", key: Key('readBlogButtonKey${widget.index}'),style:  GoogleFonts.poppins(color: Colors.white,fontSize:width<=1250 && width>=1000 ? 14 : width<=999 && width>=650? 13 :11,fontWeight: FontWeight.w600),),
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
