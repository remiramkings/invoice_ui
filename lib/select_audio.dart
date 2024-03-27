import 'package:flutter/material.dart';
import 'package:ui_project/audioFileSelector.dart';

class SelectAudio extends StatefulWidget {
  const SelectAudio({super.key});

  @override
  State<SelectAudio> createState() => _SelectAudioState();
}

class _SelectAudioState extends State<SelectAudio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        InkWell(child: Icon(Icons.audio_file),
        onTap: (){
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => AudioFileSelector()));
              },
        )
      ],),
    );
  }
}