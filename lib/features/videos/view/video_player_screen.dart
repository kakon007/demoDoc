import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  String videoId;
  String title;
  VideoPlayerScreen(this.videoId,this.title);
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
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
   title: Text(widget.title,style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500),),
      ),
      body: Container(
        child: YoutubePlayer(
          controller: _youtubePlayerController,
          showVideoProgressIndicator: true,

          onReady: (){
            print("Player is Ready");
            _isPlayerReady=true;
          },
        ),
      ),
    );
  }
}
