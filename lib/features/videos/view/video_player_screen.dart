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
      appBar: AppBar(
   title: Text(widget.title,style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500),),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: YoutubePlayer(
                  controller: _youtubePlayerController,
                  showVideoProgressIndicator: true,

                  onReady: (){
                    print("Player is Ready");
                    _isPlayerReady=true;
                  },
                ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Description*",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w500),),
            ),
            SizedBox(height: 5,),
            Expanded(flex:2,child: SingleChildScrollView(child: Container(child:widget.descriptions==null?Center(child: Text('No Descriptions'),): Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.descriptions),
            ),)))
          ],
        ),
      ),
    );
  }
}
