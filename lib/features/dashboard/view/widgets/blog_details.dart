import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:chewie/chewie.dart';
class BlogDetails extends StatelessWidget {
  String details;
  String title;

  BlogDetails({this.details, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: GoogleFonts.poppins(fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 4.0, right: 4),
        child: Container(
            child: Html(
          data: details,

          // webView: true,
          // buildAsync: true,
          //     webViewMediaPlaybackAlwaysAllow: true,
        )),
      )),
    );
  }
}
