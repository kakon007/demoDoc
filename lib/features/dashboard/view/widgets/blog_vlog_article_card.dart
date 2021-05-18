import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/dashboard/view/widgets/blog_details.dart';
import 'package:myhealthbd_app/features/videos/view/video_player_screen.dart';
import 'package:myhealthbd_app/main_app/api_helper/url_launcher_helper.dart';
import 'package:page_transition/page_transition.dart';

class BlogVlogArticleCard extends StatefulWidget {
  Uint8List image;
  String logo;
  String title;
  String videoId;
  String description;
  String pageNo;
  String url;
  String buttonName;
  String blogDetails;

  BlogVlogArticleCard(
      {this.title,
        this.logo,
        this.image,
        this.description,
        this.videoId,
        this.pageNo,
        this.url,
        this.buttonName,
        this.blogDetails});

  @override
  _BlogVlogArticleCardState createState() => _BlogVlogArticleCardState();
}

class _BlogVlogArticleCardState extends State<BlogVlogArticleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 40,
      width: 300,
      height: 120,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:widget.image!=null? Container(
                  height: 110,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Image.memory(widget.image,gaplessPlayback: true,)):Container(
          height: 110,
          width: 100,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(30),
          // ),
          child: ClipRRect(
            child: CachedNetworkImage(
              imageUrl: widget.logo,
              fit: BoxFit.fill,
            ),
          )),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        height: 30,
                        child: Text(widget.title,
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start)),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.height * .12,
                        ),
                        InkWell(
                          onTap: () {
                            if (widget.pageNo == "0") {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (BuildContext) {
                                    return BlogDetails(
                                      title: widget.title,
                                      details: widget.blogDetails,
                                    );
                                  }));
                            } else if (widget.pageNo == "1") {
                              if (widget.url != null) {
                                if (widget.url.isNotEmpty)
                                  UrlLauncherHelper.launchUrl(widget.url);
                              }
                            } else {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: VideoPlayerScreen(widget.videoId,
                                      widget.title, widget.description),
                                ),
                              );
                            }
                          },
                          child: Material(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            color: HexColor("#354291"),
                            child: SizedBox(
                              width: 130,
                              height: 40,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    widget.buttonName,
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        elevation: 2,
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
