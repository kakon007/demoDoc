import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:myhealthbd_app/features/videos/view/video_player_screen.dart';
import 'package:page_transition/page_transition.dart';

// ignore: must_be_immutable
class CustomCardVideo extends StatefulWidget {
  String image;
  String title;
  String videoId;
  CustomCardVideo(this.image,this.title,this.videoId);
  @override
  _CustomCardVideoState createState() => _CustomCardVideoState();
}

class _CustomCardVideoState extends State<CustomCardVideo> {
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
                  height: 120,
                  width: 90,
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
                    SizedBox(height: 5,),
                    Text(widget.title,style: TextStyle(fontSize: 11,fontWeight: FontWeight.w500),textAlign:TextAlign.start),
                    SizedBox(height: 10,),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: VideoPlayerScreen(widget.videoId,widget.title),
                          ),
                        );
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
                              child: Text("Watch Video",style:  GoogleFonts.poppins(color: Colors.white,fontSize: 11,fontWeight: FontWeight.w600),),
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
