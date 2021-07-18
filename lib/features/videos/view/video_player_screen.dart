import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  String videoId;
  String title;
  String descriptions;
  VideoPlayerScreen(this.videoId,this.title,this.descriptions);
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  YoutubePlayerController _youtubePlayerController;
  bool _isPlayerReady;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isPlayerReady=false;
    _youtubePlayerController=YoutubePlayerController(
        initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    )..addListener(_listener);
  }

  void _listener(){
    if(_isPlayerReady && mounted && !_youtubePlayerController.value.isFullScreen){
      //to-do
    }
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    _youtubePlayerController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _youtubePlayerController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //    appBar: AppBar(
   // title: Text(widget.title,style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500),),
   //    ),
      body: Center(
        child: YoutubePlayer(
          controller: _youtubePlayerController,
          showVideoProgressIndicator: true,
          topActions: [Padding(
            padding: const EdgeInsets.only(top:15.0,left:10),
            child: Container(width:MediaQuery.of(context).size.width>=600?500:350,child: Text(widget.title,style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),maxLines: 1,overflow: TextOverflow.ellipsis,)),
          ),],
          onReady: (){
            print("Player is Ready");
            _isPlayerReady=true;
          },
        ),
      ),
    );
  }
}
