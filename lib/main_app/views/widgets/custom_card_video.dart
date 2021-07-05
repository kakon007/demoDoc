import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:myhealthbd_app/features/videos/view/video_player_screen.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:page_transition/page_transition.dart';

// ignore: must_be_immutable
class CustomCardVideo extends StatefulWidget {
  String image;
  String title;
  String videoId;
  String description;
  String index;
  CustomCardVideo(this.image,this.title,this.videoId,this.description, this.index);
  @override
  _CustomCardVideoState createState() => _CustomCardVideoState();
}

class _CustomCardVideoState extends State<CustomCardVideo> {
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
                  height: width<=1250 && width>=1000 ? 140 : width<=999 && width>=650?  115 : 100,
                  width: width<=1250 && width>=1000 ? 110 : width<=999 && width>=650?  105 : 90,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(30),
                  // ),
                  child:
                   ClipRRect(
                     borderRadius: BorderRadius.all(Radius.circular(15)),
                     child: CachedNetworkImage(
                       imageUrl: widget.image,
                     ),
                   )
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(
                    //   children: [
                    //     Text(titleText,style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold,color: Colors.grey),textAlign:TextAlign.start),
                    //     Spacer(),
                    //     Row(
                    //       children: [
                    //         Icon(Icons.star,size: 8,color:HexColor('#F5D63C')),
                    //         Icon(Icons.star,size: 8,color: HexColor('#F5D63C')),
                    //         Icon(Icons.star,size: 8,color: HexColor('#F5D63C')),
                    //         Icon(Icons.star,size: 8,color: HexColor('#F5D63C')),
                    //         Icon(Icons.star,size: 8,color: HexColor('#D2D2D2')),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    Container(
                      height: width<=1250 && width>=1000 ? 70 : 55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: width<=1250 && width>=1000 ? 10 : 5,),
                          Text(widget.title,maxLines:2,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: width<=1250 && width>=1000 ? 14 : width<=999 && width>=650? 13 : 11,fontWeight: FontWeight.w500),textAlign:TextAlign.start),
                        ],
                      ),
                    ),

                    SizedBox(height:width<=1250 && width>=1000 ? 20 : width<=999 && width>=650?  15 :  10,),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: VideoPlayerScreen(widget.videoId,widget.title,widget.description),
                          ),
                        );
                      },
                      child: Material(
                        elevation: 0  ,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        color: HexColor("#354291"),
                        child: SizedBox(
                          width: width<=1250 && width>=1000 ? 170 : width<=999 && width>=650?  155 : 130,
                          height: width<=1250 && width>=1000 ? 40 : width<=999 && width>=650? 35: 30,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Watch Video",key: Key('watchVideoButtonKey${widget.index}'),style:  GoogleFonts.poppins(color: Colors.white,fontSize:  width<=1250 && width>=1000 ? 14 : width<=999 && width>=650?  13  : 11,fontWeight: FontWeight.w600),),
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
