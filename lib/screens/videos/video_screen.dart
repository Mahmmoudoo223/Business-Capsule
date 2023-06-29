import 'dart:io';
import 'package:course_app/resources/color_manager.dart';
import 'package:course_app/screens/videos/watermark_widget.dart';
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
  OverlayEntry? _overlayEntry;
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
    addWatermark(context,email??"",columnCount: 1,rowCount: 1);
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
    _overlayEntry?.remove();
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
         body:Column(
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

      ));
  
    
  }

  void addWatermark(BuildContext context, String watermark,
    {int rowCount = 3, int columnCount = 10}) async {
  if (_overlayEntry != null) {
    _overlayEntry!.remove();
  }
  OverlayState overlayState = Overlay.of(context);
  _overlayEntry = OverlayEntry(
      builder: (context) => Watarmark(
            rowCount: rowCount,
            columnCount: columnCount,
            text: watermark,
          ));
  overlayState.insert(_overlayEntry!);
  // return await _methodChannel.invokeMethod<void>("addWatermark", ['I am a watermark']);
}
}
