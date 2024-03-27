import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:ui_project/custom_audio_player.dart';
import 'package:ui_project/data.dart';
import 'package:ui_project/service/audio_player_service.dart';

class Player extends StatefulWidget {
  String filePath;
  Player({super.key, required this.filePath});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  
  AudioPlayerService? audioService;

  Future<String> audioConversion(String path) async {
    File mediaFile = File(path);
    Uint8List mediaBytes = await mediaFile.readAsBytes();
    String base64String = base64.encode(mediaBytes);
    return base64String;
  }

  Future<Duration?>? progressFuture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          CustomAudioPlayer(filePath: widget.filePath, onDurationFuture: (pFuture, aService) {
            
            setState(() {
              audioService = aService;
              progressFuture = pFuture;
            });
          },),
          progressFuture == null ? const Text("") : FutureBuilder<Duration?>(
            future: progressFuture,
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator.adaptive()
                  ),
                );
              }
              Duration duration = audioService!
                    .player!
                    .duration ?? const Duration(seconds: 0);
              String sDuration = "${duration.inHours}:${duration.inMinutes.remainder(60)}:${(duration.inSeconds.remainder(60))}"; 
              return TextButton(
                onPressed: () async {
                  String base64Audio = await audioConversion(widget.filePath);
                  Data data = Data();
                  data.base64EncodeString = base64Audio;
                  data.duration = sDuration;
                  print(data.duration);
                  //TODO Call service to upload audio file
                },
                child: const Text('Upload'));
            },
          )
        ],
      )),
    );
  }
}