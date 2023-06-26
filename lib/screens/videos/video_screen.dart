import 'dart:io';
import 'package:course_app/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {

   String url,title;


   VideoScreen({required this.url,required this.title});


  @override
  State<VideoScreen> createState() => _VideoDetailsState();
}
class _VideoDetailsState extends State<VideoScreen> {



  late String url;
  late YoutubePlayerController controller;

  @override
  void initState() {

    super.initState();
    url=widget.url;
 controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
    //  'https://www.youtube.com/watch?v=GD3jbAPe_XY',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

  }

  @override
  void deactivate() {
    super.deactivate();
    controller.pause();
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      builder: (context,player)=>

   Scaffold(
     appBar: AppBar(
       elevation: 0,
       backgroundColor:Color.fromARGB(255, 116, 27, 27),
       toolbarHeight: 1,
     ),
         body:


        Column(
          children: [

            Container(
                height:380,
                child: player),

          ],
        ),
     ),
      player:
      YoutubePlayer(

        controller: controller,

        showVideoProgressIndicator: true,

        liveUIColor: Colors.amber,
        // bottomActions: [
        //   CurrentPosition(),
        //   ProgressBar(isExpanded: true),
        //   //     TotalDuration(),
        // ],

      ),

    );
  }
}
