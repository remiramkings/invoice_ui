import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ui_project/custom_audio_player.dart';
import 'model/file_object.dart';
import 'package:video_player/video_player.dart';

class FilePreviewPopUp extends StatefulWidget {
  FileObject fileObject;
  FilePreviewPopUp({super.key,
   required this.fileObject});

  @override
  State<FilePreviewPopUp> createState() => _FilePreviewPopUpState();
}

class _FilePreviewPopUpState extends State<FilePreviewPopUp> {

  String mediaType = '';
  VideoPlayerController? _videoPlayerController;

  String getMediaType(String extension) {
    return FileExtensions[extension] ?? '';
  }

  @override
  initState(){
    super.initState();
    setState(() {
      mediaType = getMediaType(widget.fileObject['extension'] ?? '');
    });

  //  Timer(Duration(seconds: 5),()=>(initializeMedia()));
    
  }

  initializeMedia(){
    switch(mediaType){
      case 'video':
        initializeVideoPlayer();
        break;
    }
  }

  Widget showMedia(){
    switch(mediaType){
      case 'image':
        return showImageMedia();
      case 'video':
        return showVideoMedia();
      case 'audio':
        return showPlayAudioMedia();
      default: 
        return const Text('Media not support');
    }
  }

  Widget showPlayAudioMedia() {
    return CustomAudioPlayer(filePath: widget.fileObject['path'] ?? '',);
  }

  Image showImageMedia(){
    return Image.file(File(widget.fileObject['path'] ?? ''));
  }

  initializeVideoPlayer(){
    _videoPlayerController = VideoPlayerController.file(
      File(widget.fileObject['path'] ?? '')
    )
    ..initialize()
      .then((value) {setState(() {});});
  }

  Widget showVideoMedia(){
    return Stack(
      children: [
        Container(
          child: InkWell(
            child: Icon(Icons.play_arrow),
            onTap: (){
              initializeMedia();
            },
          ),
        ),
         (_videoPlayerController == null) ? Text('') :FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the video.
          return AspectRatio(
            aspectRatio: _videoPlayerController!.value.aspectRatio,
            // Use the VideoPlayer widget to display the video.
            child: VideoPlayer(_videoPlayerController!),
          );
        } else if(snapshot.hasError){
          throw snapshot.hasError;
        }
        else
        {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    )

      ],
    ); 
    
   
  }

  bool isAudio(){
    return getMediaType(widget.fileObject['extension'] ?? "") == "audio";
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isAudio()?190:350,
      child: showMedia(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if(_videoPlayerController != null){
      _videoPlayerController!.dispose();
    }
  }
}