import 'dart:io';
import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get_storage/get_storage.dart';
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
  String? email;
  @override
  void initState() {

    super.initState();
    final box = GetStorage();
     email = box.read('email') ?? "";
    url=widget.url;
 controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
    //  'https://www.youtube.com/watch?v=GD3jbAPe_XY',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
    //addWatermark(context,email??"",columnCount: 1,rowCount: 1);
  });
    
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
    return Scaffold(
        appBar: AppBar(
       elevation: 0,
       backgroundColor:Color.fromARGB(255, 116, 27, 27),
       toolbarHeight: 1,
     ),
     body: Stack(
      children: [
        YoutubePlayerBuilder(
    player: YoutubePlayer(
        controller: controller,
    ),
    builder: (context, player){
        return Column(
            children: [
            Container(
                height:MediaQuery.of(context).size.height*.5,
                child: player),

          ],
        );}
    ),
    IgnorePointer(
      child: Container(
        //color: Colors.green,
        height:MediaQuery.of(context).orientation == Orientation.portrait? MediaQuery.of(context).size.height*.5:MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        child: Center(
          child: Transform.rotate(
            angle: -pi / 10.0,
            child: Row( mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Expanded( // Constrains AutoSizeText to the width of the Row
                           child: AutoSizeText.rich(
                          TextSpan(
               text: email,
               style: TextStyle(fontSize: 200, color: Color(0x20000000),),
                          ),
                          minFontSize: 0,
                          maxFontSize: 2,
                          maxLines: 1,
                          stepGranularity: 0.1,
                          textAlign: TextAlign.center,
                        )
               ),
             ],
                   ),
          ),
        ),
      ),
    )
    
      ],
     ),
    );
  
    
  }
}
